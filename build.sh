#!/bin/bash

## ---------------- ##
## Define Variables ##
## ---------------- ##

## Colour output
## -------------
t_error="\033[01;31m"	# Error
t_valid="\033[01;32m"	# Valid
t_alert="\033[01;33m"	# Alert
t_title="\033[01;34m"	# Title
t_reset="\033[00m"		# Reset

## Clear screen
## ------------
function clearscreen()
{
	clear
	sleep 2s
}

## Keep alive
## ----------
function keepalive()
{
	sudo -v
	while true;
	do
		sudo -n true;
		sleep 60s;
		kill -0 "$$" || exit;
	done 2>/dev/null &
}

## Load banner
## -----------
function showbanner()
{
	clear
	echo -e "${t_error}  _     _            _    _                 _          ${t_reset}"
	echo -e "${t_error} | |   | |          | |  | |               | |         ${t_reset}"
	echo -e "${t_error} | |__ | | __ _  ___| | _| |__  _   _ _ __ | |_ _   _  ${t_reset}"
	echo -e "${t_error} | '_ \| |/ _' |/ __| |/ / '_ \| | | | '_ \| __| | | | ${t_reset}"
	echo -e "${t_error} | |_) | | (_| | (__|   <| |_) | |_| | | | | |_| |_| | ${t_reset}"
	echo -e "${t_error} |_'__/|_|\__'_|\___|_|\_\_'__/ \__'_|_| |_|\__|\__'_| ${t_reset}"
	echo -e "${t_error}                                      v22.04 LTS amd64 ${t_reset}"
	echo
	echo -e "${t_valid}[i] [Package]: blackbuntu-builder${t_reset}"
	echo -e "${t_valid}[i] [Website]: https://blackbuntu.org${t_reset}"
  	sleep 3s
}

## Check Internet status
## ---------------------
function checkinternet()
{
	for i in {1..10};
	do
		ping -c 1 -W ${i} www.google.com &>/dev/null && break;
	done

	if [[ "$?" -ne 0 ]];
	then
		echo
		echo -e "${t_error}Error ~ Possible DNS issues or no Internet connection${t_reset}"
		echo -e "${t_error}Quitting ...${t_reset}\n"
		exit 1
	fi
}

## Select the version to build
## ---------------------------
function buildselect()
{
	echo
    echo -e "${t_error}*** Warning ***${t_reset}"
    echo -e "${t_error}You are about to build BlackBuntu Linux from scratch${t_reset}"
    echo -e "${t_error}Please select which version you want to build${t_reset}"
    echo
    echo -e "1. Server Edition"
    echo -e "2. Full Edition"
    echo -e "3. Light Edition"
    echo -e "4. Quit"

    read -p "Choose the BlackBuntu version to build: " version
    case $version in
        [1]* )
			buildtype="server"
			echo
			echo -e "${t_valid}*** Installing Server Edition ***${t_reset}"
            ;;
        [2]* )
			buildtype="full"
			echo
			echo -e "${t_valid}*** Installing Full Edition ***${t_reset}"
            ;;
        [3]* )
			buildtype="light"
			echo
			echo -e "${t_valid}*** Installing Light Edition ***${t_reset}"
            ;;
        [4]* )
			echo
			echo -e "${t_error}User requested to exist${t_reset}"
			echo -e "${t_error}Quitting ...${t_reset}\n"
			exit 1
            ;;
        * )
            echo -e "${t_error}Invalid option [$version]${t_reset}"
			echo -e "${t_error}Quitting ...${t_reset}\n"
			exit 1
            ;;
    esac
}

## Export environment
## ------------------
function exportenv()
{
	export PYTHONWARNINGS=ignore
}

## Configure APT sources
## ---------------------
function aptsources()
{
	add-apt-repository -y main
	add-apt-repository -y restricted
	add-apt-repository -y universe
	add-apt-repository -y multiverse

	cd /tmp/
	wget -O - https://packages.blackbuntu.org/keys/blackbuntu.public | apt-key add - >/dev/null 2>&1
	echo "deb [arch=amd64] https://packages.blackbuntu.org stable main" | tee /etc/apt/sources.list.d/blackbuntu.list >/dev/null 2>&1
	cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
	cd /root/
}

