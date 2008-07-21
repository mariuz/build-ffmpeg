#!/usr/bin/php
<?php

$today = date("D M j G:i:s T Y");
print "/etc Backup for $today";
chdir("/etc"); 
passthru("git-add .");
passthru("git-commit -a -m\"snapshot $today\"");
?>

