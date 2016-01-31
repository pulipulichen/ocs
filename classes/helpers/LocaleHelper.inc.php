<?php

class LocaleHelper {
    static function sortZhTwFirst($supportedLocales) {
        $zh_TW = 'zh_TW';
        if (array_key_exists($zh_TW, $supportedLocales) && array_keys($supportedLocales)[0] !== $zh_TW) {
            $keys = array_keys($supportedLocales);

            $sortedSupportedLocales = array();
            $sortedSupportedLocales[$zh_TW] = $supportedLocales[$zh_TW];

            foreach ($supportedLocales AS $key => $value) {
                if ($key === $zh_TW) {
                    continue;
                }
                $sortedSupportedLocales[$key] = $value;
            }
            $supportedLocales = $sortedSupportedLocales;
        }
        return $supportedLocales;
    }
}