## Clean orphaned packages
## -----------------------
function cleanorphans()
{
	apt-get -y purge --auto-remove zsys >/dev/null 2>&1
}

## Keep system safe
## ----------------
function systemupdate()
{
	apt-get -y update && apt -y upgrade && apt -y dist-upgrade
	apt-get -y remove && apt -y autoremove
	apt-get -y clean && apt -y autoclean
}

## Disable error reporting
## -----------------------
function disableapport()
{
	sed -i "s/enabled=1/enabled=0/" /etc/default/apport
}

## Remove unwanted packages
## ------------------------
function removeunwanted()
{
	apt-get -y purge --auto-remove aisleriot gnome-initial-setup gnome-mahjongg gnome-mines gnome-sudoku thunderbird libreoffice*
}

## Install `kernel`
## ----------------
function installkernel()
{
	apt-get -y install linux-generic
}

## Install `dejavu` font
## ---------------------
function installfonts()
{
	apt-get -y install fonts-dejavu
}

## Install `gnome` extras
## ----------------------
function installgnome()
{
	apt-get -y install gnome-shell-extension-manager gnome-shell-extensions gnome-firmware gnome-tweaks
}

## Install system libraries
## ------------------------
function installlibs()
{
	apt-get -y install libbz2-dev libc6-x32 libcppunit-dev libcurl4-openssl-dev libffi-dev libfmt-dev libfuse2 libgdbm-dev libglib2.0-dev libglib2.0-dev-bin libgmp-dev libgspell-1-dev libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev liblog4cpp5-dev libncurses5-dev libnss3-dev liborc-0.4-dev libosmocore-dev libreadline-dev libsodium-dev libspdlog-dev libsqlite3-dev libssl-dev libtool libuchardet-dev libxml2 libxml++2.6-dev libxml2-dev libxslt1-dev zlib1g-dev
}

## Install `python`
## ----------------
function installpython()
{
	apt-get -y install python3-flask python3-future python3-geoip python3-httplib2 python3-numpy python3-paramiko python3-pip python3-psutil python3-pycurl python3-pyqt5 python3-requests python3-scapy python3-scipy python3-setuptools python3-urllib3 python3-virtualenv python3-wheel
	ln -s /usr/bin/python3 /usr/bin/python
}

## Install `Qt5`
## -------------
function installqt5()
{
	apt-get -y install pyqt5-dev pyqt5-dev-tools qttools5-dev-tools qt5-doc qt5-doc-html qtbase5-examples qtcreator
}

## Install `ruby`
## -------------
function installruby()
{
	apt-get -y install ruby ruby-dev
}

## Install common packages
## -----------------------
function installcommons()
{
	apt-get -y install apache2 apt-transport-https apt-utils asciinema autoconf autopsy binutils binwalk build-essential cmake curl debootstrap default-jre default-jdk dirmngr dkms doxygen easytag filezilla fuse3 g++ gcc gconf2 ghex git gpg gr-osmosdr hexedit httrack jq kate keepassxc macchanger make mtools net-tools ninja-build openvpn pidgin pkg-config proxychains screen screenfetch secure-delete shutter simplescreenrecorder socat software-properties-common squashfs-tools subversion swig synaptic tree tor torbrowser-launcher vim wget xorriso
}

## Install Java SE
## ---------------
function installjava()
{
	cd /tmp/
	wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
	wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
	dpkg -i jdk-17_linux-x64_bin.deb
	dpkg -i jdk-19_linux-x64_bin.deb
	apt-get -y install openjdk-17-jdk openjdk-17-jre openjdk-19-jdk openjdk-19-jre
	cd /root/
}

## Install files roller
## --------------------
function installroller()
{
	apt-get -y install p7zip-full p7zip-rar rar unrar
}

## Install `evolution`
## -------------------
function installevolution()
{
	apt-get -y install evolution evolution-ews
}

## Install cracking tools
## -----------------------
function installcracking()
{
	apt-get -y install brutespray cewl cmospwd crunch hashcat hydra john medusa ncrack ophcrack patator
	apt-get -y install crowbar gpp-decrypt rainbowcrack rsmangler truecrack
}

