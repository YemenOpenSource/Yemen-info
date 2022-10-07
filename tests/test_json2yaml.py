import pytest
from utilities.json2yaml import json_to_yaml


class TestJson2Yaml:
    def test_json2yaml(self):
        """Convert normal json to yaml"""
        json = {
            "key": "value"
        }
        yaml = json_to_yaml(json)
        assert yaml == "key: value\n"

    def test_json2yaml_json_with_list(self):
        """Convert json contains list to yaml"""
        json = {
            "key": "value",
            "items": [1, 2, 3, 4]
        }
        yaml = json_to_yaml(json)
        assert yaml == "key: value\nitems:\n- 1\n- 2\n- 3\n- 4\n"

    def test_json2yaml_json_with_dict(self):
        """Convert json contains dict to yaml"""
        json = {
            "dict": {
                "key": "value"
            }
        }
        yaml = json_to_yaml(json)
        assert yaml == "dict:\n  key: value\n"

    def test_json2yaml_not_json(self):
        json = "{key: value}"
        with pytest.raises(ValueError) as err:
            json_to_yaml(json)
        assert "you must enter the json data fully as dictionary." == str(err.value)
