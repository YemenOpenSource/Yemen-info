# Go to https://data.page/json/csv to convert (even to Excel format)

# TODO
# 1. make a code to convert yemen.json to yemen.xlsx
# 2. utilize GitHub actions to automate this process after any changes in the yemen.json file
import openpyxl as excel
import csv


def csv_to_excel(csv_file_path: str, excel_file_path: str) -> None:
    """
    Function to convert csv content to Excel file
    :param csv_file_path: the path of the csv file
    :param excel_file_path: the path of the Excel file
    :return: None
    """

    if not (isinstance(csv_file_path, str) and isinstance(excel_file_path, str)):
        raise ValueError("All the paths must be string.")

    csv_data = []
    with open(csv_file_path, encoding="utf-16") as file_obj:
        reader = csv.reader(file_obj)
        for row in reader:
            csv_data.append(row)
    workbook = excel.Workbook()
    sheet = workbook.active
    sheet.title = "Yemen-Info"
    for row in csv_data:
        sheet.append(row)
    workbook.save(excel_file_path)

