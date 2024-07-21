<?php

function tratar_fone($value){
    $fone = str_replace(array(' ', '-', '(', ')'), '', $value);
    return $fone;
}

function tratar_cpf($value){
    $cpf = str_replace(array('.', '-'), '', $value);
    return $cpf;
}

function tratar_cep($value){
    $cep = str_replace('-', '', $value);
    return $cep;
}

// tratar nome
function tratar_nome($string) {
    $ignorar = array('do', 'dos', 'da', 'das', 'de', 'e', 'di');
    $array = explode(' ', mb_strtolower($string) );
    $out = '';
    foreach ($array as $ar) {
       $out .= (in_array($ar, $ignorar) ? $ar : mb_convert_case($ar, MB_CASE_TITLE)) . ' ';
    }
    return trim($out);
 }
