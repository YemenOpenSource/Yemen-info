from typing import Union

singular_dict = {
    "countries".upper(): "country",
    "timezones".upper(): "timezone",
    "translations".upper(): "translation",
    "governorates".upper(): "governorate",
    "districts".upper(): "district"
}
all_objects = dict()


def _get_list_cols_nested_tables(table_name: str, json_data: dict):
    cols = []
    nested_tables = []
    json_data = json_data if isinstance(json_data, dict) else json_data[0]
    json_data.pop("id", None)
    for key, value in json_data.items():
        if isinstance(value, (list, dict)):
            nested_tables.append(key)
        else:
            cols.append(key)
    all_objects[table_name] = {
        "list_cols": cols,
        "nested_tables": nested_tables
    }


def _create_table(cols: list, table_name: str = "countries", reference_table: str = None):
    create_query = f"DROP TABLE IF EXISTS `{table_name}`;\nCREATE TABLE IF NOT EXISTS `{table_name}` (\n\t"
    create_query += f"`{singular_dict.get(table_name, table_name.lower())}_id` bigint UNSIGNED PRIMARY KEY NOT NULL,"
    if reference_table:
        create_query += f"\n\t`{singular_dict.get(reference_table, reference_table.lower())}_id` bigint UNSIGNED NOT NULL,"
    for col in cols:
        create_query += f"\n\t`{col}` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL" \
                        f"{',' if col != cols[-1] else ''}"
    if reference_table:
        create_query += f",\n\tCONSTRAINT fk_{singular_dict.get(reference_table)}_{table_name} " \
                        f"FOREIGN KEY (`{singular_dict.get(reference_table)}_id`) " \
                        f"REFERENCES {reference_table}(`{singular_dict.get(reference_table)}_id`)"
    create_query += "\n)\tENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;\n"
    _cols = f"`{singular_dict.get(table_name, table_name.lower())}_id`, {'`' + singular_dict.get(reference_table, reference_table.lower()) + '_id`, ' if reference_table else ''}"
    for col in cols:
        _cols += f"`{col}`, "
    cols = _cols.strip(", ")
    all_objects[table_name]["create_query"] = create_query
    all_objects[table_name]["insert_query"] = ""
    all_objects[table_name]["cols"] = cols
    all_objects[table_name]["values"] = ""
    all_objects[table_name]["current_pk"] = "0"


def _insert_into(json_data: Union[list, dict], table_name: str, reference_table: str, reference_table_id: int,
                 cols: str, nested_tables: list):
    insert_query = f"INSERT INTO `{table_name}`\n({cols})\n\tVALUES\n"
    if not all_objects[table_name]["insert_query"]:
        all_objects[table_name]["insert_query"] += insert_query
    if isinstance(json_data, list):
        for item in json_data:
            _insert_from_dict(json_data=item, nested_tables=nested_tables, reference_table=reference_table,
                              reference_table_id=reference_table_id, table_name=table_name)
    elif isinstance(json_data, dict):
        _insert_from_dict(json_data=json_data, nested_tables=nested_tables, reference_table=reference_table,
                          reference_table_id=reference_table_id, table_name=table_name)


def _insert_from_dict(json_data, nested_tables, reference_table, reference_table_id, table_name):
    values = ""
    json_data.pop("id", None)
    current_pk = int(all_objects[table_name]["current_pk"]) + 1
    values += f"({current_pk}, {str(reference_table_id) + ', ' if reference_table else ''}"
    all_objects[table_name]["current_pk"] = str(current_pk)
    for key in json_data:
        if key not in nested_tables:
            value = str(json_data.get(key)).replace("'", '\\\'')
            values += f"'{value}', "
    values = values.strip(", ") + ");\n\n"
    all_objects[table_name]["values"] = all_objects[table_name]["values"].strip().replace(";", ",\n") + values

    for table in nested_tables:
        get_sql(json_data=json_data.get(table), table_name=table, reference_table=table_name,
                reference_table_id=current_pk)


def get_sql(json_data: dict, table_name: str = "countries", reference_table: str = None, reference_table_id: int = 1):
    table_name = table_name.upper()
    data = json_data[0] if isinstance(json_data, list) else json_data
    if table_name not in all_objects:
        _get_list_cols_nested_tables(table_name=table_name, json_data=data)
        _create_table(cols=all_objects[table_name]["list_cols"], table_name=table_name, reference_table=reference_table)
    cols, nested_tables = all_objects[table_name]["cols"], all_objects[table_name]["nested_tables"]
    _insert_into(json_data=json_data, table_name=table_name, reference_table=reference_table,
                 reference_table_id=reference_table_id, cols=cols, nested_tables=nested_tables)


def reduce_all_objects():
    for key in all_objects.keys():
        all_objects.get(key).pop("cols", None)
        all_objects.get(key).pop("current_pk", None)
        all_objects.get(key).pop("list_cols", None)
        all_objects.get(key).pop("nested_tables", None)


def json_2_sql(json_data: dict, database_name: str = "ALL_COUNTRIES", first_table_name: str = "COUNTRIES"):
    all_objects[database_name] = {
        "create_query": f"DROP DATABASE IF EXISTS `{database_name}`;\nCREATE DATABASE IF NOT EXISTS `{database_name}`;\n"
                        f"USE `{database_name}`;\n\n"
    }
    get_sql(json_data=json_data, table_name=first_table_name)
    sql = ""
    reduce_all_objects()
    for key, values in all_objects.items():
        for _key in values.keys():
            try:
                sql += values.get(_key)
            except TypeError:
                ...
    return sql