## Install exploitation tools
## --------------------------
function installexploitation()
{
	apt-get -y install websploit yersinia
	apt-get -y install cge commix exe2hex jexboss libenom routersploit sharpmeter shellnoob
}

## Install forensics tools
## -----------------------
function installforensics()
{
	apt-get -y install chntpw dc3dd extundelete foremost galleta guymager p0f
	apt-get -y install ddrescue dumpzilla pdfid pdf-parser
}

## Install hardening tools
## -----------------------
function installhardening()
{
	apt-get -y install apktool arduino lynis
	apt-get -y install dex2jar
}

## Install information gathering tools
## -----------------------------------
function installrecon()
{
	apt-get -y install arp-scan braa dmitry dnsenum dnsmap dnsrecon dnstracer dnswalk masscan nikto nmap parsero recon-ng smbmap sntop sslsplit traceroute whois
	apt-get -y install enum4linux fierce gnmap lbd linenum phoneinfoga smtp-user-enum
}

## Install networking tools
## ------------------------
function installnetworking()
{
	apt-get -y install cryptcat dns2tcp httptunnel netcat
	apt-get -y install cymothoa nishang powersploit pwnat reverser webshells
}

## Install reverse engineering tools
## ---------------------------------
function installreverse()
{
	apt-get -y install edb-debugger valgrind yara
	apt-get -y install jad javasnoop
}

## Install sniffing & spoofing tools
## ---------------------------------
function installsnoofing()
{
	apt-get -y install ettercap-common ettercap-graphical wireshark
	apt-get -y install mitmdump mitmproxy mitmweb sniffjoke webscarab zaproxy
}

## Install stress testing tools
## ----------------------------
function installstressing()
{
	apt-get -y install dhcpig hping3 mdk3 slowhttptest t50 termineter
	apt-get -y install iaxflood rtpflood thc-ssl-dos udpflood
}

## Install utilities tools
## -----------------------
function installutils()
{
	apt-get -y install polenum
	apt-get -y install dracnmap ridenum subbrute webtrace
}

## Install vulnerability analysis tools
## ------------------------------------
function installvulns()
{
	apt-get -y install doona sqlmap
	apt-get -y install bed jsql-injection sfuzz sidguesser tnscmd10g unix-privesc
}

## Install web applications tools
## ------------------------------
function installwebapps()
{
	apt-get -y install dirb gobuster wfuzz whatweb
	apt-get -y install cmsmap dirbuster hurl
}

## Install wireless tools
## ----------------------
function installwireless()
{
	apt-get -y install aircrack-ng cowpatty mfcuk mfoc multimon-ng pixiewps reaver wifite
	apt-get -y install blueranger fluxion wifi-honey wps-breaker
}

## Clone `system` repository
## -------------------------
function systemclone()
{
	cd /tmp/
	git clone https://github.com/neoslab/blackbuntu
	cd /root/
}

## Configure system
## ----------------
function systemconfig()
{
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

	## Update `ubiquity`
	## -----------------
	rm -f /usr/share/ubiquity/pixmaps/cd_in_tray.png
	rm -f /usr/share/ubiquity/pixmaps/ubuntu_installed.png
	cp /tmp/blackbuntu/system/usr/share/ubiquity/pixmaps/cd_in_tray.png /usr/share/ubiquity/pixmaps/
	cp /tmp/blackbuntu/system/usr/share/ubiquity/pixmaps/ubuntu_installed.png /usr/share/ubiquity/pixmaps/

	## Replace `ubiquity-slideshow`
	## ----------------------------
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
}

## Launch
## ------
function launch()
{
	clearscreen
	keepalive
	showbanner
	checkinternet
	buildselect
	exportenv
	aptsources
	cleanorphans
	systemupdate
	disableapport
	removeunwanted
	installkernel
	installfonts
	installgnome
	installlibs
	installpython
	installqt5
	installruby
	installcommons
	installjava
	installroller

	if [ $buildtype == "full" ];
	then
	    installevolution
	fi

	systemupdate
	installcracking
	installexploitation
	installforensics
	installhardening
	installrecon
	installnetworking
	installreverse
	installsnoofing
	installstressing
	installutils
	installvulns
	installwebapps
	installwireless
	systemupdate
	systemclone
	systemconfig
}

## -------- ##
## Callback ##
## -------- ##

launch
