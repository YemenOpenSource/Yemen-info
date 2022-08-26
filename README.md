# Yemen-info

Here are some files for the most important information for Yemen programmatically. We have information about Yemeni governance, and districts in both Arabic and English languages.
The Arabic names are introduced in many forms: with Tashkeel, without it, and as a normalized text.
The English names are provided as close as possible to the Arabic name, and we have another format as a normalized text. These normalized texts are very useful for searching on the web or mobile applications.

## Why?

Many governments have open data centers with an incredible amount of information that is very useful for programmers, data scientists, and researchers. Unfortunately, we don't have something like this so we decided to build it ourselves.
For example, a simple question as: "What are the governance and districts of Yemen with the right pronunciation" is not answerable because of the lack of information.
This repository will help. Yes a little, it is helpful!

## Methodology and Notes

- Capital Districts are chosen for every governance except Amant Al-Asmah, Sanaa, and Aden. regarding the Yemeni governorate. If there is a match between the name of the governance capital and one of the districts, that makes this district the capital. Sometimes Capital has a suffix "City", and that doesn't affect that it is the capital among other districts. For example, Amran's capital is "Amran City", and one of the districts is called "Amran", They are the same thing. So, Why didn't add "City" to the districts as well? because we strictly stick to the official documents.

- We choose to put the capital name underneath the governance directly to make it easier to grab the information and because some governance does not have capital as we mentioned above.

- We have done our best to make the information accurate, but we don't make any warranty whatsoever for the accuracy of the information provided. If you know any mistakes you are sure about, we are more than welcome to correct them.

- We have done our research in August 2022. So, if our information is outdated because of the changes in the governance and districts, we hope to update this repo with the latest information.

- We have chosen the Fusha pronunciation over some local pronunciations in the Tashkeel.

- Our Arabic Tashkeel is the ultimate way of pronunciation. If the English version contrasts with the Arabic version, the Arabic version is probably the correct pronunciation, and, as always, if you are sure about more correct pronunciation, tell us to fix it.

- In the English version of the governance/districts we chose to Add **Al** as a representative of "أل التعريف" in Arabic because we think that this prefix is an identifier and we can remove it in different contexts when we are talking about the governance/districts. For example, make the Arabic version of "التحرير" district is: "Al-Tahrir" instead of "At Tahrir" which some people/organizations prefer. We prefer the first version. If you prefer the second version of naming governance/districts in English, you may check [this website](https://yemenlg.org/governorates/).

- We made a normalized version for every governance and district. Out methodology in Arabic text is by using [Ar-PHP](https://ar-php.org/github/examples/standard.php) algorithms for Arabic text normalization. For English text we have made changes to the text: 1. remove apostrophes ('), 2. replace dashes (-) with one blank space. All of this text normalization we made is to help get better results when searching either in Arabic or English.

## How to use it

Simply, just download the [yemen.json](https://github.com/Yemeni-Open-Source/Yemen-info/blob/main/yemen.json) file and use it however you want. It is a JSON file, so it is language agnostic, and most programming languages support it easily.

You can also use the [cspell dictionary file Here](https://github.com/Yemeni-Open-Source/Yemen-info/blob/main/.cspell/custom-dictionary-workspace.txt) to ignore Yemeni cities/governance's names from underlined spell checker. This was a side effect of the main goal but we are thankful for it.

## Features

✅ Arabic Tashkeel to every governance and every districts.
✅ Phone numbering plan (code prefix) for every governance.
✅ Custom cspell dictionary for spell checkers, to ignore Yemeni governance/districts names.
[Here](https://github.com/Yemeni-Open-Source/Yemen-info/blob/main/.cspell/custom-dictionary-workspace.txt) you can find it and copy the text and paste it into any text editor that has the functionality of a spelling dictionary and the user dictionary, like Microsoft Word, LibreOffice, or Even [Arabic - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-arabic) extension on VS Code.
✅ A unique id for every governance and district.
✅ Capital districts for every governance.
✅ Text normalization for every governance/district in both Arabic and English. (very good for search).
✅ There are several formats such as CSV, XLSX (Microsoft EXCEL format), XML, YAML, and SQL formats.

## TODO

- [ ] Add an SQL format with relationships to make it easy to grab it into your database.
- [ ] Add an No-SQL formats like mongoose Schema to make it easy to grab it into your database.
- [ ] Add a GraphQL format to make it easy to grab it into your database.
- [ ] Add script to convert json file programmatically to: CSV, XML, XLSX, YAML, and any future formats.
- [ ] Add GitHub actions file to automate the process after any commit or changes to the `yemen.json` file.

# How To contribute

You can make an issue if you find any mistake or you have any suggestions, or create a pull request. Our `yemen.json` is the main source of data. If you change something on `yemen.json` you will do us a favor if you add the same change to other files with different formats like: [yemen.csv]('./other-formats/yemen.csv'), [yemen.xlsx](./other-formats/yemen.xlsx), [yemen.xml](./other-formats/yemen.xml), [yemen.yml]('./other-formats/yemen.yml'), and any other future formats.
We may automate the process using python code with GitHub actions, and we are welcoming contribution in this area, it will help us a lot.

## Later On Future

This list is for todos that are not in our scope now, but if we have time and resources we may do it, or we can do it separately in another repo.

- [ ] Add polygon for map coordinates.
- [ ] Add latitude and longitude for map coordinates in governance / districts centers.
- [ ] add useful and joyful JS map like [this](https://yemenlg.org/ar/).

## Resources

some resources that helped us to build this project:

- [Modaqiq](https://dictionary.alc.ae/modaqiq) was used for automatic Tashkeel before we checked it ourselves.
- [Countries States Cities Database](https://github.com/dr5hn/countries-states-cities-database) helped us with the general information about Yemen.
- [Local Governance in Yemen](https://yemenlg.org/ar/%d8%a7%d9%84%d9%85%d8%ad%d8%a7%d9%81%d8%b8%d8%a7%d8%aa/) helped with data about districts within every governance, with the English version of governance and districts names.
- [Yemen Information Center](https://yemen-nic.info/yemen/gover/) helped besides the previous resource.
- [Yemen Embassy- Cairo](http://www.yemenembassy-cairo.com/aboutyemen6.asp) Was used to know every governance capital.
- [Ar-PHP](https://github.com/khaled-alshamaa/ar-php) was used to text normalized all districts and governance. Thanks, Eng. [Khaled Alshamaa](https://github.com/khaled-alshamaa).

# Thanks

For all people who contributed to this repository. You can find the contributors on the [Contributors Page](https://github.com/Yemeni-Open-Source/Yemen-info/graphs/contributors).

But also other people who helped us with some of the names of Yemeni governance and districts, and are:

- ضياء الجبوبي
- صفوان بنيان
- يعقوب الكهادي
- طلال محرم
- عبداللطيف الرداعي
- أمجد الهتاري
