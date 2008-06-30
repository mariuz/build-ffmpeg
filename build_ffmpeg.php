#!/usr/bin/php
<?php
$OperatingSystem="Ubuntu";
$Version="8.04";

# requirments apt-get install php5-cli before using this script :)
# see this page also https://wiki.ubuntu.com/ffmpeg


if (($OperatingSystem == "Ubuntu") && ($Version =="8.04"))

{
passthru ('sudo apt-get -y install ruby subversion gcc git-core automake unzip libogg-dev libvorbis-dev wget ');
passthru ('sudo apt-get -y build-dep ffmpeg');
passthru ('sudo apt-get -y install liblame-dev libfaad-dev libfaac-dev libxvidcore4-dev liba52-0.7.4 liba52-0.7.4-dev libdts-dev checkinstall liba52-dev libdts-dev libgsm1-dev libvorbis-dev libdc1394-dev libx264-dev libfaad-dev libtheora-dev libsdl1.2-dev ');
}




?>


