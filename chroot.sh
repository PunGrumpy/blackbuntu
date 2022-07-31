#!/bin/bash

## -------------- ##
## INSTALL SYSTEM ##
## -------------- ##

## Export environment
## ------------------
export PYTHONWARNINGS=ignore

## Configure APT sources
## ---------------------
add-apt-repository -y main
add-apt-repository -y restricted
add-apt-repository -y universe
add-apt-repository -y multiverse

## Move to temp directory
## ----------------------
cd /tmp/

## Remove `zsys`
## -------------
apt-get -y purge --auto-remove zsys >/dev/null 2>&1

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

## Install `kernel`
## ----------------
apt-get -y install linux-generic

## Install `dejavu` font
## ---------------------
apt-get -y install fonts-dejavu

## Disable error reporting
## -----------------------
sed -i "s/enabled=1/enabled=0/" /etc/default/apport

## Remove `thunderbird`
## --------------------
apt-get -y purge --auto-remove thunderbird

## Remove `libreoffice`
## --------------------
apt-get -y purge --auto-remove libreoffice*

## Remove all games
## ----------------
apt-get -y purge --auto-remove aisleriot gnome-initial-setup gnome-mahjongg gnome-mines gnome-sudoku hitori

## Install `gnome` extras
## ----------------------
apt-get -y install gnome-shell-extension-manager gnome-shell-extensions gnome-firmware gnome-tweaks

## Install system libraries
## ------------------------
apt-get -y install libbz2-dev libcppunit-dev libcurl4-openssl-dev libffi-dev libfmt-dev libfuse2 libgdbm-dev libglib2.0-dev libglib2.0-dev-bin libgmp-dev libgspell-1-dev libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev liblog4cpp5-dev libncurses5-dev libnss3-dev liborc-0.4-dev libosmocore-dev libreadline-dev libsodium-dev libspdlog-dev libsqlite3-dev libssl-dev libtool libuchardet-dev libxml2 libxml++2.6-dev libxml2-dev libxslt1-dev zlib1g-dev

## Install `python`
## ----------------
apt-get -y install python3-flask python3-future python3-geoip python3-httplib2 python3-numpy python3-paramiko python3-pip python3-psutil python3-pycurl python3-pyqt5 python3-requests python3-scapy python3-scipy python3-setuptools python3-urllib3 python3-virtualenv python3-wheel

## Install `Qt5`
## -------------
apt-get -y install pyqt5-dev-tools qttools5-dev-tools qt5-doc qt5-doc-html qtbase5-examples qtcreator

## Install `ruby`
## -------------
apt-get -y install ruby ruby-dev

## Install `apt`
## -------------
apt-get -y install apt-transport-https apt-utils

## Install common packages
## -----------------------
apt-get -y install apache2 asciinema autoconf autopsy binutils binwalk build-essential cmake curl debootstrap default-jre dirmngr dkms doxygen easytag filezilla g++ gcc gconf2 ghex git gnuradio gnuradio-dev gpg gr-osmosdr hexedit httrack jq kate keepassxc macchanger make mtools net-tools openvpn pidgin pkg-config proxychains screen screenfetch secure-delete simplescreenrecorder software-properties-common squashfs-tools subversion swig synaptic tree tor torbrowser-launcher vim wget xorriso

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

## Install files roller
## --------------------
apt-get -y install p7zip-full p7zip-rar rar unrar

## Install `evolution`
## -------------------
apt-get -y install evolution evolution-ews

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

## Clone `system` repository
## -------------------------
git clone https://github.com/neoslab/blackbuntu

## Clone `packages` repository
## ---------------------------
git clone https://github.com/neoslab/packages

