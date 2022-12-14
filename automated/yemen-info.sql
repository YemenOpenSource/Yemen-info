DROP DATABASE IF EXISTS `ALL_COUNTRIES`;
CREATE DATABASE IF NOT EXISTS `ALL_COUNTRIES`;
USE `ALL_COUNTRIES`;

DROP TABLE IF EXISTS `COUNTRIES`;
CREATE TABLE IF NOT EXISTS `COUNTRIES` (
	`country_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`arabic_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`iso3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`iso2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`phone_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`capital_english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`capital_arabic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`area_in_kilometer_square` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`currency_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`currency_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`tld` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`subregion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`emoji` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`emojiU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `COUNTRIES`
(`country_id`, `english_name`, `arabic_name`, `iso3`, `iso2`, `phone_code`, `capital_english`, `capital_arabic`, `area_in_kilometer_square`, `currency`, `currency_name_en`, `currency_name_ar`, `currency_symbol`, `tld`, `region`, `subregion`, `latitude`, `longitude`, `emoji`, `emojiU`)
	VALUES
(1, 'Yemen', 'اليَمَن', 'YEM', 'YE', '967', 'Sanaa', 'صنعاء', '555000', 'YER', 'Yemeni rial', 'ريال يمني', '﷼', '.ye', 'Asia', 'Western Asia', '15.00000000', '48.00000000', '🇾🇪', 'U+1F1FE U+1F1EA');

DROP TABLE IF EXISTS `TIMEZONES`;
CREATE TABLE IF NOT EXISTS `TIMEZONES` (
	`timezone_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`country_id` bigint UNSIGNED NOT NULL,
	`zoneName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`gmtOffset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`gmtOffsetName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`abbreviation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`tzName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_country_timezone FOREIGN KEY (`country_id`) REFERENCES COUNTRIES(`country_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `TIMEZONES`
(`timezone_id`, `country_id`, `zoneName`, `gmtOffset`, `gmtOffsetName`, `abbreviation`, `tzName`)
	VALUES
(1, 1, 'Asia/Aden', '10800', 'UTC+03:00', 'AST', 'Arabia Standard Time');

DROP TABLE IF EXISTS `TRANSLATIONS`;
CREATE TABLE IF NOT EXISTS `TRANSLATIONS` (
	`translation_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`country_id` bigint UNSIGNED NOT NULL,
	`kr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`br` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`pt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`nl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`hr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`fa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`de` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`es` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`fr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`ja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`it` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`tr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_country_translation FOREIGN KEY (`country_id`) REFERENCES COUNTRIES(`country_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `TRANSLATIONS`
(`translation_id`, `country_id`, `kr`, `br`, `pt`, `nl`, `hr`, `fa`, `de`, `es`, `fr`, `ja`, `it`, `cn`, `tr`)
	VALUES
(1, 1, '예멘', 'Iêmen', 'Iémen', 'Jemen', 'Jemen', 'یمن', 'Jemen', 'Yemen', 'Yémen', 'イエメン', 'Yemen', '也门', 'Yemen');

DROP TABLE IF EXISTS `GOVERNORATES`;
CREATE TABLE IF NOT EXISTS `GOVERNORATES` (
	`governorate_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`country_id` bigint UNSIGNED NOT NULL,
	`name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar_tashkeel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`phone_numbering_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`capital_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`capital_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar_normalized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_en_normalized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_country_governorate FOREIGN KEY (`country_id`) REFERENCES COUNTRIES(`country_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `GOVERNORATES`
(`governorate_id`, `country_id`, `name_en`, `name_ar`, `name_ar_tashkeel`, `phone_numbering_plan`, `capital_name_ar`, `capital_name_en`, `name_ar_normalized`, `name_en_normalized`)
	VALUES
(1, 1, 'Amant Al-Asmah', 'أمانة العاصمة', 'أَمانَة العاصِمَةِ', '01', '', '', 'امانه العاصمه', 'Amant Al Asmah'),
(2, 1, 'Sanaa', 'صنعاء', 'صَنْعاء', '01', '', '', 'صنعاء', 'Sanaa'),
(3, 1, 'Aden', 'عدن', 'عَدَن', '02', '', '', 'عدن', 'Aden'),
(4, 1, 'Al-Hodeidah', 'الحديدة', 'الحُدَيْدَة', '03', 'مدينة الحديدة', 'Al-Hodeidah City', 'الحديده', 'Al Hodeidah'),
(5, 1, 'Thamar', 'ذمار', 'ذَمَار', '06', 'مدينة ذمار', 'Thamar City', 'ذمار', 'Thamar'),
(6, 1, 'Amran', 'عمران', 'عَمْران', '07', 'مدينة عمران', 'Amran City', 'عمران', 'Amran'),
(7, 1, 'Hajjah', 'حجة', 'حَجَّة', '07', 'مدينة حجة', 'Hajjah City', 'حجه', 'Hajjah'),
(8, 1, 'Ibb', 'إب', 'إِبْ', '04', 'مدينة إب', 'Ibb City', 'اب', 'Ibb'),
(9, 1, 'Sa\'dah', 'صعدة', 'صَعْدَة', '07', 'مدينة صعدة', 'Sa\'dah City', 'صعده', 'Sadah'),
(10, 1, 'Al-Baidha', 'البيضاء', 'البَيْضَاء', '06', 'مدينة البيضاء', 'Al-Baidha City', 'البيضاء', 'Al Baidha'),
(11, 1, 'Shabwah', 'شبوة', 'شَبْوَة', '05', 'عتق', 'Ataq', 'شبوه', 'Shabwah'),
(12, 1, 'Taiz', 'تعز', 'تَعِز', '04', 'مدينة تعز', 'Taiz City', 'تعز', 'Taiz'),
(13, 1, 'Al-jawf', 'الجوف', 'الجَوْف', '06', 'الحزم', 'Al-Hazm', 'الجوف', 'Al jawf'),
(14, 1, 'Ma\'rib', 'مأرب', 'مَأْرِب', '06', 'مدينة مأرب', 'Ma\'rib City', 'مارب', 'Marib'),
(15, 1, 'Hadramot', 'حضرموت', 'حَضْرَمَوْت', '05', 'Al-Mokalla City', 'مدينة المكلا', 'حضرموت', 'Hadramot'),
(16, 1, 'Al-Maharah', 'المهرة', 'المَهَرَة', '05', 'الغيضة', 'Al-Ghaidhah', 'المهره', 'Al Maharah'),
(17, 1, 'Al-Dhale\'', 'الضالع', 'الضَّالِع', '02', 'مدينة الضالع', 'Al-Dhale\' City', 'الضالع', 'Al Dhale'),
(18, 1, 'Al-Mahweet', 'المحويت', 'المَحْوِيْت', '07', 'مدينة المحويت', 'Al-Mahweet City', 'المحويت', 'Al Mahweet'),
(19, 1, 'Lahj', 'لحج', 'لَحْج', '02', 'الحوطة', 'Al-Hotah', 'لحج', 'Lahj'),
(20, 1, 'Raimah', 'ريمة', 'رَيْمَة', '03', 'الجبين', 'Al-Jabeen', 'ريمه', 'Raimah'),
(21, 1, 'Socatra', 'سقطرى', 'سُقَطْرَى', '05', 'حديبو', 'Hadibu', 'سقطرا', 'Socatra'),
(22, 1, 'Abyan', 'أبين', 'أَبْيَن', '02', 'زنجبار', 'Zunjubar', 'ابين', 'Abyan');

DROP TABLE IF EXISTS `DISTRICTS`;
CREATE TABLE IF NOT EXISTS `DISTRICTS` (
	`district_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`governorate_id` bigint UNSIGNED NOT NULL,
	`name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar_tashkeel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_ar_normalized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name_en_normalized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_governorate_district FOREIGN KEY (`governorate_id`) REFERENCES GOVERNORATES(`governorate_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `DISTRICTS`
(`district_id`, `governorate_id`, `name_en`, `name_ar`, `name_ar_tashkeel`, `name_ar_normalized`, `name_en_normalized`)
	VALUES
(1, 1, 'Sana\'a Al-qdimah', 'صنعاء القديمة', 'صَنْعاء القَدِيمَة', 'صنعاء القديمه', 'Sanaa Al qdimah'),
(2, 1, 'Azal', 'آزَاْل', 'آزَاْل', 'ازال', 'Azal'),
(3, 1, 'Al-Safiah', 'الصافية', 'الصَّافِيَة', 'الصافيه', 'Al Safiah'),
(4, 1, 'Al-Sabe\'en', 'السبعين', 'السَّبْعِين', 'السبعين', 'Al Sabeen'),
(5, 1, 'Sh\'oob', 'شعوب', 'شُعُوْب', 'شعوب', 'Shoob'),
(6, 1, 'Al-Wehdah', 'الوحدة', 'الوِحْدَة', 'الوحده', 'Al Wehdah'),
(7, 1, 'Al-Tahrir', 'التحرير', 'التَّحْرِير', 'التحرير', 'Al Tahrir'),
(8, 1, 'Al-Thowarah', 'الثورة', 'الثَّوْرَة', 'الثوره', 'Al Thowarah'),
(9, 1, 'Maeen', 'معين', 'مَعَيْن', 'معين', 'Maeen'),
(10, 1, 'Bni Al-Harith', 'بني الحارث', 'بَنِيْ الحَارِث', 'بني الحارث', 'Bni Al Harith'),
(11, 2, 'Hamdan', 'همدان', 'هَمْدَان', 'همدان', 'Hamdan'),
(12, 2, 'Arhab', 'أرحب', 'أَرْحَب', 'ارحب', 'Arhab'),
(13, 2, 'Jihanah', 'جحانة', 'جِحانْة', 'جحانه', 'Jihanah'),
(14, 2, 'Bilad AL-Roos', 'بلاد الروس', 'بِلَاد الرُّوْس', 'بلاد الروس', 'Bilad AL Roos'),
(15, 2, 'Sanhan', 'سنحان', 'سَنْحَان', 'سنحان', 'Sanhan'),
(16, 2, 'Al-Hisn', 'الحصن', 'الحِصْن', 'الحصن', 'Al Hisn'),
(17, 2, 'Sa\'fan', 'صعفان', 'صَعْفان', 'صعفان', 'Safan'),
(18, 2, 'Bni Hishaish', 'بني حشيش', 'بَنِي حِشِيْش', 'بني حشيش', 'Bni Hishaish'),
(19, 2, 'Al-Tial', 'الطيال', 'الطِّيَال', 'الطيال', 'Al Tial'),
(20, 2, 'Khawlan', 'خولان', 'خَوْلَان', 'خولان', 'Khawlan'),
(21, 2, 'Bni Dhabian', 'بني ضبيان', 'بَنِيَ ضَبْيَان', 'بني ضبيان', 'Bni Dhabian'),
(22, 2, 'AL-Haimah Al-Kharijiah', 'الحيمة الخارجية', 'الحَيْمَة الخَارِجِيَّة', 'الحيمه الخارجيه', 'AL Haimah Al Kharijiah'),
(23, 2, 'Al-Haimah Al-Dakhiliah', 'الحيمة الداخلية', 'الحَيْمَة الدَّاخِلِيَّة', 'الحيمه الداخليه', 'Al Haimah Al Dakhiliah'),
(24, 2, 'Manakhah', 'مناخة', 'مَنَاخَة', 'مناخه', 'Manakhah'),
(25, 2, 'Nihm', 'نهم', 'نِهْم', 'نهم', 'Nihm'),
(26, 2, 'Bni Matar', 'بني مطر', 'بَنِي مَطَر', 'بني مطر', 'Bni Matar'),
(27, 3, 'Dar Saad', 'دار سعد', 'دَار سَعْد', 'دار سعد', 'Dar Saad'),
(28, 3, 'Al-Shaikh Othman', 'الشيخ عثمان', 'الشَّيْخ عُثْمَان', 'الشيخ عثمان', 'Al Shaikh Othman'),
(29, 3, 'Al-Mansorah', 'المنصورة', 'المَنْصُورَة', 'المنصوره', 'Al Mansorah'),
(30, 3, 'Al-Boriqah', 'البريقة', 'البُرَيْقَة', 'البريقه', 'Al Boriqah'),
(31, 3, 'Al-Tawwahi', 'التواهي', 'التَّوَّاهِي', 'التواهي', 'Al Tawwahi'),
(32, 3, 'Khoor Maksar', 'خور مكسر', 'خُوْر مَكَسَر', 'خور مكسر', 'Khoor Maksar'),
(33, 3, 'Seerh', 'صيرة', 'صِيْرَة', 'صيره', 'Seerh'),
(34, 3, 'Al-Mo\'alla', 'المعلا', 'المُعَلَّا', 'المعلا', 'Al Moalla'),
(35, 4, 'Bait Al-Fakih', 'بيت الفقية', 'بَيْت الفَقِيْة', 'بيت الفقيه', 'Bait Al Fakih'),
(36, 4, 'Al-Tohaita', 'التحيتا', 'التُّحَيْتَا', 'التحيتا', 'Al Tohaita'),
(37, 4, 'Kamaran', 'كمران', 'كَمَرَان', 'كمران', 'Kamaran'),
(38, 4, 'Al-Khookhah', 'الخوخة', 'الخُوْخُة', 'الخوخه', 'Al Khookhah'),
(39, 4, 'Al-Doraihmi', 'الدريهمي', 'الدُرَيْهِمِي', 'الدريهمي', 'Al Doraihmi'),
(40, 4, 'Al-Luhayyah', 'اللحية', 'اللُّحَيَّة', 'اللحيه', 'Al Luhayyah'),
(41, 4, 'Zabeed', 'زبيد', 'زَبِيْد', 'زبيد', 'Zabeed'),
(42, 4, 'Jabal Raas', 'جبل راس', 'جَبَل رَاس', 'جبل راس', 'Jabal Raas'),
(43, 4, 'Al-Marawiah', 'المراوعة', 'المَرَاوِعَة', 'المراوعه', 'Al Marawiah'),
(44, 4, 'Al-Jarrahi', 'الجراحي', 'الجَّرَّاحِي', 'الجراحي', 'Al Jarrahi'),
(45, 4, 'Al-Zuhrah', 'الزهرة', 'الزُّهْرَة', 'الزهره', 'Al Zuhrah'),
(46, 4, 'Al-Mighlaf', 'المغلاف', 'المِغْلَاف', 'المغلاف', 'Al Mighlaf'),
(47, 4, 'Al-Mansoriah', 'المنصورية', 'المَنْصُورِيَّة', 'المنصوريه', 'Al Mansoriah'),
(48, 4, 'Al-Zaydiyah', 'الزيدية', 'الزَّيْدِيَة', 'الزيديه', 'Al Zaydiyah'),
(49, 4, 'Al-Hali', 'الحالي', 'الحَالِي', 'الحالي', 'Al Hali'),
(50, 4, 'Al-Hojailah', 'الحجيلة', 'الحُجَّيْلَة', 'الحجيله', 'Al Hojailah'),
(51, 4, 'Al-Sokhnah', 'السخنة', 'السُّخْنَة', 'السخنه', 'Al Sokhnah'),
(52, 4, 'Al-Munirah', 'المنيرة', 'المُنِيْرَة', 'المنيره', 'Al Munirah'),
(53, 4, 'Al-Hook', 'الحوك', 'الحَوَك', 'الحوك', 'Al Hook'),
(54, 4, 'Al-Saleef', 'الصليف', 'الصَّلِيْف', 'الصليف', 'Al Saleef'),
(55, 4, 'Al-Mena', 'الميناء', 'المِيْنَاء', 'الميناء', 'Al Mena'),
(56, 4, 'Bajil', 'باجل', 'بَاجِل', 'باجل', 'Bajil'),
(57, 4, 'Al-Dhahi', 'الضحي', 'الضَّحِي', 'الضحي', 'Al Dhahi'),
(58, 4, 'Hais', 'حيس', 'حَيْس', 'حيس', 'Hais'),
(59, 4, 'Al-Qnawis', 'القناوص', 'القَنَاوِص', 'القناوص', 'Al Qnawis'),
(60, 4, 'Bora', 'برع', 'بُرَع', 'برع', 'Bora'),
(61, 5, 'Jhran', 'جهران', 'جَهْرَان', 'جهران', 'Jhran'),
(62, 5, 'Otmah', 'عتمة', 'عُتْمَة', 'عتمه', 'Otmah'),
(63, 5, 'Mayfa’at Ans', 'ميفعة عنس', 'مَيْفَعَة عَنْس', 'ميفعه عنس', 'Mayfa’at Ans'),
(64, 5, 'Al-Hada', 'الحداء', 'الحَدَاء', 'الحداء', 'Al Hada'),
(65, 5, 'Ans', 'عنس', 'عَنْس', 'عنس', 'Ans'),
(66, 5, 'Wosab Al-Safil', 'وصاب السافل', 'وِصَاب السَّافِل', 'وصاب السافل', 'Wosab Al Safil'),
(67, 5, 'Wosab Al-Aali', 'وصاب العالي', 'وِصَاب العَالِي', 'وصاب العالي', 'Wosab Al Aali'),
(68, 5, 'Jabal Al-Sharq', 'جبل الشرق', 'جَبَل الشَّرْق', 'جبل الشرق', 'Jabal Al Sharq'),
(69, 5, 'Al-Manar', 'المنار', 'المَنَار', 'المنار', 'Al Manar'),
(70, 5, 'Maghrib Ans', 'مغرب عنس', 'مَغْرِب عَنْس', 'مغرب عنس', 'Maghrib Ans'),
(71, 5, 'Dhoran Aanis', 'ضوران آنس', 'ضُوْرَان آنِس', 'ضوران انس', 'Dhoran Aanis'),
(72, 5, 'Thamar City', 'مدينة ذمار', 'مَدِيْنَة ذَمَار', 'مدينه ذمار', 'Thamar City'),
(73, 6, 'Harf Sofian', 'حرف سفيان', 'حَرْف سُفْيَان', 'حرف سفيان', 'Harf Sofian'),
(74, 6, 'Hooth', 'حوث', 'حُوْث', 'حوث', 'Hooth'),
(75, 6, 'Al-Ashah', 'العشة', 'العَشِّة', 'العشه', 'Al Ashah'),
(76, 6, 'Qiflt Ethar', 'قفلة عذر', 'قِفْلَة عِذَر', 'قفله عذر', 'Qiflt Ethar'),
(77, 6, 'Shaharah', 'شهارة', 'شَهَارَة', 'شهاره', 'Shaharah'),
(78, 6, 'Al-Madan', 'المدان', 'المَدَان', 'المدان', 'Al Madan'),
(79, 6, 'Sowair', 'صوير', 'صُوَيْر', 'صوير', 'Sowair'),
(80, 6, 'Dholaimah Haboor', 'ظليمة حبور', 'ظُلَيْمَة حَبُوْر', 'ظليمه حبور', 'Dholaimah Haboor'),
(81, 6, 'Al-Sawdah', 'السودة', 'السَّوْدَة', 'السوده', 'Al Sawdah'),
(82, 6, 'Khamer', 'خمر', 'خَمِر', 'خمر', 'Khamer'),
(83, 6, 'Thibain', 'ذيبين', 'ذِيْبَيْن', 'ذيبين', 'Thibain'),
(84, 6, 'Kharif', 'خارف', 'خَارِف', 'خارف', 'Kharif'),
(85, 6, 'Raidah', 'ريدة', 'رَيْدَة', 'ريده', 'Raidah'),
(86, 6, 'Eyal Yazeed Mountain', 'جبل عيال يزيد', 'جَبَل عِيَال يَزِيْد', 'جبل عيال يزيد', 'Eyal Yazeed Mountain'),
(87, 6, 'Al-Sawd', 'السود', 'السَّوْد', 'السود', 'Al Sawd'),
(88, 6, 'Amran', 'عمران', 'عَمْرَان', 'عمران', 'Amran'),
(89, 6, 'Maswar', 'مسور', 'مَسْوَر', 'مسور', 'Maswar'),
(90, 6, 'Thula', 'ثلا', 'ثُلَا', 'ثلا', 'Thula'),
(91, 6, 'Eial Sraih', 'عيال سريح', 'عِيْال سُرَيْح', 'عيال سريح', 'Eial Sraih'),
(92, 6, 'Bni Soraim', 'بني صريم', 'بَنِي صُرَيْم', 'بني صريم', 'Bni Soraim'),
(93, 7, 'Bakel Al-Meer', 'بكيل المير', 'بَكِيْل المِيْر', 'بكيل المير', 'Bakel Al Meer'),
(94, 7, 'Bni Al-Awam', 'بني العوام', 'بَنِي العَوّام', 'بني العوام', 'Bni Al Awam'),
(95, 7, 'Aflah Al-Sham', 'أفلح الشام', 'أَفْلَح الشَّام', 'افلح الشام', 'Aflah Al Sham'),
(96, 7, 'Aflah Al-Yemen', 'أفلح اليمن', 'أَفْلَح اليَمَن', 'افلح اليمن', 'Aflah Al Yemen'),
(97, 7, 'Bni Qais Al-Tawr', 'بني قيس الطور', 'بَنِي قَيْس الطَُوْر', 'بني قيس الطور', 'Bni Qais Al Tawr'),
(98, 7, 'Kohlan Al-Sharaf', 'كحلان الشرف', 'كُحْلَان الشَّرَف', 'كحلان الشرف', 'Kohlan Al Sharaf'),
(99, 7, 'Qohlan Affar', 'كحلان عفار', 'كُحْلَان عَفَّار', 'كحلان عفار', 'Qohlan Affar'),
(100, 7, 'Khiran Al-Mahrraq', 'خيران المحرق', 'خَيْرَان المُحَرَّق', 'خيران المحرق', 'Khiran Al Mahrraq'),
(101, 7, 'Hajjah', 'حجة', 'حَجَّة', 'حجه', 'Hajjah'),
(102, 7, 'Hajjah City', 'مدينة حجة', 'مَدِيْنَة حَجَّة', 'مدينه حجه', 'Hajjah City'),
(103, 7, 'Qufl Shamar', 'قفل شمر', 'قُفْل شَمَر', 'قفل شمر', 'Qufl Shamar'),
(104, 7, 'Qarah', 'قارة', 'قَارَة', 'قاره', 'Qarah'),
(105, 7, 'Aslm', 'أسلم', 'أَسْلَم', 'اسلم', 'Aslm'),
(106, 7, 'Al-Jamimah', 'الجميمة', 'الجَمِيْمَة', 'الجميمه', 'Al Jamimah'),
(107, 7, 'Wishhah', 'وشحة', 'وِشْحَة', 'وشحه', 'Wishhah'),
(108, 7, 'Al-Shaghadrah', 'الشغادرة', 'الشَّغَادِرَة', 'الشغادره', 'Al Shaghadrah'),
(109, 7, 'Al-Mahabishah', 'المحابشة', 'المَحَابِشَة', 'المحابشه', 'Al Mahabishah'),
(110, 7, 'Al-Maghribah', 'المغربة', 'المَغْرِبَة', 'المغربه', 'Al Maghribah'),
(111, 7, 'Al-Miftah', 'المفتاح', 'المِفْتَاح', 'المفتاح', 'Al Miftah'),
(112, 7, 'Haradh', 'حرض', 'حَرَض', 'حرض', 'Haradh'),
(113, 7, 'Hairan', 'حيران', 'حَيْرَان', 'حيران', 'Hairan'),
(114, 7, 'Koshar', 'كشر', 'كُشَر', 'كشر', 'Koshar'),
(115, 7, 'Sharis', 'شرس', 'شَرِس', 'شرس', 'Sharis'),
(116, 7, 'Abs', 'عبس', 'عَبْس', 'عبس', 'Abs'),
(117, 7, 'Koa\'dnah', 'كعيدنة', 'كُعَيْدِنَة', 'كعيدنه', 'Koadnah'),
(118, 7, 'Mabian', 'مبين', 'مَبْيَن', 'مبين', 'Mabian'),
(119, 7, 'Al-Shahil', 'الشاهل', 'الشَّاهِل', 'الشاهل', 'Al Shahil'),
(120, 7, 'Wdhrah', 'وضرة', 'وَضْرَة', 'وضره', 'Wdhrah'),
(121, 7, 'Mostaba\'', 'مستباء', 'مُسْتَبَاء', 'مستباء', 'Mostaba'),
(122, 7, 'Meedi', 'ميدي', 'مِيْدِي', 'ميدي', 'Meedi'),
(123, 7, 'Najrah', 'نجرة', 'نَجْرَة', 'نجره', 'Najrah'),
(124, 8, 'Al-Odain', 'العدين', 'العُدَيْن', 'العدين', 'Al Odain'),
(125, 8, 'Ibb', 'إب', 'إِب', 'اب', 'Ibb'),
(126, 8, 'Ba\'dan', 'بعدان', 'بَعْدَان', 'بعدان', 'Badan'),
(127, 8, 'Jiblah', 'جبلة', 'جِبْلَة', 'جبله', 'Jiblah'),
(128, 8, 'Al-Nadrah', 'النادرة', 'النَّادِرَة', 'النادره', 'Al Nadrah'),
(129, 8, 'Hobaish', 'حبيش', 'حُبَيْش', 'حبيش', 'Hobaish'),
(130, 8, 'Hazm Al-Odain', 'حزم العدين', 'حَزْم العُدَيْن', 'حزم العدين', 'Hazm Al Odain'),
(131, 8, 'Thi Al-Sufal', 'ذي السفال', 'ذِي السُّفَال', 'ذي السفال', 'Thi Al Sufal'),
(132, 8, 'Al-Radhmah', 'الرضمة', 'الرَّضْمَة', 'الرضمه', 'Al Radhmah'),
(133, 8, 'Al-Sabrah', 'السبرة', 'السَّبْرَة', 'السبره', 'Al Sabrah'),
(134, 8, 'Al-Saddah', 'السدة', 'السَّدَّة', 'السده', 'Al Saddah'),
(135, 8, 'Al-Syiani', 'السياني', 'السَّيَّانِي', 'السياني', 'Al Syiani'),
(136, 8, 'Al-Sha\'ir', 'الشعر', 'الشَّعِر', 'الشعر', 'Al Shair'),
(137, 8, 'Al-Dhahar', 'الظهار', 'الظَّهَار', 'الظهار', 'Al Dhahar'),
(138, 8, 'Fara\' Al-Odain', 'فرع العدين', 'فَرْع العُدَيْن', 'فرع العدين', 'Fara Al Odain'),
(139, 8, 'Al-Qafr', 'القفر', 'القَفْر', 'القفر', 'Al Qafr'),
(140, 8, 'Al-Makhadrh', 'المخادر', 'المَخَادِر', 'المخادر', 'Al Makhadrh'),
(141, 8, 'Mothaikhrah', 'مذيخرة', 'مُذَيْخِرَة', 'مذيخره', 'Mothaikhrah'),
(142, 8, 'Al-Mashnnah', 'المشنة', 'المَشَنَّة', 'المشنه', 'Al Mashnnah'),
(143, 8, 'Yareem', 'يريم', 'يَرِيْم', 'يريم', 'Yareem'),
(144, 9, 'Al-Hishwah', 'الحشوة', 'الحِشْوَة', 'الحشوه', 'Al Hishwah'),
(145, 9, 'Al-Safra\'a', 'الصفراء', 'الصَّفْرَاء', 'الصفراء', 'Al Safraa'),
(146, 9, 'Al-Dhahir', 'الظاهر', 'الظَّاهِر', 'الظاهر', 'Al Dhahir'),
(147, 9, 'Baqim', 'باقم', 'بَاقِم', 'باقم', 'Baqim'),
(148, 9, 'Haidan', 'حيدان', 'حَيْدَان', 'حيدان', 'Haidan'),
(149, 9, 'Razih', 'رازح', 'رَازِح', 'رازح', 'Razih'),
(150, 9, 'Saqain', 'ساقين', 'سَاقَيْن', 'ساقين', 'Saqain'),
(151, 9, 'Sahar', 'سحار', 'سَحَار', 'سحار', 'Sahar'),
(152, 9, 'Shida\'a', 'شداء', 'شِدَاء', 'شداء', 'Shidaa'),
(153, 9, 'Sa\'dah', 'صعدة', 'صَعْدَة', 'صعده', 'Sadah'),
(154, 9, 'Ghamer', 'غمر', 'غَمَر', 'غمر', 'Ghamer'),
(155, 9, 'Qatabir', 'قطابر', 'قَطَابِر', 'قطابر', 'Qatabir'),
(156, 9, 'Kitaf and Bog\'', 'كتاف والبقع', 'كِتَاف وَالبُقْع', 'كتاف والبقع', 'Kitaf and Bog'),
(157, 9, 'Majz', 'مجز', 'مَجْز', 'مجز', 'Majz'),
(158, 9, 'Munabbih', 'منبه', 'مُنَبِّه', 'منبه', 'Munabbih'),
(159, 10, 'Al-Baidha City', 'مدينة البيضاء', 'مَدِينَة البَيْضَاء', 'مدينه البيضاء', 'Al Baidha City'),
(160, 10, 'Al-Baidha', 'البيضاء', 'البَيْضَاء', 'البيضاء', 'Al Baidha'),
(161, 10, 'Al-Zaher', 'الزاهر', 'الزَّاهِر', 'الزاهر', 'Al Zaher'),
(162, 10, 'Radman', 'ردمان', 'رَدْمَان', 'ردمان', 'Radman'),
(163, 10, 'Al-Riashiah', 'الرياشية', 'الرِّيَاشِيَّة', 'الرياشيه', 'Al Riashiah'),
(164, 10, 'Al-Swadiah', 'السوادية', 'السُّوَادِيَّة', 'السواديه', 'Al Swadiah'),
(165, 10, 'Al-Shariah', 'الشرية', 'الشَرِيَّة', 'الشريه', 'Al Shariah'),
(166, 10, 'Sabah', 'صباح', 'صَبَاح', 'صباح', 'Sabah'),
(167, 10, 'Al-Sawma\'ah', 'الصومعة', 'الصَّوْمَعَة', 'الصومعه', 'Al Sawmaah'),
(168, 10, 'Al-Tiffah', 'الطفة', 'الطَّفَّة', 'الطفه', 'Al Tiffah'),
(169, 10, 'Al-Arsh', 'العرش', 'العَرْش', 'العرش', 'Al Arsh'),
(170, 10, 'Al-Qurishiah', 'القريشية', 'القُرَيْشِيَّة', 'القريشيه', 'Al Qurishiah'),
(171, 10, 'Thi Na\'em', 'ذي ناعم', 'ذِي نَاعِم', 'ذي ناعم', 'Thi Naem'),
(172, 10, 'Maswarah', 'مسورة', 'مَسْوَرَة', 'مسوره', 'Maswarah'),
(173, 10, 'Mukiras', 'مكيراس', 'مُكَيْرَاس', 'مكيراس', 'Mukiras'),
(174, 10, 'Al-Malajim', 'الملاجم', 'المَلَاجِم', 'الملاجم', 'Al Malajim'),
(175, 10, 'Nati\'', 'ناطع', 'نَاطِع', 'ناطع', 'Nati'),
(176, 10, 'Na\'man', 'نعمان', 'نَعْمَان', 'نعمان', 'Naman'),
(177, 10, 'Wild Rabee\'', 'ولد ربيع', 'وِلْد رَبِيْع', 'ولد ربيع', 'Wild Rabee'),
(178, 10, 'Rada\'', 'رداع', 'رَدَاع', 'رداع', 'Rada'),
(179, 11, 'Al-Rawdhah', 'الروضة', 'الرَّوْضَة', 'الروضه', 'Al Rawdhah'),
(180, 11, 'Bayhan', 'بيحان', 'بَيْحَان', 'بيحان', 'Bayhan'),
(181, 11, 'Jardan', 'جردان', 'جَرْدَان', 'جردان', 'Jardan'),
(182, 11, 'Habban', 'حبان', 'حَبَّان', 'حبان', 'Habban'),
(183, 11, 'Ain', 'عين', 'عَيْن', 'عين', 'Ain'),
(184, 11, 'Hotaib', 'حطيب', 'حُطَيْب', 'حطيب', 'Hotaib'),
(185, 11, 'Duhur', 'دهر', 'دُهُر', 'دهر', 'Duhur'),
(186, 11, 'Rudhoom', 'رضوم', 'رُضُوْم', 'رضوم', 'Rudhoom'),
(187, 11, 'Al-Sa\'eed', 'الصعيد', 'الصَّعِيْد', 'الصعيد', 'Al Saeed'),
(188, 11, 'Al-Talh', 'الطلح', 'الطَّلْح', 'الطلح', 'Al Talh'),
(189, 11, 'Ataq', 'عتق', 'عَتَق', 'عتق', 'Ataq'),
(190, 11, 'Arma\'', 'عرماء', 'عَرْمَاء', 'عرماء', 'Arma'),
(191, 11, 'Osailan', 'عسيلان', 'عُسَيْلَان', 'عسيلان', 'Osailan'),
(192, 11, 'Markhah Al-Sofla', 'مرخة السفلى', 'مَرْخَة السُّفْلَى', 'مرخه السفلا', 'Markhah Al Sofla'),
(193, 11, 'Markhah Al-Olia', 'مرخة العليا', 'مَرْخَة العُلْيَا', 'مرخه العليا', 'Markhah Al Olia'),
(194, 11, 'Maifa\'h', 'ميفعة', 'مَيْفَعَة', 'ميفعه', 'Maifah'),
(195, 11, 'Nesab', 'نصاب', 'نِصَاب', 'نصاب', 'Nesab'),
(196, 12, 'Mawiah', 'ماوية', 'مَاوِيَة', 'ماويه', 'Mawiah'),
(197, 12, 'Shara\'b Al-Salam', 'شرعب السلام', 'شَرْعَب السَّلَام', 'شرعب السلام', 'Sharab Al Salam'),
(198, 12, 'Shara\'b Al-Rawnah', 'شرعب الرونة', 'شَرْعَب الرَّوْنَة', 'شرعب الرونه', 'Sharab Al Rawnah'),
(199, 12, 'Maqbana', 'مقبنة', 'مَقْبَنَة', 'مقبنه', 'Maqbana'),
(200, 12, 'Al-Makha', 'المخا', 'المَخَا', 'المخا', 'Al Makha'),
(201, 12, 'Thubab', 'ذباب', 'ذُبَاب', 'ذباب', 'Thubab'),
(202, 12, 'Mawza\'', 'موزع', 'مَوْزَع', 'موزع', 'Mawza'),
(203, 12, 'Habashi Mountain', 'جبل حبشي', 'جَبَل حَبَشِي', 'جبل حبشي', 'Habashi Mountain'),
(204, 12, 'Mashra\'a and Hadnan', 'مشرعة وحدنان', 'مَشْرَعَة وَحَدْنَان', 'مشرعه وحدنان', 'Mashraa and Hadnan'),
(205, 12, 'Saber Al-Mawadim', 'صبر الموادم', 'صَبِر المَوَادِم', 'صبر الموادم', 'Saber Al Mawadim'),
(206, 12, 'Al-Misrakh', 'المسراخ', 'المِسْرَاخ', 'المسراخ', 'Al Misrakh'),
(207, 12, 'Khadeer', 'خدير', 'خَدِيْر', 'خدير', 'Khadeer'),
(208, 12, 'Al-Selw', 'الصلو', 'الصِّلْو', 'الصلو', 'Al Selw'),
(209, 12, 'Al-Shamaiatain', 'الشمايتين', 'الشَّمَايَتَيْن', 'الشمايتين', 'Al Shamaiatain'),
(210, 12, 'Al-Waz\'iah', 'الوازعية', 'الوَازِعِيَّة', 'الوازعيه', 'Al Waziah'),
(211, 12, 'Haifan', 'حيفان', 'حَيْفَان', 'حيفان', 'Haifan'),
(212, 12, 'Al-Mathfar', 'المظفر', 'المَظْفَر', 'المظفر', 'Al Mathfar'),
(213, 12, 'Al-Qahera', 'القاهرة', 'القَاهِرَة', 'القاهره', 'Al Qahera'),
(214, 12, 'Salah', 'صالة', 'صَالَة', 'صاله', 'Salah'),
(215, 12, 'Al-Taiziah', 'التعزية', 'التَّعِزِّيَة', 'التعزيه', 'Al Taiziah'),
(216, 12, 'Al-Ma\'afer', 'المعافر', 'المَعَافِر', 'المعافر', 'Al Maafer'),
(217, 12, 'Al-Mawasit', 'المواسط', 'المَوَاسِط', 'المواسط', 'Al Mawasit'),
(218, 12, 'Sama\'', 'سامع', 'سَامِع', 'سامع', 'Sama'),
(219, 13, 'Barat Al-enan', 'برط العنان', 'بَرَطَ العِنَان', 'برط العنان', 'Barat Al enan'),
(220, 13, 'Al-Hazm', 'الحزم', 'الحَزْم', 'الحزم', 'Al Hazm'),
(221, 13, 'Al-Humaidat', 'الحميدات', 'الحُمَيْدَات', 'الحميدات', 'Al Humaidat'),
(222, 13, 'Khab and Al-Sha’af', 'خب والشعف', 'خَب وَالشَعَف', 'خب والشعف', 'Khab and Al Sha’af'),
(223, 13, 'Kharab Al-Marashi', 'خراب المراشي', 'خَرَاب المَرَاشِي', 'خراب المراشي', 'Kharab Al Marashi'),
(224, 13, 'Al-Khalq', 'الخلق', 'الخَلَق', 'الخلق', 'Al Khalq'),
(225, 13, 'Rajozah', 'رجوزة', 'رَجُوْزَة', 'رجوزه', 'Rajozah'),
(226, 13, 'Al-Zaher', 'الزاهر', 'الزَّاهِر', 'الزاهر', 'Al Zaher'),
(227, 13, 'Al-Ghail', 'الغيل', 'الغَيْل', 'الغيل', 'Al Ghail'),
(228, 13, 'Al-Mutoon', 'المتون', 'المُتُوْن', 'المتون', 'Al Mutoon'),
(229, 13, 'Al-Masloob', 'المصلوب', 'المَصْلُوْب', 'المصلوب', 'Al Masloob'),
(230, 13, 'Al-Matmmah', 'المطمة', 'المَطَمّة', 'المطمه', 'Al Matmmah'),
(231, 14, 'Bedbedah', 'بدبدة', 'بِدْبِدَة', 'بدبده', 'Bedbedah'),
(232, 14, 'Morad Mountain', 'جبل مراد', 'جَبَل مُرَاد', 'جبل مراد', 'Morad Mountain'),
(233, 14, 'Madghal Al-Gida\'an', 'مدغل الجدعان', 'مَدْغَل الجِدْعَان', 'مدغل الجدعان', 'Madghal Al Gidaan'),
(234, 14, 'Ma\'rib City', 'مدينة مأرب', 'مَدِينَة مَأْرِب', 'مدينه مارب', 'Marib City'),
(235, 14, 'Hareeb', 'حريب', 'حَرِيْب', 'حريب', 'Hareeb'),
(236, 14, 'Hareeb Al-Qaramish', 'حريب القرامش', 'حَرِيْب القَرَامِش', 'حريب القرامش', 'Hareeb Al Qaramish'),
(237, 14, 'Rahabah', 'رحبة', 'رَحَبَة', 'رحبه', 'Rahabah'),
(238, 14, 'Raghwan', 'رغوان', 'رَغْوَان', 'رغوان', 'Raghwan'),
(239, 14, 'Sirwah', 'صرواح', 'صِرْوَاح', 'صرواح', 'Sirwah'),
(240, 14, 'Al-Abdiah', 'العبدية', 'العَبْدِيَّة', 'العبديه', 'Al Abdiah'),
(241, 14, 'Mahliah', 'ماهلية', 'ماهِلِيَّة', 'ماهليه', 'Mahliah'),
(242, 14, 'Al-Jobah', 'الجوبة', 'الجُوْبَة', 'الجوبه', 'Al Jobah'),
(243, 14, 'Majzar', 'مجزر', 'مَجْزَر', 'مجزر', 'Majzar'),
(244, 14, 'Ma\'rib', 'مأرب', 'مَأْرِب', 'مارب', 'Marib'),
(245, 15, 'Al-Mokalla', 'المكلا', 'المُكَلَّا', 'المكلا', 'Al Mokalla'),
(246, 15, 'Thamood', 'ثمود', 'ثَمُوْد', 'ثمود', 'Thamood'),
(247, 15, 'Al-Qaf', 'القف', 'القَف', 'القف', 'Al Qaf'),
(248, 15, 'Zamakh and Manookh', 'زمخ ومنوخ', 'زَمَخ وَمُنُوْخ', 'زمخ ومنوخ', 'Zamakh and Manookh'),
(249, 15, 'Hajr', 'حجر', 'حَجْر', 'حجر', 'Hajr'),
(250, 15, 'Al-Abr', 'العبر', 'العَبْر', 'العبر', 'Al Abr'),
(251, 15, 'Al-Qatn', 'القطن', 'القَطَن', 'القطن', 'Al Qatn'),
(252, 15, 'Shibam', 'شبام', 'شِبَام', 'شبام', 'Shibam'),
(253, 15, 'Sah', 'ساه', 'سَاه', 'ساه', 'Sah'),
(254, 15, 'Say\'on', 'سيئون', 'سَيْئُون', 'سيءون', 'Sayon'),
(255, 15, 'Tarim', 'تريم', 'تَرِيْم', 'تريم', 'Tarim'),
(256, 15, 'Al-Soom', 'السوم', 'السُّوْم', 'السوم', 'Al Soom'),
(257, 15, 'Al-Raidah and Qusaier', 'الريدة وقصيعر', 'الرَّيْدَة وَقُصَيْعَِر', 'الريده وقصيعر', 'Al Raidah and Qusaier'),
(258, 15, 'Al-Dais', 'الديس', 'الدِّيْس', 'الديس', 'Al Dais'),
(259, 15, 'Al-Shihr', 'الشحر', 'الشِّحْر', 'الشحر', 'Al Shihr'),
(260, 15, 'Ghail Bin Yameen', 'غيل بن يمين', 'غَيْل بِْن يَمِيْن', 'غيل بن يمين', 'Ghail Bin Yameen'),
(261, 15, 'Ghail Ba Wazeer', 'غيل باوزير', 'غَيْل بَاوَزِيْر', 'غيل باوزير', 'Ghail Ba Wazeer'),
(262, 15, 'Dawa\'an', 'دوعن', 'دَوْعَن', 'دوعن', 'Dawaan'),
(263, 15, 'Amd', 'عمد', 'عَمْد', 'عمد', 'Amd'),
(264, 15, 'Al-Ayn Valley', 'حورة ووادي العين', 'حُوْرَة وَوَادِي العَيْن', 'حوره ووادي العين', 'Al Ayn Valley'),
(265, 15, 'Raikhyah', 'رخية', 'رَخْيَة', 'رخيه', 'Raikhyah'),
(266, 15, 'Yabo\'th', 'يبعث', 'يَبْعُث', 'يبعث', 'Yaboth'),
(267, 15, 'Hajar Al-Saia\'ar', 'حجر الصيعر', 'حَجْر الصَّيْعَر', 'حجر الصيعر', 'Hajar Al Saiaar'),
(268, 15, 'Barom Maifa\'a', 'بروم ميفع', 'بُرُوم مَيْفَع', 'بروم ميفع', 'Barom Maifaa'),
(269, 15, 'Al-Dhlia\'ah', 'الضليعة', 'الضِّلِيْعَة', 'الضليعه', 'Al Dhliaah'),
(270, 15, 'Rumah', 'رماه', 'رُمَاه', 'رماه', 'Rumah'),
(271, 15, 'Huridhah', 'حريضة', 'حُرَيْضَة', 'حريضه', 'Huridhah'),
(272, 15, 'Al-Mokalla City', 'مدينة المكلا', 'مَدِيْنَة المُكَلَّا', 'مدينه المكلا', 'Al Mokalla City'),
(273, 16, 'Haat', 'حات', 'حَات', 'حات', 'Haat'),
(274, 16, 'Hsween', 'حصوين', 'حَصْوِيْن', 'حصوين', 'Hsween'),
(275, 16, 'Hawf', 'حوف', 'حَوْف', 'حوف', 'Hawf'),
(276, 16, 'Syhoot', 'سيحوت', 'سَيْحُوْت', 'سيحوت', 'Syhoot'),
(277, 16, 'Shihin', 'شحن', 'شِحِْن', 'شحن', 'Shihin'),
(278, 16, 'Al-Ghaidhah', 'الغيضة', 'الغَيْضَة', 'الغيضه', 'Al Ghaidhah'),
(279, 16, 'Qashn', 'قشن', 'قِشْن', 'قشن', 'Qashn'),
(280, 16, 'Al-Masilah', 'المسيلة', 'المَسِيْلَة', 'المسيله', 'Al Masilah'),
(281, 16, 'Man\'r', 'منعر', 'مَنْعَر', 'منعر', 'Manr'),
(282, 17, 'Al-Azariq', 'الأزارق', 'الأَزَارِق', 'الازارق', 'Al Azariq'),
(283, 17, 'Al-Hasha\'', 'الحشاء', 'الحَشَاء', 'الحشاء', 'Al Hasha'),
(284, 17, 'Al-Hosain', 'الحصين', 'الحُصَيْن', 'الحصين', 'Al Hosain'),
(285, 17, 'Al-Sho\'aib', 'الشعيب', 'الشُّعَيْب', 'الشعيب', 'Al Shoaib'),
(286, 17, 'Al-Dhale\'', 'الضالع', 'الضَّالِع', 'الضالع', 'Al Dhale'),
(287, 17, 'Joban', 'جبن', 'جُبَن', 'جبن', 'Joban'),
(288, 17, 'Jehaf', 'جحاف', 'جِحَاف', 'جحاف', 'Jehaf'),
(289, 17, 'Damt', 'دمت', 'دَمْت', 'دمت', 'Damt'),
(290, 17, 'Qa\'tabah', 'قعطبة', 'قَعْطَبَة', 'قعطبه', 'Qatabah'),
(291, 18, 'Melhan', 'ملحان', 'مَلْحَان', 'ملحان', 'Melhan'),
(292, 18, 'Al-Khabt', 'الخبت', 'الخَبْت', 'الخبت', 'Al Khabt'),
(293, 18, 'Al-Tawilah', 'الطويلة', 'الطَّوِيْلَة', 'الطويله', 'Al Tawilah'),
(294, 18, 'Bni Sa\'d', 'بني سعد', 'بَنِي سَعْد', 'بني سعد', 'Bni Sad'),
(295, 18, 'Al-Rojom', 'الرجم', 'الرُّجُم', 'الرجم', 'Al Rojom'),
(296, 18, 'Al-Mahweet', 'المحويت', 'المَحْوِيْت', 'المحويت', 'Al Mahweet'),
(297, 18, 'Al-Mahweet City', 'مدينة المحويت', 'مَدِيْنَة المَحْوِيْت', 'مدينه المحويت', 'Al Mahweet City'),
(298, 18, 'Shibam Kawkaban', 'شبام كوكبان', 'شِبَام كَوْكَبَان', 'شبام كوكبان', 'Shibam Kawkaban'),
(299, 18, 'Hofash', 'حفاش', 'حُفَاش', 'حفاش', 'Hofash'),
(300, 19, 'Al-Had', 'الحد', 'الحَد', 'الحد', 'Al Had'),
(301, 19, 'Al-Hotah', 'الحوطة', 'الحُوْطَة', 'الحوطه', 'Al Hotah'),
(302, 19, 'Al-Qabbaytah', 'القبيطة', 'القَبَّيْطَة', 'القبيطه', 'Al Qabbaytah'),
(303, 19, 'Al-Mosaimeer', 'المسيمير', 'المُسَيمِيْر', 'المسيمير', 'Al Mosaimeer'),
(304, 19, 'Al-Madharaba and Al-A\'ara', 'المضاربة والعارة', 'المَضَارِبَة وَالعَارَة', 'المضاربه والعاره', 'Al Madharaba and Al Aara'),
(305, 19, 'Al-Muflhi', 'المفلحي', 'المُفْلِحِي', 'المفلحي', 'Al Muflhi'),
(306, 19, 'Al-Maqatirah', 'المقاطرة', 'المَقَاطِرَة', 'المقاطره', 'Al Maqatirah'),
(307, 19, 'Al-Milah', 'الملاح', 'المَلَاح', 'الملاح', 'Al Milah'),
(308, 19, 'Tbn', 'تبن', 'تُبَن', 'تبن', 'Tbn'),
(309, 19, 'Halimain', 'حالمين', 'حَالِمَيْن', 'حالمين', 'Halimain'),
(310, 19, 'Hobail Jabr', 'حبيل جبر', 'حَبِيْل جَبْر', 'حبيل جبر', 'Hobail Jabr'),
(311, 19, 'Radfan', 'ردفان', 'رَدْفَان', 'ردفان', 'Radfan'),
(312, 19, 'Toor Al-Baha', 'طور الباحة', 'طُوْر البَاحَة', 'طور الباحه', 'Toor Al Baha'),
(313, 19, 'Yafe\'', 'يافع', 'يَافِع', 'يافع', 'Yafe'),
(314, 19, 'Yahar', 'يهر', 'يَهَر', 'يهر', 'Yahar'),
(315, 20, 'Bilad Al-Ta\'am', 'بلاد الطعام', 'بِلَاد الطَّعَام', 'بلاد الطعام', 'Bilad Al Taam'),
(316, 20, 'Al-Salfiah', 'السلفية', 'السَّلْفِيَة', 'السلفيه', 'Al Salfiah'),
(317, 20, 'Al-Jabeen', 'الجبين', 'الجَبِيْن', 'الجبين', 'Al Jabeen'),
(318, 20, 'Mizhir', 'مزهر', 'مِزْهِر', 'مزهر', 'Mizhir'),
(319, 20, 'Kosmah', 'كسمة', 'كُسْمَة', 'كسمه', 'Kosmah'),
(320, 20, 'Al-ja\'faria', 'الجعفرية', 'الجَعْفَرِيَّة', 'الجعفريه', 'Al jafaria'),
(321, 21, 'Hadibu', 'حديبو', 'حَدِيْبُو', 'حديبو', 'Hadibu'),
(322, 21, 'Qulansiyah and \'Abd-al-Kuri', 'قلنسية وعبد الكوري', 'قَلَنْسِيِّة وَعَبْد الكُوْرِي', 'قلنسيه وعبد الكوري', 'Qulansiyah and Abd al Kuri'),
(323, 22, 'Mudiyah', 'مودية', 'مُوْدِيَة', 'موديه', 'Mudiyah'),
(324, 22, 'Al Mahfid', 'المحفد', 'المَحْفَد', 'المحفد', 'Al Mahfid'),
(325, 22, 'Jayshan', 'جيشان', 'جَيْشَان', 'جيشان', 'Jayshan'),
(326, 22, 'Lawdar', 'لودر', 'لَوْدَر', 'لودر', 'Lawdar'),
(327, 22, 'Sabah', 'سباح', 'سَبَاح', 'سباح', 'Sabah'),
(328, 22, 'Rusud', 'رصد', 'رُصُد', 'رصد', 'Rusud'),
(329, 22, 'Sarar', 'سرار', 'سَرَار', 'سرار', 'Sarar'),
(330, 22, 'Al-Wadhi\'', 'الوضيع', 'الوَضِيْع', 'الوضيع', 'Al Wadhi'),
(331, 22, 'Ahwar', 'أحور', 'أَحْوَر', 'احور', 'Ahwar'),
(332, 22, 'Zunjubar', 'زنجبار', 'زُنْجُبَار', 'زنجبار', 'Zunjubar'),
(333, 22, 'Khanfar', 'خنفر', 'خَنْفَر', 'خنفر', 'Khanfar');

