from ast import parse
from codecs import ascii_encode
import json
import pprint
from collections import defaultdict
import pyarabic.araby as araby
import pyarabic.number as number
from collections import OrderedDict
from operator import getitem


################################
# Define Functions
################################


def read_json_file(file_path: str) -> dict:
    """
    read the content of json file, and return its content
    :param file_path: the path of the json file.
    :returns: dictionary of the json data.
    """
    with open(file_path) as file:
        data = json.load(file)
        file.close()
        return data


def write_json_file(file_path: str, data: dict) -> None:
    """
    writes the given dictionary to a json file
    :param file_path: the path of the json file
    :param data: the data that will be dumped to json file.
    """
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=4, ensure_ascii=False)
        file.close()
        return


def remove_duplication():
    # TODO: Just remove any duplication, if someone add the same district or city, it will be removed automatically.
    json_file = read_json_file('./yemen-info.json')
    # TODO


def sort_json_by_governorate_name(file_path):
    json_data = read_json_file(file_path)
    workflows = json_data["governorates"]

    sorted_data = sorted(workflows, key=lambda d: d["name_en"])

    # TODO Watheq: the next line will only write the list of governorates, not all the yemeni info dictionary.
    #  is it fine?
    write_json_file("./yemen-info-sorted-by-governorate-name-en.json",
                    sorted_data)  # TODO keep the original structure like "Governorates"
    # TODO
    return 'Complete sorting by `governorate name_en` name'


def sort_governorates_by_name_ar(file_path):
    # TODO
    return 'Complete sorting by `governorate name_en` name'


def sort_governorate_districts_by_name_en(file_path: str) -> str:
    """
    sort the districts in every governorate by name_en
    :param file_path: the path of the json file
    :returns: message denoting the completion of sorting.
    """
    json_data = read_json_file(file_path)

    governorates = json_data.get("governorates")
    for governorate in governorates:
        districts = governorate.get("districts")
        districts = sorted(districts, key=lambda district: district.get("name_en"))
        governorate["districts"] = districts

    json_data["governorates"] = governorates
    write_json_file("./yemen-info-governorate-sorted-by-district-name-en.json", json_data)

    return "Completed sorting by districts' name_en."


def sort_governorate_districts_by_name_ar(file_path: str) -> str:
    """
    sort the districts in every governorate by name_ar
    :param file_path: the path of the json file
    :returns: message denoting the completion of sorting.
    """

    json_data = read_json_file(file_path)

    governorates = json_data.get("governorates")
    for governorate in governorates:
        districts = governorate.get("districts")
        districts = sorted(districts, key=lambda district: district.get("name_ar"))
        governorate["districts"] = districts

    json_data["governorates"] = governorates
    write_json_file("./yemen-info-governorate-sorted-by-district-name-ar.json", json_data)

    return "Completed sorting by districts' name_ar."


# TODO Watheq: what do you think?
#  the above 2 functions can be merged as one like this:
"""
def sort_governorate_districts_by_name_(file_path: str, language: str) -> str:
    json_data = read_json_file(file_path)

    governorates = json_data.get("governorates")
    for governorate in governorates:
        districts = governorate.get("districts")
        districts = sorted(districts, key=lambda district: district.get(f"name_{language}"))
        governorate["districts"] = districts

    json_data["governorates"] = governorates
    write_json_file(f"yemen-info-governorate-sorted-by-district-name-{language}.json", json_data)

    return f"Completed sorting by districts' name_{language}."
"""


def convert_json_to_csv():
    json_file = read_json_file('./yemen-info.json')
    # TODO


def convert_json_to_sql():
    json_file = read_json_file('./yemen-info.json')
    # TODO


def convert_json_to_xml(file_path: str) -> str:
    """
    Convert json or dictionary to xml and write it to a file
    :returns message donating the completion of conversion
    """
    import xml.etree.cElementTree as xMl

    def _to_xml(key: str, data: dict | list) -> xMl.Element:
        """
        this is a helper function which will be called to convert list and dictionary to xml
        :param key: the current key in the json/dictionary
        :param data: the data of the key
        :return: xml element that contains sub-elements built from list or dictionary
        """
        if isinstance(data, list):
            _root = xMl.Element(key)
            for element in data:
                if type(element) not in (dict, list):
                    item = xMl.Element("item")
                    item.text = str(element)
                    _root.append(item)
                else:
                    _root.append(_to_xml(key=key[:-1], data=element))
            return _root
        elif isinstance(data, dict):
            _root = xMl.Element(key)
            for _key, _value in data.items():
                if type(_value) not in (dict, list):
                    ele = xMl.Element(str(_key))
                    ele.text = str(_value)
                    _root.append(ele)
                else:
                    _root.append(_to_xml(_key, _value))
            return _root

    json_data = read_json_file(file_path)
    root = xMl.Element("Yemen")
    for key, value in json_data.items():
        if type(value) not in (dict, list):
            xMl.SubElement(root, key).text = value
        else:
            root.append(_to_xml(key, value))
    xMl.ElementTree(root).write("./yemen-info.xml", encoding="utf-16")
    return "Completed converting json to xml"


def convert_json_to_yaml():
    json_file = read_json_file('./yemen-info.json')
    # TODO


def add_all_yemeni_names_to_custom_dictionary():
    json_file = read_json_file('./yemen-info.json')
    # TODO


def add_tashkeel_to_governorates_and_cities():
    json_file = read_json_file('./yemen-info.json')
    # TODO
    # loop around every governorate and add name_ar_tashkeel
    for gov in json_file['governorates']:
        # add name_ar_tashkeel to governorate obj
        gov['name_ar_tashkeel'] = gov['name_ar']
        # loop around every city in governorate and add name_ar_tashkeel
        for city in gov['cities']:
            city['name_ar_tashkeel'] = city['name_ar']

    write_json_file('./yemen2.json', json_file)


def get_all_governorates_cities_name_ar_tashkeel():
    gov_names = []
    cities_names = []

    json_file = read_json_file('./yemen2.json')
    for gov in json_file['governorates']:
        gov_names.append({'name_ar_tashkeel': gov['name_ar_tashkeel'], 'name_en': gov['name_en']})
        for city in gov['cities']:
            cities_names.append({'name_ar_tashkeel': city['name_ar_tashkeel'], 'name_en': city['name_en']})

    write_json_file('./yemen3.json', {'governorates': gov_names, 'cities': cities_names})


def add_id_for_each_item():
    json_file = read_json_file('./yemen-info.json')

    for (i, gov) in enumerate(json_file['governorates']):
        for (j, city) in enumerate(gov['districts']):
            city['id'] = int(j + 1)

    write_json_file('./output.json', json_file)


################################
# Using Functions
################################
sort_json_by_governorate_name("../yemen-info.json")
# sort_json_by_districts_name('./yemen-info.json)
sort_governorate_districts_by_name_en("../yemen-info.json")
sort_governorate_districts_by_name_ar("../yemen-info.json")
convert_json_to_xml("../yemen-info.json")
