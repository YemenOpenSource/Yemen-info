import json
from typing import Union

overall = ""
singular_dict = {
    "countries": "country",
    "timezones": "timezone",
    "translations": "translation",
    "governorates": "governorate",
    "districts": "district"
}
nested_tables = {}
created_tables = {}


def _get_cols_another_tables(json_data: dict):
    cols = []
    another_tables = []
    json_data = json_data if isinstance(json_data, dict) else json_data[0]
    for key, value in json_data.items():
        if key == "id":
            continue
        if isinstance(value, (list, dict)):
            another_tables.append(key)
        else:
            cols.append(key)
    return cols, another_tables


def _create_table(json_data: dict, table_name: str = "countries", reference_table: str = None):
    _overall = ""
    _create_table = f"DROP TABLE IF EXISTS `{table_name}`;\nCREATE TABLE IF NOT EXISTS `{table_name}` ("
    if reference_table:
        _create_table += f"\n\t`{singular_dict.get(reference_table)}_id` bigint UNSIGNED NOT NULL,"
    _create_table += f"\n\t`{singular_dict.get(table_name, table_name)}_id` bigint UNSIGNED PRIMARY KEY NOT NULL,"
    cols, another_tables = _get_cols_another_tables(json_data)
    for col in cols:
        _create_table += f"\n\t`{col}` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL" \
                         f"{',' if col != cols[-1] else ''}"
    if reference_table:
        _create_table += f"{',' if _create_table[-1] != ',' else ''}\n\tCONSTRAINT fk_{singular_dict.get(reference_table)}_{table_name} " \
                         f"FOREIGN KEY (`{singular_dict.get(reference_table)}_id`) " \
                         f"REFERENCES {reference_table}(`{singular_dict.get(reference_table)}_id`)"
    _create_table += "\r)\tENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;\n"
    _overall += _create_table
    _cols = f"{'' if not reference_table else '`' + singular_dict.get(reference_table) + '_id`, '}`{singular_dict.get(table_name, table_name)}_id`, "
    for col in cols:
        _cols += f"`{col}`, "
    _cols = _cols.strip()[:-1]
    return _overall, _cols, another_tables


def get_values(items, table_name, reference_table, reference_table_id):
    if table_name not in nested_tables:
        nested_tables.update({table_name: []})
    for item in items:
        item.update({reference_table: reference_table_id, **item})
        nested_tables.get(table_name).append(item)


def _insert_into_from_list(another_tables, insert_into, json_data, reference_table, reference_table_id, table_name,
                           cols):
    insert_into += f"{str(reference_table_id) if reference_table else ''}"
    for index, items in enumerate(json_data):
        if "id" not in items:
            insert_into += f", {index + 1}"
        for key in items:
            if key not in another_tables:
                insert_into += f", {repr(items.get(key))}"
            else:
                get_values(items.get(key), key, table_name, items.get("id", index+1))
        insert_into += f"),\n({str(reference_table_id)}" if 1 <= index + 1 < len(json_data) else ")\n"
        # for key in another_tables:
        #     sql = _insert_into(items.get(key), key, table_name, items.get("id"), sql, cols, another_tables)

    return insert_into


def _insert_into(json_data: Union[list, dict], table_name: str, reference_table: str, reference_table_id: int, sql: str,
                 cols: str, nested_tables: list):
    insert_into = f"INSERT INTO `{table_name}`\n({cols})\nVALUES\n("
    if isinstance(json_data, list):
        insert_into = _insert_into_from_list(nested_tables, insert_into, json_data, reference_table,
                                             reference_table_id, table_name, cols)
    elif isinstance(json_data, dict):
        insert_into += f"{str(reference_table_id) + ', ' if reference_table else ''}"
        if "id" not in json_data:
            insert_into += f"{reference_table_id if reference_table_id else 1}"  # TODO: here supposed to be the primary key.
            # TODO: if table is created call get_values() function to get (1,2,) values syntax only of the rows
            #  of course take care of the counter to start increasingly
            #  e.g. first object has 10 nested elements, the counter start with the second object from 11

        for key in json_data:
            if key not in nested_tables:
                insert_into += f", {repr(json_data.get(key))}"
        insert_into += ")\n"

    insert_into = insert_into.strip() + ";\n\n"
    sql += insert_into

    return sql


def create_table(json_data: dict, table_name: str = "countries", reference_table: str = None,
                 reference_table_id: int = 1):
    overall = ""
    data = json_data[0] if isinstance(json_data, list) else json_data
    sql, cols, nested_tables = _create_table(json_data=data, table_name=table_name, reference_table=reference_table)
    sql = _insert_into(json_data=json_data, table_name=table_name, reference_table=reference_table,
                       reference_table_id=reference_table_id, sql=sql, cols=cols, nested_tables=nested_tables)
    created_tables.update({table_name: "👍"})
    for table in nested_tables:
        overall += create_table(data.get(table), table, table_name, data.get("id", 1))

    sql += overall
    return sql


def json_to_sql(json_data: dict):
    sql = "DROP DATABASE IF EXISTS `countries`;\n" \
          "CREATE DATABASE IF NOT EXISTS `countries`;\n" \
          "USE `countries`;\n\n"
    sql += create_table(json_data=json_data)
    with open("nested_tables.json", "w") as file:
        file.write(json.dumps(nested_tables))
    return sql
