import json
import pytest
from utilities.json2xml import json_2_xml, xMl


class TestJson2Xml:

    def test_json2xml_key_value(self, root):
        dictionary = '{"key1": "value1", "key2": 2}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><key1>value1</key1><key2>2</key2></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of key value pair"

    def test_json2xml_key_value_list(self, root):
        """Test convert dictionary which key's value is list to xml"""
        dictionary = '{"items": [1, 2, 3, 4, 5, 6]}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><items><item>1</item><item>2</item><item>3</item><item>4</item><item>5</item><item>6</item" \
               "></items></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of list"

    def test_json2xml_key_value_list_of_lists(self, root):
        """Test convert dictionary which key's value is a list of lists to xml"""
        dictionary = '{"items": [[1, "2", 3], [4, 5, "6"]]}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><items><item><item>1</item><item>2</item><item>3</item></item>" \
               "<item><item>4</item><item>5</item><item>6</item></item></items></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of list of lists"

    def test_json2xml_key_value_list_of_dicts(self, root):
        """Test convert dictionary which key's value is a list of dicts to xml"""
        dictionary = '{"items": [{"key": "value","key2": 2},{"key": "value","key2": 2}]}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><items><item><key>value</key><key2>2</key2></item><item><key>value</key><key2>2</key2></item>" \
               "</items></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of list of dicts"

    def test_json2xml_key_value_dict(self, root):
        """Test convert dictionary which key's value is a dict to xml"""
        dictionary = '{"key":{"key2": "Hi"}}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><key><key2>Hi</key2></key></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of dict"

    def test_json2xml_key_value_dict_of_list(self, root):
        """Test convert dictionary which key's value is a dict of list to xml"""
        dictionary = '{"key":{"list": ["1", 2, 3]}}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><key><list><item>1</item><item>2</item><item>3</item></list></key></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of dict of list"

    def test_json2xml_key_value_dict_of_dict(self, root):
        """Test convert dictionary which key's value is a dict of dict to xml"""
        dictionary = '{"key":{"dict": {"key": "value"}}}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><key><dict><key>value</key></dict></key></root>"
        assert xMl.tostring(converted_data, encoding="unicode") == text, "check the conversion of dict of dict"

    def test_json2xml_key_value_all_types(self, root):
        """Test convert dictionary which key's value is complex of items to xml"""
        dictionary = '{"key": "value","list": ["ele1", "ele2", "ele3", "ele4"],"listOfDicts": [{"key1":' \
                     '"value1"}, {"key2": "value2"}],"dictOfList": {"list1": ["ele1", "ele2", "ele3"],"list2": [' \
                     '"ele4", "ele5","ele6"]}}'
        json_data = json.loads(dictionary)
        converted_data = json_2_xml(root=root, json_data=json_data)
        text = "<root><key>value</key><list><item>ele1</item><item>ele2</item><item>ele3</item><item>ele4</item" \
               "></list><listOfDicts><listOfDict><key1>value1</key1></listOfDict><listOfDict><key2>value2</key2" \
               "></listOfDict></listOfDicts><dictOfList><list1><item>ele1</item><item>ele2</item><item>ele3</item" \
               "></list1><list2><item>ele4</item><item>ele5</item><item>ele6</item></list2></dictOfList></root>"
        assert xMl.tostring(converted_data).decode() == text, "check the conversion of all types"

    def test_json2xml_no_root(self):
        """Test convert dictionary to xml without root element"""
        dictionary = '{"key": "value","list": ["ele1", "ele2", "ele3", "ele4"],"listOfDicts": [{"key1": "value1"},' \
                     '{"key2": "value2"}],"dictOfList": {"list1": ["ele1", "ele2", "ele3"],' \
                     '"list2": ["ele4", "ele5", "ele6"]}}'
        json_data = json.loads(dictionary)
        with pytest.raises(ValueError) as err:
            json_2_xml(root=None, json_data=json_data)
        assert "You must provide root as xml element." == str(err.value), "check the conversion with no root"

    def test_json2xml_no_json_data(self, root):
        """Test convert dictionary to xml without json_data"""
        with pytest.raises(ValueError) as err:
            json_2_xml(root=root, json_data=None)
        assert "You must provide json_data as dictionary." == str(err.value), "check the conversion with no json_data"

    def test_json2xml_json_data_not_dict(self, root):
        """Test convert dictionary to xml with provided json_data not dict"""
        with pytest.raises(ValueError) as err:
            json_2_xml(root=root, json_data="{Json: toXml}")
        assert "You must provide json_data as dictionary." == str(err.value), \
            "check the conversion with json_data not dictionary"
