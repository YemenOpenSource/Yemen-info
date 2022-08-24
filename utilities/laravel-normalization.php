<?php



/**
 * Here is the Laravel code to add normalized version of the governance/districts
 * just simple copy this code to your routes file to get up and running with the results
 * keep in mind the the yemen.json file is located in the public folder
 * Tested in Laravel 9, but it is probable will work fine with most versions
 */

Route::get('/arabic-norm', function () {

    $Arabic = new \ArPHP\I18N\Arabic();
    $Arabic->setNorm('all', true);

    $patternApostrophe = "/\'/"; // '
    $patternDash = "/-/"; // -

    // 1. get the json file
    $json = \File::get("../public/yemen.json");

    // 2. read the json file
    $yemenData = collect(json_decode($json));

    // 3. loop over the governance and the districts
    foreach ($yemenData['governorates'] as  $gov) {

        // 4. add a new element in the json: "name_ar_normalized"
        // 5. make the value = the normalized arabic using ar-php library
        $gov->name_ar_normalized = $Arabic->arNormalizeText($gov->name_ar);

        $firstEnNormalization = preg_replace($patternApostrophe, "", $gov->name_en);
        $secondEnNormalization = preg_replace($patternDash, " ", $firstEnNormalization);

        $gov->name_en_normalized = $secondEnNormalization;

        foreach ($gov->districts as $dis) {
            $dis->name_ar_normalized =  $Arabic->arNormalizeText($dis->name_ar);

            $firstEnNormalization = preg_replace($patternApostrophe, "", $dis->name_en);
            $secondEnNormalization = preg_replace($patternDash, " ", $firstEnNormalization);

            $dis->name_en_normalized = $secondEnNormalization;
        }
    }

    // 6. return json file, you can simply copy it from the browser.
    return  json_decode($yemenData);
});
