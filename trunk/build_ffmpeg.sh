#1 get some prerequizite for some operating systems 

#.yum install ruby subversion gcc

apt-get install ruby subversion gcc git-core automake unzip libogg-dev libvorbis-dev 



#2.Get faad2 (here are some details)
#http://packages.ubuntu.com/source/intrepid/faad2
wget http://archive.ubuntu.com/ubuntu/pool/universe/f/faad2/faad2_2.6.1.orig.tar.gz
tar -zxvf faad2_2.6.1.orig.tar.gz
cd faad2
./bootstrap
./configure --prefix=/usr;make;make install ;cd ..

#3.Get liba52 - a free ATSC A/52 stream decoder
#http://liba52.sourceforge.net/


wget http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz
tar -zxvf a52dec-0.7.4.tar.gz
cd a52dec-0.7.4
./configure --prefix=/usr;make;make install ;cd ..

#4.Get libgsm http://packages.qa.debian.org/libg/libgsm.html

wget http://ftp.debian.org/debian/pool/main/libg/libgsm/libgsm_1.0.12.orig.tar.gz
tar -zxf libgsm_1.0.12.orig.tar.gz
cd gsm-1.0-pl12
./configure --prefix=/usr;make;make install ;cd ..

#5.Get Faac

wget http://surfnet.dl.sourceforge.net/sourceforge/faac/faac-1.26.tar.gz
tar -zxf faac-1.26.tar.gz
cd faac
./bootstrap
./configure --prefix=/usr;make;make install ;cd ..
 

#6.Get Lame
wget http://mesh.dl.sourceforge.net/sourceforge/lame/lame-3.97.tar.gz
tar -zxf lame-3.97.tar.gz
cd lame-3.97
./configure --prefix=/usr;make;make install;cd ..

#7.Get xvidcore
wget http://downloads.xvid.org/downloads/xvidcore-1.1.3.tar.bz2
tar -jxf xvidcore-1.1.3.tar.bz2
cd xvidcore-1.1.3/build/generic/
./configure --prefix=/usr;make;make install
cd ../../../


#8.From http://www.penguin.cz/~utx/amr download amrnb-7.0.0.2.tar.bz2 and amrwb-7.0.0.3.tar.bz2       

wget http://ftp.penguin.cz/pub/users/utx/amr/amrnb-7.0.0.2.tar.bz2
wget http://ftp.penguin.cz/pub/users/utx/amr/amrwb-7.0.0.3.tar.bz2
tar -jxvf amrwb-7.0.0.3.tar.bz2
cd amrwb-7.0.0.3
./configure --prefix=/usr;make;make install;cd ..
tar -jxvf amrnb-7.0.0.2.tar.bz2
cd amrnb-7.0.0.2
./configure --prefix=/usr;make;make install;cd ..
                                      
#9.Get theora from here http://theora.org/svn/

svn co http://svn.xiph.org/trunk/theora
cd theora
./autogen.sh
./configure --prefix=/usr;make;make install;cd ..

                   
#10.GEt x264 from here  http://www.videolan.org/developers/x264.html

wget ftp://ftp.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20080625-2245.tar.bz2
tar -jxvf x264-snapshot-20080625-2245.tar.bz2
cd x264-snapshot-20080625-2245
./configure --prefix=/usr --disable-asm --enable-pic ;make ;make install
cd ..


#11.Finally ffmpeg from svn trunk

svn checkout svn://svn.mplayerhq.hu/ffmpeg/trunk ffmpeg
cd ffmpeg
./configure --prefix=/usr --enable-libamr-nb --enable-libamr-wb --enable-libvorbis --enable-libxvid --enable-liba52 --enable-libmp3lame --enable-libx264 --enable-libtheora --enable-libfaad --enable-gpl --enable-shared --enable-pthreads --enable-libfaac --enable-nonfree --enable-postproc
make ; make install; cd ..


#Needed for extension after php5-dev is installed
#http://ffmpeg-php.sourceforge.net/
#12.Get ffmpeg-php


wget http://dfn.dl.sourceforge.net/sourceforge/ffmpeg-php/ffmpeg-php-0.5.3.1.tbz2
tar -jxvf ffmpeg-php-0.5.3.1.tbz2
cd ffmpeg-php-0.5.3.1

phpize
./configure;make ; make install

#and enable it in php.ini
#echo 'extension=/usr/local/lib/php/extensions/ no-debug-non-zts-20020429/ffmpeg.so' >> /usr/local/Zend/etc/php.ini
#Restart Apache to load FFMPEG-PHP (Depends on OS, this is for RHEL/CentOS)
#service httpd restart

#Verify if it works

php -r 'phpinfo();' | grep ffmpeg

 

#13.Get mplayer   

wget http://www2.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc2.tar.bz2
wget http://www2.mplayerhq.hu/MPlayer/releases/codecs/essential-20061022.tar.bz2
tar -jxvf essential-20061022.tar.bz2
tar -jxvf MPlayer-1.0rc2.tar.bz2

mkdir -p /usr/lib/codecs/
cd essential-20061022
mv * /usr/lib/codecs/
cd ..
cd MPlayer-1.0rc2/
./configure --prefix=/usr
make; make install;cd ..
      
#14.Get flvtool2

wget http://rubyforge.org/frs/download.php/17497/flvtool2-1.0.6.tgz
tar -zxvf flvtool2-1.0.6.tgz
cd flvtool2-1.0.6

ruby setup.rb config
ruby setup.rb setup
ruby setup.rb install
cd ..  


