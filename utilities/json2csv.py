# Go to https://data.page/json/csv to convert

# TODO
# 1. make a code to convert yemen.json to yemen.csv
# 2. utilize GitHub actions to automate this process after any changes in the yemen.json file
from urllib.parse import urlencode
from urllib.request import Request, urlopen


def json_2_csv(json_data: dict) -> str:
    """
    Function to send the json data object to the defined api_url to receive the csv version of the data
    :param json_data: the dictionary to be converted to csv object
    :returns: a csv text as string.
    """

    if not isinstance(json_data, dict):
        raise ValueError("enter the json_data as dictionary.")

    json_data = {
        "json": json_data,
    }

    api_url = "https://data.page/api/getcsv"
    headers = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) "
                      "Chrome/35.0.1916.47 Safari/537.36"
    }

    request = Request(api_url, urlencode(json_data).encode(), headers=headers)
    csv = urlopen(request).read().decode()
    return csv
