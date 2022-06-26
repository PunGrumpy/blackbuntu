#!/bin/bash

## -------------- ##
## INSTALL SYSTEM ##
## -------------- ##

## Export environment
## ------------------
export HOME=/root
export LC_ALL=C
export PYTHONWARNINGS=ignore

## Configure APT sources
## ---------------------
add-apt-repository -y main
add-apt-repository -y restricted
add-apt-repository -y universe
add-apt-repository -y multiverse

## Set hostname
## ------------
echo "blackbuntu" > /etc/hostname

## Move to temp directory
## ----------------------
cd /tmp/

## Update cache repository
## -----------------------
apt-get -y update

## Install `systemd`
## -----------------
apt-get -y install libterm-readline-gnu-perl systemd-sysv

## Configure `machine-id`
## ----------------------
dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

## Configure `diversion`
## ---------------------
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

## Install live packages
## ---------------------
apt-get -y install casper discover grub2-common grub-common grub-gfxpayload-lists grub-pc grub-pc-bin laptop-detect locales lupin-casper net-tools netplan.io network-manager os-prober resolvconf sudo ubuntu-standard wireless-tools

## Install `kernel`
## ----------------
apt-get -y install linux-generic

## Install `ubiquity`
## ------------------
apt-get -y install ubiquity ubiquity-casper ubiquity-frontend-gtk ubiquity-slideshow-ubuntu ubiquity-ubuntu-artwork

## Install `plymouth` and `desktop`
## -------------------------------
apt-get -y install plymouth-theme-ubuntu-logo ubuntu-gnome-desktop ubuntu-gnome-wallpapers

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
apt-get -y install gnome-firmware gnome-tweak-tool

## Install system libraries
## ------------------------
apt-get -y install libbz2-dev libcppunit-dev libcurl4-openssl-dev libffi-dev libfmt-dev libgdbm-dev libglib2.0-dev libglib2.0-dev-bin libgmp-dev libgspell-1-dev libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev liblog4cpp5-dev libncurses5-dev libnss3-dev liborc-0.4-dev libosmocore-dev libreadline-dev libsodium-dev libspdlog-dev libsqlite3-dev libssl-dev libtool libuchardet-dev libxml2 libxml++2.6-dev libxml2-dev libxslt1-dev zlib1g-dev

## Install `python`
## ----------------
apt-get -y install python3-flask python3-future python3-geoip python3-httplib2 python3-numpy python3-paramiko python3-pip python3-psutil python3-pycurl python3-pyqt5 python3-requests python3-scapy python3-scipy python3-setuptools python3-urllib3 python3-virtualenv python3-wheel

## Install `Qt5`
## -------------
apt-get -y install pyqt5-dev-tools qttools5-dev-tools qt5-default qt5-doc qt5-doc-html qtbase5-examples qtcreator

## Install `ruby`
## -------------
apt-get -y install ruby ruby-dev

## Install `apt`
## -------------
apt-get -y install apt-transport-https apt-utils

## Install common packages
## -----------------------
apt-get -y install apache2 asciinema autoconf autopsy binutils binwalk build-essential cmake curl debootstrap default-jre dirmngr dkms doxygen easytag filezilla g++ gcc gconf2 ghex git gnuradio gnuradio-dev gpg gr-osmosdr hexedit httrack jq kate keepassxc macchanger make mtools net-tools openvpn pidgin pkg-config proxychains screen screenfetch secure-delete simplescreenrecorder software-properties-common squashfs-tools subversion swig synaptic tree tor torbrowser-launcher vim wget xorriso

## Install files roller
## --------------------
apt-get -y install p7zip-full p7zip-rar rar unrar

## Install `evolution`
## -------------------
apt-get -y install evolution evolution-ews

## Install `shutter`
## -----------------
add-apt-repository -y ppa:linuxuprising/shutter
apt-get -y update && apt-get -y install shutter

## Keep system safe
## ----------------
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean

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
apt-get -y install aircrack-ng cowpatty kismet mfcuk mfoc multimon-ng pixiewps reaver wifite
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

## Install `electrum`
## https://electrum.org
## --------------------
wget --progress=dot -O "/tmp/electrum.AppImage" "https://download.electrum.org/4.2.2/electrum-4.2.2-x86_64.AppImage"
mkdir -p /opt/blackbuntu/crypto/electrum
mv /tmp/electrum.AppImage /opt/blackbuntu/crypto/electrum/
chmod +x /opt/blackbuntu/crypto/electrum/electrum.AppImage

## Install `maltego`
## https://maltego.com
## -------------------
wget --progress=dot -O "/tmp/Maltego.v4.3.0.deb" "https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.0.deb"
dpkg -i /tmp/Maltego.v4.3.0.deb

