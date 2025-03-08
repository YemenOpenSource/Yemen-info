# Yemen Info

Here are some files for the most important information for Yemen programmatically. We have information about Yemeni governorates, districts, uzaal and villages in both Arabic and English languages.
The Arabic names are introduced in many forms: with Tashkeel, without it, and as a normalized text.
The English names are provided as close as possible to the Arabic name, and we have another format as a normalized text. These normalized texts are very useful for searching on the web or mobile applications.

## Why?

Many governments have open data centers with an incredible amount of information that is very useful for programmers, data scientists, and researchers. Unfortunately, we don't have something like this so we decided to build it ourselves.
For example, a simple question such as: "What are the governorate, districts, and uzaal of Yemen with the right pronunciation" is not answerable because of the lack of information.
This repository will help. Yes a little, but it is helpful!

## Methodology and Notes

- Capital Districts are chosen for every governorate except Amant Al-Asmah, Sanaa, and Aden. regarding the Yemeni governorates. If there is a match between the name of the governorate capital and one of the districts, that makes this district the capital. Sometimes Capital has a suffix "City", and that doesn't affect that it is the capital among other districts. For example, Amran's capital is "Amran City", and one of the districts is called "Amran", They are the same thing. So, Why didn't add "City" to the districts as well? because we strictly stick to the official documents.

- We choose to put the capital name in the same degree as the governorate, not in inner degree, to make it easier to grab the information and because some governorate does not have capital as we mentioned above.

- We have done our best to make the information accurate, but we don't make any warranty whatsoever for the accuracy of the information provided. If you know any mistakes you are sure about, we are more than welcome to correct them.

- We have done our research in February 2024. So, if our information is outdated because of the changes in the governorate and districts, we hope to update this repo with the latest information.

- We have chosen the Fusha pronunciation over some local pronunciations in the Tashkeel.

- Our Arabic Tashkeel is the ultimate way of pronunciation. If the English version contrasts with the Arabic version, the Arabic version is probably the correct pronunciation, and, as always, if you are sure about more correct pronunciation, tell us to fix it.

