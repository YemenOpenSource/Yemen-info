from ast import parse
from codecs import ascii_encode
import json
import pprint
from collections import defaultdict
import pyarabic.araby as araby
import pyarabic.number as number

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
    workflows = json_data["governorates"]

    sorted_data = sorted(workflows, key=lambda d: d["name_en"])

    write_json_file('output.json', sorted_data)  # TODO keep the original structure like "Governorates"
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


def add_tashkeel_to_governorates_and_cities():
    json_file = read_json_file('./yemen.json')
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
    json_file = read_json_file('./yemen.json')

    # convert this code to python
    # for (let i = 0; i < yemen.length; i++) {
    #     yemen[i].id = i;
    #     for (let j = 0; j < yemen[i].districts.length; j++) {
    #         yemen[i].districts[j].id = j;
    #     }
    # }

    for (i, gov) in enumerate(json_file['governorates']):
        for (j, city) in enumerate(gov['districts']):
            city['id'] = int(j+1)

    write_json_file('./output.json', json_file)


################################
# Using Functions
################################
sort_json_by_governorate_name('./yemen.json')
