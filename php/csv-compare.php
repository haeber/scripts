<?php

$emails1 = [];

$file1 = fopen('users-with-emails-and-id1.csv', 'r');

while ($values = fgetcsv($file1, 0, ',', '"')) {
    $emails1[mb_strtolower($values[0])] = $values[1];
}

fclose($file1);

ksort($emails1);

$emails2 = [];

$file2 = fopen('users-with-emails-and-id2.csv', 'r');

while ($values = fgetcsv($file2, 0, ',', '"')) {
    $emails2[mb_strtolower($values[0])] = $values[1];
}

fclose($file2);

ksort($emails2);

$list1 = array_diff_key($emails1, $emails2);
$list2 = array_diff_key($emails2, $emails1);

file_put_contents('email-list1.php', var_export($list1, true));
file_put_contents('email-list2.php', var_export($list2, true));
