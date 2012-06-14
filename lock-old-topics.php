<?php
$smf_root = realpath($argv[1]);
require $smf_root . '/Settings.php';
echo "$db_user\n$db_passwd\n$db_name\n";
