#/bin/bash
PREFIX=/opt/vlc
vlcdir="vlc"  

# /   (if vlc dir exists then just pull it else clone it ) http://tldp.org/LDP/abs/html/fto.html

if [ -d "$vlcdir" ]
then
	cd vlc
	git pull
else
	git clone git://git.videolan.org/vlc.git
        cd vlc
fi
sudo ./bootstrap
./configure --mandir=/share/man --build=x86_64-linux-gnu --enable-maintaner-mode --enable-release --prefix=$PREFIX --enable-libtool --enable-fast-install --disable-update-check --disable-gnome --disable-gtk --disable-familiar --disable-fb --enable-ggi --enable-sdl --enable-esd --enable-mad --enable-arts --enable-alsa --enable-jack --enable-pulse --disable-lirc --enable-a52 --disable-aa --enable-dvbpsi --enable-mozilla --disable-kde --enable-mp4 --enable-dvb --disable-satellite --enable-ogg --enable-vorbis --disable-shout --disable-wxwidgets --enable-qt4 --disable-slp --enable-flac --disable-skins --disable-basic-skins --enable-skins2 --enable-freetype --enable-mkv --enable-speex --enable-caca --disable-live555 --enable-libmpeg2 --disable-fribidi --enable-cdio --enable-mod --enable-theora --enable-modplug  --enable-gnutls --enable-ffmpeg --enable-ncurses --enable-smb --disable-gnomevfs --enable-bonjour --enable-mpc --enable-vcd --enable-vcdx --enable-notify --enable-debug --enable-twolame --enable-x264 --enable-faad --disable-zvbi --enable-telx --enable-mediacontrol-bindings --disable-x264 --disable-atmo --enable-alsa --enable-dv --enable-v4l --enable-v4l2 --enable-pvr --enable-svgalib --disable-dvd --without-dvdcss
make ; sudo make install 
#/opt/vlc/bin/vlc
