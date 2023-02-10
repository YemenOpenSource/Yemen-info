# Go to https://www.convertjson.com/json-to-xml.htm to convert

# TODO
# 1. make a code to convert yemen.json to yemen.xml
# 2. utilize GitHub actions to automate this process after any changes in the yemen.json file
import xml.etree.cElementTree as xMl
from typing import Union


def json_2_xml(root: xMl.Element = xMl.Element("root"), json_data: dict = {}) -> xMl.Element:
    """
    to convert a json object's data to xml tree
    :param root: the first node in the xml tree
    :param json_data: the json object
    :return: an xml tree that contains the first node with the converted data
                as child nodes
    """

    if not isinstance(root, xMl.Element):
        raise ValueError("You must provide root as xml element.")

    if not isinstance(json_data, dict):
        raise ValueError("You must provide json_data as dictionary.")

    def _to_xml(key: str, data: Union[dict, list]) -> xMl.Element:
        """
        function to convert list and dictionary to xml
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
                    key = key[:-1] if key.endswith("s") else key
                    _root.append(_to_xml(key=key, data=element))
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

    for key, value in json_data.items():
        if type(value) not in (dict, list):
            xMl.SubElement(root, key).text = str(value)
        else:
            root.append(_to_xml(key, value))
    return root
