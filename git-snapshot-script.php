#!/usr/bin/php
<?php
/*See how to use it http://www.jukie.net/~bart/blog/20070312134706
install git
apt-get install git-core
cd /etc
git init-db
chmod og-rwx .git
commit the current state
git add .
git commit -a -m"initial import"

then you can add an daily snapshot script or an after upgrade one (after dist-upgrade)
./git-snapshot-script.php
*/

$today = date("D M j G:i:s T Y");
print "/etc Backup for $today";
chdir("/etc"); 
passthru("git-add .");
passthru("git-commit -a -m\"snapshot $today\"");
?>