## Generate DEB packages
## ---------------------
basetree="/tmp/packages"
for basedir in "$basetree"/*;
do
    for deb in "$basedir"/*;
    do
        if test -d "$deb";
        then
            dpkg-deb --build --root-owner-group $deb
        fi
    done
done

## Create folders tree
## --------------------
mkdir -p /opt/blackbuntu
mkdir -p /opt/blackbuntu/{cracking,crypto,exploitation,forensics,hardening,information-gathering,networking,reverse-engineering,sniffing-spoofing,stress-testing,utilities,vulnerability-analysis,web-applications,wireless}

## Install cracking tools
## -----------------------
apt-get -y install brutespray cewl cmospwd crunch hashcat hydra john medusa ncrack ophcrack patator
packages="/tmp/packages/cracking"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install exploitation tools
## --------------------------
apt-get -y install websploit yersinia
packages="/tmp/packages/exploitation"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install forensics tools
## -----------------------
apt-get -y install chntpw dc3dd extundelete foremost galleta guymager p0f
packages="/tmp/packages/forensics"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install hardening tools
## -----------------------
apt-get -y install apktool arduino lynis
packages="/tmp/packages/hardening"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install information gathering tools
## -----------------------------------
apt-get -y install arp-scan braa dmitry dnsenum dnsmap dnsrecon dnstracer dnswalk masscan nikto nmap parsero recon-ng smbmap sntop sslsplit traceroute whois
packages="/tmp/packages/information-gathering"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install networking tools
## -----------------------
apt-get -y install cryptcat dns2tcp httptunnel netcat
packages="/tmp/packages/networking"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install reverse engineering tools
## ---------------------------------
apt-get -y install edb-debugger valgrind yara
packages="/tmp/packages/reverse-engineering"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install sniffing & spoofing tools
## ---------------------------------
apt-get -y install ettercap-common ettercap-graphical wireshark
packages="/tmp/packages/sniffing-spoofing"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install stress testing tools
## ----------------------------
apt-get -y install dhcpig hping3 mdk3 slowhttptest t50 termineter
packages="/tmp/packages/stress-testing"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install utilities tools
## -----------------------
apt-get -y install polenum
packages="/tmp/packages/utilities"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install vulnerability analysis tools
## ------------------------------------
apt-get -y install doona sqlmap
packages="/tmp/packages/vulnerability-analysis"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install web applications tools
## ------------------------------
apt-get -y install dirb gobuster wfuzz whatweb
packages="/tmp/packages/web-applications"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## Install wireless tools
## ----------------------
apt-get -y install aircrack-ng cowpatty mfcuk mfoc multimon-ng pixiewps reaver wifite
packages="/tmp/packages/wireless"
for deb in "$packages"/*;
do
    if test -f "$deb";
    then
        dpkg -i $deb
    fi
done

## -------------- ##
## INSTALL EXTRAS ##
## -------------- ##

## Install `burpsuite`
## https://portswigger.net/burp
## ----------------------------
wget --progress=dot -O "/tmp/burpsuite.jar" "https://portswigger.net/burp/releases/download?product=community&type=Jar"
mkdir -p /opt/blackbuntu/exploitation/burpsuite
mv /tmp/burpsuite.jar /opt/blackbuntu/exploitation/burpsuite

## Install `atomicwallet`
## https://atomicwallet.io/
## ------------------------
wget --progress=dot -O "/tmp/atomicwallet.AppImage" "https://get.atomicwallet.io/download/atomicwallet-2.49.2-255.AppImage"
mkdir -p /opt/blackbuntu/crypto/atomicwallet
mv /tmp/atomicwallet.AppImage /opt/blackbuntu/crypto/atomicwallet/
chmod +x /opt/blackbuntu/crypto/atomicwallet/atomicwallet.AppImage


## Install `electrum-btc`
## https://electrum.org
## --------------------
wget --progress=dot -O "/tmp/electrum-btc.AppImage" "https://download.electrum.org/4.2.2/electrum-4.2.2-x86_64.AppImage"
mkdir -p /opt/blackbuntu/crypto/electrum-btc
mv /tmp/electrum-btc.AppImage /opt/blackbuntu/crypto/electrum-btc/
chmod +x /opt/blackbuntu/crypto/electrum-btc/electrum-btc.AppImage

## Install `electrum-ltc`
## https://electrum-ltc.org
## ------------------------
wget --progress=dot -O "/tmp/electrum-ltc.AppImage" "https://electrum-ltc.org/download/electrum-ltc-4.2.2.1-x86_64.AppImage"
mkdir -p /opt/blackbuntu/crypto/electrum-ltc
mv /tmp/electrum-ltc.AppImage /opt/blackbuntu/crypto/electrum-ltc/
chmod +x /opt/blackbuntu/crypto/electrum-ltc/electrum-ltc.AppImage

## Install `maltego`
## https://maltego.com
## -------------------
wget --progress=dot -O "/tmp/Maltego.v4.3.0.deb" "https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.0.deb"
dpkg -i /tmp/Maltego.v4.3.0.deb

## Install `monero`
## https://www.getmonero.org
## -------------------------
wget --progress=dot -O "/tmp/monero-gui-linux-x64-v0.18.0.0.tar.bz2" "https://downloads.getmonero.org/gui/monero-gui-linux-x64-v0.18.0.0.tar.bz2"
tar -xf /tmp/monero-gui-linux-x64-v0.18.0.0.tar.bz2
mv /tmp/monero-gui-v0.18.0.0 /opt/blackbuntu/crypto/monero
chmod +x /opt/blackbuntu/crypto/monero/monero-wallet-gui

## Install `MyCrypto`
## https://mycrypto.com
## --------------------
wget --progress=dot -O "/tmp/mycrypto.AppImage" "https://github.com/MyCryptoHQ/MyCrypto/releases/download/1.7.17/linux-x86-64_1.7.17_MyCrypto.AppImage"
mkdir -p /opt/blackbuntu/crypto/mycrypto
mv /tmp/mycrypto.AppImage /opt/blackbuntu/crypto/mycrypto/
chmod +x /opt/blackbuntu/crypto/mycrypto/mycrypto.AppImage

## Install `wpscan`
## https://wpscan.com
## ------------------
gem install wpscan

## ---------------- ##
## CONFIGURE SYSTEM ##
## ---------------- ##

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

## Setup user `bashrc`
## -------------------
rm -f /etc/skel/.bashrc
cp /tmp/blackbuntu/system/etc/skel/bashrc /etc/skel/.bashrc

## Setup root `bashrc`
## -------------------
rm -f /root/.bashrc
cp /tmp/blackbuntu/system/root/bashrc /root/.bashrc

## Replace `dconf`
## --------------
mkdir -p /etc/skel/.config
rm -rf /etc/skel/.config/dconf
cp -r /tmp/blackbuntu/system/etc/skel/config/dconf /etc/skel/.config/

## Configure backgrounds
## ---------------------
rm -rf /usr/share/backgrounds/*
cp /tmp/blackbuntu/system/usr/share/backgrounds/* /usr/share/backgrounds/
rm -f /usr/share/gnome-background-properties/jammy-wallpapers.xml
rm -f /usr/share/gnome-background-properties/ubuntu-wallpapers.xml
cp /tmp/blackbuntu/system/usr/share/gnome-background-properties/* /usr/share/gnome-background-properties/

## Configure utilities
## -------------------
cp /tmp/blackbuntu/system/usr/local/bin/* /usr/local/bin/
chmod +x /usr/local/bin/blackbuntu-*

## Replace `pixmaps`
## ----------------
rm -f /usr/share/ubiquity/pixmaps/cd_in_tray.png
rm -f /usr/share/ubiquity/pixmaps/ubuntu_installed.png
cp /tmp/blackbuntu/system/usr/share/ubiquity/pixmaps/cd_in_tray.png /usr/share/ubiquity/pixmaps/
cp /tmp/blackbuntu/system/usr/share/ubiquity/pixmaps/ubuntu_installed.png /usr/share/ubiquity/pixmaps/

## Replace `ubiquity-slideshow`
## ---------------------------
rm -rf /usr/share/ubiquity-slideshow
cp -r /tmp/blackbuntu/system/usr/share/ubiquity-slideshow /usr/share/

## Configure `plymouth`
## --------------------
rm -f /usr/share/plymouth/ubuntu-logo.png
cp /tmp/blackbuntu/system/usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/
rm -f /usr/share/plymouth/themes/spinner/watermark.png
cp /tmp/blackbuntu/system/usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/

## Update `initframs`
## ------------------
update-initramfs -u

## Import icons
## ------------
cp -r /tmp/blackbuntu/system/usr/share/icons/* /usr/share/icons/

## Import applications desktop
## ---------------------------
cp /tmp/blackbuntu/system/usr/share/applications/* /usr/share/applications/

## Edit system conf
## ----------------
sed -i "s/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=5s/" /etc/systemd/system.conf
sed -i "s/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=5s/" /etc/systemd/system.conf

## Remove launchers
## ----------------
rm -f /usr/share/applications/arduino.desktop
rm -f /usr/share/applications/edb.desktop
rm -f /usr/share/applications/ettercap.desktop
rm -f /usr/share/applications/guymager.desktop
rm -f /usr/share/applications/kismet.desktop
rm -f /usr/share/applications/lstopo.desktop
rm -f /usr/share/applications/lynis.desktop
rm -f /usr/share/applications/maltego_java_config.desktop
rm -f /usr/share/applications/maltego.desktop
rm -f /usr/share/applications/ophcrack.desktop
rm -f /usr/share/applications/org.wireshark.Wireshark.desktop
rm -f /usr/share/applications/torbrowser-settings.desktop
rm -f /usr/share/applications/ubiquity.desktop

## Clean `tmp` directory
## ---------------------
rm -rf /tmp/*

## Clean `bash` history
## --------------------
rm -f ~/.bash_history
rm -f /root/.bash_history
