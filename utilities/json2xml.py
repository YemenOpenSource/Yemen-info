# Go to https://www.convertjson.com/json-to-xml.htm to convert

# TODO
# 1. make a code to convert yemen.json to yemen.xml
# 2. utilize GitHub actions to automate this process after any changes in the yemen.json file
import xml.etree.cElementTree as xMl


def _to_xml(key: str, data: dict | list) -> xMl.Element:
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
