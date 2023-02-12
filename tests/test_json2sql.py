import json
import pytest
from utilities.json2sql import json_2_sql


class TestJson2SQL:
    # TODO (Abdullah): create tests for converting from JSON to SQL
    #  in both formats (SQL and SQLite)
    # TODO (NOT DONE)
    ...
    # def test_json2sql_key_value(self, root):
    #     dictionary = '{"key1": "value1", "key2": 2}'
    #     json_data = json.loads(dictionary)
    #     converted_data = json_2_sql(json_data)
    #     text = "<root><key1>value1</key1><key2>2</key2></root>"
    #     assert converted_data == text, "check the conversion of key value pair"