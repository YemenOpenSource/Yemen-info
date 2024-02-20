<?php

namespace App\Commands;

use Illuminate\Console\Scheduling\Schedule;
use LaravelZero\Framework\Commands\Command;
use Rap2hpoutre\FastExcel\FastExcel;

class Convert extends Command
{
    /**
     * The signature of the command.
     *
     * @var string
     */
    protected $signature = 'convert';

    /**
     * The description of the command.
     *
     * @var string
     */
    protected $description = 'Convert Yemen-info.json file to csv and excel';                   

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        ini_set('memory_limit', '-1');

        $json = file_get_contents('yemen-info.json');
        $yemenData = json_decode($json, true);

        $data = [];

        $previousValues = $this->initializePreviousValues();

        foreach ($yemenData['governorates'] as $gov) {
            $previousValues['governorate'] = $this->fillPreviousValues($gov, $previousValues['governorate'], 'governorate');

            foreach ($gov['districts'] as $district) {
                $previousValues['district'] = $this->fillPreviousValues($district, $previousValues['district'], 'district');
                $districtData = $this->fillKeys($district, 'district', $previousValues);

                if (isset($district['uzaal']) && is_array($district['uzaal'])) {
                    foreach ($district['uzaal'] as $uzlah) {
                        $previousValues['uzlah'] = $this->fillPreviousValues($uzlah, $previousValues['uzlah'], 'uzlah');
                        $uzlahData = $this->fillKeys($uzlah, 'uzlah', $previousValues);

                        if (isset($uzlah['villages']) && is_array($uzlah['villages'])) {
                            foreach ($uzlah['villages'] as $village) {
                                $villageData = $this->fillKeys($village, 'village', $previousValues);
                                $data[] = $villageData;
                            }
                        } else {
                            // No villages under this uzlah, add empty village data
                            $villageData = $this->fillKeys([], 'village', $previousValues);
                            $data[] = $villageData;
                        }
                    }
                } else {
                    $previousValues['uzlah'] = [
                        'name_en' => '',
                        'name_ar' => '',
                        'name_ar_normalized' => '',
                        'name_en_normalized' => '',
                    ];
                    $uzlahData = $this->fillKeys([], 'uzlah', $previousValues);
                    $data[] = $uzlahData;
                    $villageData = $this->fillKeys([], 'village', $previousValues);
                    $data[] = $villageData;
                }
            }
        }

        $uniqueData = array_map('unserialize', array_unique(array_map('serialize', $data)));

        $fastExcel = new FastExcel($uniqueData);
        $fastExcel->export('file.csv');
        $fastExcel->export('file.xlsx');
    }


    private function fillKeys($item, $type, &$previousValues)
    {
        $template = [
            'governorate_name_en' => $previousValues['governorate']['name_en'] ?? '',
            'governorate_name_ar' => $previousValues['governorate']['name_ar'] ?? '',
            'governorate_name_ar_tashkeel' => $previousValues['governorate']['name_ar_tashkeel'] ?? '',
            'governorate_phone_numbering_plan' => $previousValues['governorate']['phone_numbering_plan'] ?? '',
            'governorate_capital_name_ar' => $previousValues['governorate']['capital_name_ar'] ?? '',
            'governorate_capital_name_en' => $previousValues['governorate']['capital_name_en'] ?? '',
            'governorate_name_ar_normalized' => $previousValues['governorate']['name_ar_normalized'] ?? '',
            'governorate_name_en_normalized' => $previousValues['governorate']['name_en_normalized'] ?? '',
            'district_name_en' => $previousValues['district']['name_en'] ?? '',
            'district_name_ar' => $previousValues['district']['name_ar'] ?? '',
            'district_name_ar_tashkeel' => $previousValues['district']['name_ar_tashkeel'] ?? '',
            'district_name_ar_normalized' => $previousValues['district']['name_ar_normalized'] ?? '',
            'district_name_en_normalized' => $previousValues['district']['name_en_normalized'] ?? '',
            'uzlah_name_en' => $previousValues['uzlah']['name_en'] ?? '',
            'uzlah_name_ar' => $previousValues['uzlah']['name_ar'] ?? '',
            'uzlah_name_ar_normalized' => $previousValues['uzlah']['name_ar_normalized'] ?? '',
            'uzlah_name_en_normalized' => $previousValues['uzlah']['name_en_normalized'] ?? '',
            'village_name_en' => $item['name_en'] ?? '',
            'village_name_ar' => $item['name_ar'] ?? '',
            'village_name_ar_normalized' => $item['name_ar_normalized'] ?? '',
            'village_name_en_normalized' => $item['name_en_normalized'] ?? '',
        ];

        $prefix = '';
        if ($type !== 'governorate') {
            $prefix = $type.'_';
        }

        $previousValues[$type] = $item;

        return $template;
    }

    private function fillPreviousValues($item, $previousValues)
    {
        $filledValues = [];

        foreach ($item as $key => $value) {
            if (! empty($value)) {
                $filledValues[$key] = $value;
            }
        }

        return $filledValues + $previousValues;
    }

    private function initializePreviousValues()
    {
        return [
            'governorate' => [],
            'district' => [],
            'uzlah' => [],
        ];
    }

    /**
     * Define the command's schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    public function schedule(Schedule $schedule): void
    {
        // $schedule->command(static::class)->everyMinute();
    }
}
