<?php

ini_set('memory_limit', '2G');

$unityEmails = getMainEmailsFromCsv('user.csv');

$filenames = [
    'file1.csv',
    'file2.csv',
    'file3.csv',
];

$emailsToDeleted = [];
foreach ($filenames as $filename) {
    getEmailsFromCsv($filename, $emailsToDeleted, $unityEmails);
}

file_put_contents('emails_to_delete.json', json_encode($emailsToDeleted, JSON_PRETTY_PRINT));

foreach ($emailsToDeleted as $email) {
    deleteOnApi($email);
}

/**
 * @param string $email
 * @return void
 */
function deleteOnApi(string $email): void
{
    $hash = md5(strtolower($email));

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, '---SOME_URL---' . $hash);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
    curl_setopt($ch, CURLOPT_HEADER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: ---SOME_API_KEY---']);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    curl_close($ch);

    if ($httpCode !== 204) {
        echo 'NOT deleted ' . $email . PHP_EOL;
    } else {
        echo 'deleted ' . $email . PHP_EOL;
    }
}

/**
 * @param string $filename
 * @param array  $emails
 * @param array  $unityEmails
 * @return void
 * @author \Exception
 */
function getEmailsFromCsv(string $filename, array &$emails, array $unityEmails): void
{
    $row = 1;
    $handle = fopen($filename, 'r');

    if ($handle === false) {
        throw new \Exception(sprintf('File "%s" is not readable.', $filename));
    }
    while (($data = fgetcsv($handle, 100000, ',', '"')) !== false) {
        if ($row++ === 1) {
            continue;
        }

        $email = $data[0];
        if (!isset($unityEmails[$email])) {
            $emails[] = $email;
        }
    }

    fclose($handle);
}

/**
 * @param string $filename
 * @return array
 * @author \Exception
 */
function getMainEmailsFromCsv(string $filename): array
{
    $emails = [];
    $row = 1;
    $handle = fopen($filename, 'r');

    if ($handle === false) {
        throw new \Exception(sprintf('File "%s" is not readable.', $filename));
    }
    while (($data = fgetcsv($handle, 100000, ',', '"')) !== false) {
        if ($row++ === 1) {
            continue;
        }

        $emails[$data[2]] = true;
    }

    fclose($handle);

    return $emails;
}