## Install `monero`
## https://www.getmonero.org
## -------------------------
wget --progress=dot -O "/tmp/monero-gui-linux-x64-v0.17.3.2.tar.bz2" "https://downloads.getmonero.org/gui/monero-gui-linux-x64-v0.17.3.2.tar.bz2"
tar -xf /tmp/monero-gui-linux-x64-v0.17.3.2.tar.bz2
mv /tmp/monero-gui-v0.17.3.2 /opt/blackbuntu/crypto/monero
chmod +x /opt/blackbuntu/crypto/monero/monero-wallet-gui

## Install `wpscan`
## https://wpscan.com
## ------------------
gem install wpscan

## ----------------- ##
## CONFIGURE NETWORK ##
## ----------------- ##

## Configure `network manager`
## --------------------------
cat <<EOF > /etc/NetworkManager/NetworkManager.conf
[main]
rc-manager=resolvconf
plugins=ifupdown,keyfile
dns=dnsmasq

[ifupdown]
managed=false
EOF

## DPKG Reconfigure
## ----------------
dpkg-reconfigure locales
dpkg-reconfigure resolvconf
dpkg-reconfigure network-manager

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
cp /tmp/system/etc/skel/bashrc /etc/skel/.bashrc

## Setup root `bashrc`
## -------------------
rm -f /root/.bashrc
cp /tmp/system/root/bashrc /root/.bashrc

## Replace `dconf`
## --------------
mkdir -p /etc/skel/.config
rm -rf /etc/skel/.config/dconf
cp -r /tmp/system/etc/skel/config/dconf /etc/skel/.config/

## Configure backgrounds
## ---------------------
rm -rf /usr/share/backgrounds/*
cp /tmp/system/usr/share/backgrounds/* /usr/share/backgrounds/
rm -f /usr/share/gnome-background-properties/*
cp /tmp/system/usr/share/gnome-background-properties/* /usr/share/gnome-background-properties/

## Configure utilities
## -------------------
cp /tmp/system/usr/local/bin/* /usr/local/bin/
chmod +x /usr/local/bin/blackbuntu-*

## Replace `casper.conf`
## --------------------
rm -f /etc/casper.conf
cp /tmp/system/etc/casper.conf /etc/

## Replace `os-release`
## --------------------
rm -f /etc/os-release
rm -f /usr/lib/os-release
cp /tmp/system/usr/lib/os-release /usr/lib/
ln -s /usr/lib/os-release /etc/os-release

## Replace `pixmaps`
## ----------------
rm -f /usr/share/ubiquity/pixmaps/cd_in_tray.png
rm -f /usr/share/ubiquity/pixmaps/ubuntu_installed.png
cp /tmp/system/usr/share/ubiquity/pixmaps/cd_in_tray.png /usr/share/ubiquity/pixmaps/
cp /tmp/system/usr/share/ubiquity/pixmaps/ubuntu_installed.png /usr/share/ubiquity/pixmaps/

## Replace `ubiquity-slideshow`
## ---------------------------
rm -rf /usr/share/ubiquity-slideshow
cp -r /tmp/system/usr/share/ubiquity-slideshow /usr/share/

## Configure `plymouth`
## --------------------
rm -f /usr/share/plymouth/ubuntu-logo.png
cp /tmp/system/usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/
rm -f /usr/share/plymouth/themes/spinner/watermark.png
cp /tmp/system/usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/

## Update `initframs`
## ------------------
update-initramfs -u

## Import icons
## ------------
cp -r /tmp/system/usr/share/icons/* /usr/share/icons/

## Import applications desktop
## ---------------------------
cp /tmp/system/usr/share/applications/* /usr/share/applications/

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
rm -f /usr/share/applications/maltego_config.desktop
rm -f /usr/share/applications/maltego.desktop
rm -f /usr/share/applications/ophcrack.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.app.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.daemon.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.kcm.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.nonplasma.desktop
rm -f /usr/share/applications/org.kde.kdeconnect_open.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.sms.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.smshandler.desktop
rm -f /usr/share/applications/org.kde.kdeconnect.telhandler.desktop
rm -f /usr/share/applications/org.kde.kded5.desktop
rm -f /usr/share/applications/torbrowser-settings.desktop
rm -f /usr/share/applications/ubiquity.desktop
rm -f /usr/share/applications/wireshark.desktop

## Configure `gdm`
## ---------------
blackbuntu-gdm

## Truncate `machine-id`
## ---------------------
truncate -s 0 /etc/machine-id

## Remove `diversion`
## ------------------
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl

## Clean `tmp` directory
## ---------------------
rm -rf /tmp/*

## Clean `bash` history
## --------------------
rm -f ~/.bash_history
rm -f /root/.bash_history
