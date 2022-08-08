from codecs import ascii_encode
import json
import pprint

################################
# Define Functions
################################


def read_json_file(file_path):
    with open(file_path) as f:
        return json.load(f)


def write_json_file(file_path, data):
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
        return True


def remove_duplication():
    json_file = read_json_file('./yemen.json')
    # TODO

def sort_json_by_governorate_name(file_path):
    json_data = read_json_file(file_path)
    workflows = json_data["Governorates"]

    sorted_data = sorted(workflows, key=lambda d: d["name_en"])

    write_json_file(file_path, sorted_data) # TODO keep the original structure like "Governorates"
    # TODO
    return 'Complete sorting by `governorate name_en` name'

def sort_governorates_by_name_ar(file_path):
    # TODO
    return 'Complete sorting by `governorate name_en` name'

def sort_governorate_cities_by_name_en(file_path):
    return 'Complete sorting by `governorate name_en` name'

def sort_governorate_cities_by_name_ar(file_path):
    return 'Complete sorting by `governorate name_ar` name'


def convert_json_to_csv():
    json_file = read_json_file('./yemen.json')
    # TODO


def convert_json_to_sql():
    json_file = read_json_file('./yemen.json')
    # TODO


def convert_json_to_xml():
    json_file = read_json_file('./yemen.json')
    # TODO


def convert_json_to_yaml():
    json_file = read_json_file('./yemen.json')
    # TODO

def add_all_yemeni_names_to_custom_dictionary():
    json_file = read_json_file('./yemen.json')
    # TODO

################################
# Using Functions
################################
sort_json_by_city_name('./yemen.json')
