# Go to https://www.json2yaml.com/ to convert

# TODO
# 1. make a code to convert yemen.json to yemen.yml
# 2. utilize GitHub actions to automate this process after any changes in the yemen.json file

import yaml


def json_2_yaml(json_data: dict) -> str:
	"""
	Function which will convert json string object to yaml string
	:param json_data: the json string which will be converted to yaml
	:return: a string that contains the yaml representation of json.
	"""
	
	if not (json_data and isinstance(json_data, dict)):
		raise ValueError("you must enter the json data fully as dictionary.")
	
	result = yaml.dump(json_data, allow_unicode=True, sort_keys=False)
	return result

	# we can also benefit from the API of json2yaml website like this 👇:
	# from requests import post
	# import json

	# json_data = {
	# 	"q": json.dumps(json_data)
	# }
	# res = post("https://json2yaml.com/api/j2y", data=json_data)
	# if res.status_code == 200:
	# 	return res.text