- In the English version of the governorate/districts we chose to Add **Al** as a representative of "أل التعريف" in Arabic because we think that this prefix is an identifier and we can remove it in different contexts when we are talking about the governorate/districts. For example, make the Arabic version of "التحرير" district is: "Al-Tahrir" instead of "At Tahrir" which some people/organizations prefer. We prefer the first version. If you prefer the second version of naming governorate/districts in English, you may check [this website](https://yemenlg.org/governorates/).

- We made a normalized version for every governorate and district. Our methodology in Arabic text is by using [Ar-PHP](https://ar-php.org/github/examples/standard.php) algorithms for Arabic text normalization. For English text we have made changes to the text: 1. remove apostrophes ('), 2. replace dashes (-) with one blank space. All of this text normalization we made is to help get better results when searching either in Arabic or English.

- On February 10th 2023, we added a list of uzaal for each district. But the data is not accurate 100%, as is the case in the governorates and districts, and we also did not add the Tashkeel because we cannot verify them. We put the English name as we received it from the excel file, so, for example, we find in this English name the use of the name of the uzlah of “الزبيرات” with this English name “Az Zubayrat” instead of “ Al Zubayrat", we did not adhere to Tashkeel here as the districts because we are not sure of the accuracy of the data of the uzaal.

- And on February 10th 2024, we added a list of villages for each uzlah, And what applies to the uzaal data applies also to the villages data.

## How to use it

Simply, just download the [yemen-info.json](https://github.com/YemenOpenSource/Yemen-info/blob/main/yemen-info.json) file and use it however you want. It is a JSON file, so it is language agnostic, and most programming languages support it easily.

We have different formats with the same information you can use if you prefer in [automated](https://github.com/YemenOpenSource/Yemen-info/tree/main/automated) folder like: [yemen-info.csv](./automated/yemen-info.csv), [yemen-info.xlsx](./automated/yemen-info.xlsx) (Microsoft EXCEL format), [yemen-info.xml](./automated/yemen-info.xml), [yemen-info.yml](./automated/yemen-info.yml), [yemen-info-mysql.sql](./automated/yemen-info-mysql.sql), and [yemen-info-sqlite.sql](./automated/yemen-info-sqlite.sql).

You can also use the [cspell dictionary file Here](https://github.com/YemenOpenSource/Yemen-info/blob/main/.cspell/custom-dictionary-workspace.txt) to ignore Yemeni districts'/governorate's names from underlined spell checker. This was a side effect of the main goal but we are thankful for it. You can find it and copy the text and paste it into any text editor that has the functionality of a spelling dictionary and the user dictionary, like Microsoft Word, LibreOffice, or Even [Arabic - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-arabic) extension on VS Code.

> By the way, we have contributed in Yemen Open Source to the previous plugin, and you can find more on [this link](https://github.com/YemenOpenSource/impactful-contributions).

## Features

✅ Arabic Tashkeel to every governorate and every district, in addition to a copy without Tashkeel.

✅ Multiple formats: JSON, CSV, XLSX, XML, Yaml, and SQL.

✅ Phone numbering plan (code prefix) for every governorate.

✅ Custom cspell dictionary for spell checkers, to ignore Yemeni governorates' or districts' names.

✅ A unique id for every governorate and district.

✅ Capital districts for every governorate.

✅ Text normalization for every governorate/district in both Arabic and English. (very good for search).

✅ Several formats such as CSV, XLSX (Microsoft EXCEL format), XML, YAML, and SQL formats.

✅ A Readme file in Arabic and English languages.

✅ Uzaal names for every district.

✅ Scripts to convert JSON file programmatically to: CSV, XML, XLSX, YAML, SQL.

✅ Automate conversion scripts after any modification to `yemen-info.json` file using GitHub Action. So all data are in sync in all formats.

✅ Villages names for every uzlah (new).

# How To contribute

You can make an issue if you find any mistakes or you have any suggestions or create a pull request.

Our `yemen-info.json` is the main source of data. If you change something on `yemen-info.json` these files will be changed automatically:

- [yemen-info.csv](./automated/yemen-info.csv),
- [yemen-info.xlsx](./automated/yemen-info.xlsx),
- [yemen-info.xml](./automated/yemen-info.xml),
- [yemen-info.yml](./automated/yemen-info.yml),
- [yemen-info-mysql.sql](./automated/yemen-info-mysql.sql),
- [yemen-info-sqlite.sql](./automated/yemen-info-sqlite.sql).

We also remind you to update the [README.md](./README.md) and [README.en.md](./README.en.md) files if the changes are related to them.

## Later On Future (out of our scope now)

This list is for todos that are not in our scope now, but if we have time and resources we may do it, or we can do it separately in another repo.

- Add polygon for map coordinates.
- Add latitude and longitude for map coordinates in governorates'/districts' centers.
- Add a useful and joyful JS map like [this](https://yemenlg.org/ar/).

## Resources

some resources that helped us to build this project:

- [Modaqiq](https://dictionary.alc.ae/modaqiq) was used for automatic Tashkeel before we checked it ourselves.
- [Grammarly](https://app.grammarly.com/) was a great help to correct spelling and grammar errors in this English version of the readme file.
- [Countries States Cities Database](https://github.com/dr5hn/countries-states-cities-database) helped us with the general information about Yemen.
- [Local governorate in Yemen](https://yemenlg.org/ar/%d8%a7%d9%84%d9%85%d8%ad%d8%a7%d9%81%d8%b8%d8%a7%d8%aa/) helped with data about districts within every governorate, with the English version of governorate and districts names.
- [Yemen Information Center](https://yemen-nic.info/yemen/gover/) helped besides the previous resource above.
- [Yemen Embassy- Cairo](http://www.yemenembassy-cairo.com/aboutyemen6.asp) Was used to know every governorate capital.
- [Ar-PHP](https://github.com/khaled-alshamaa/ar-php) was used to text normalized all districts and governorates. Thanks, Eng. [Khaled Alshamaa](https://github.com/khaled-alshamaa).
- [Excel file contains Yemeni uzaal](https://data.humdata.org/dataset/6b2656e2-b915-4671-bfed-468d5edcd80a/resource/a0385cba-d2c7-4ced-802f-895255aac3ca/download/yem_admin_ochayemen_20191002.xlsx) we have used this file to add uzaal for every district.

# Thanks

For all contributors for this project:

<a href="https://github.com/YemenOpenSource/Yemen-info/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Yemeni-Open-Source/Yemen-info" />
</a>

<br />

But also other people who helped us with some of the names of Yemeni governorate and districts, and they are in alphabetical order:

- أمجد الهتاري
- صفوان بنيان
- ضياء الجبوبي
- طلال محرم
- عبداللطيف الرداعي
- يعقوب الكهادي
