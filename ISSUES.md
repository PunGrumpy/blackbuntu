### Troubleshooting

#### 1. Fixing "Key is stored in legacy trusted.gpg keyring" Issue in Ubuntu

```shell
sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
```

* * *

#### 2. Remove 'pro config set apt_news=false' notification when running `apt update`

```shell
sudo pro config set apt_news=false
```

To revert it to initial configuration

```shell
sudo pro config set apt_news=true
```

* * *

#### 3. Get a 404 error when trying to install or update Tor Browser

First we will remove all files of the previous installation or download attempt.

```shell
rm -rf /home/$USER/.cache/torbrowser
rm -rf /home/$USER/.local/share/torbrowser
```

Edit `/usr/lib/python3/dist-packages/torbrowser_launcher/common.py` line 171.

To revert it to initial configuration

```
#language = self.language
language = "ALL"
```

Edit `/usr/lib/python3/dist-packages/torbrowser_launcher/common.py` line 223.

```
"tbb": {
    "changelog": tbb_local
    + "/tbb/"
    + self.architecture
    + "/tor-browser"
    #+ "/tor-browser_"
    #+ language
    + "/Browser/TorBrowser/Docs/ChangeLog.txt",
    "dir": tbb_local + "/tbb/" + self.architecture,
    "dir_tbb": tbb_local
    + "/tbb/"
    + self.architecture
    + "/tor-browser",
    #+ "/tor-browser_"
    #+ language,
    "start": tbb_local
    + "/tbb/"
    + self.architecture
    + "/tor-browser"
    #+ "/tor-browser_"
    #+ language
    + "/start-tor-browser.desktop",
},
```

* * *

#### 4. Lost 'Softwares and Updates' after system upgrade

```shell
sudo apt -y install apturl gnome-remote-desktop nautilus-share python3-software-properties software-properties-common software-properties-gtk ubuntu-advantage-tools update-notifier update-notifier-common
```

* * *

#### 5. Update Burpsuite to the latest version

```shell
sudo apt -y install libc6-x32
cd /tmp/
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
sudo dpkg -i jdk-17_linux-x64_bin.deb
sudo dpkg -i jdk-19_linux-x64_bin.deb
sudo apt -y install openjdk-17-jdk openjdk-17-jre openjdk-19-jdk openjdk-19-jre
wget -O burpsuite.jar https://portswigger.net/burp/releases/download?product=community&type=Jar
sudo rm -f /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
sudo mv burpsuite.jar /opt/blackbuntu/exploitation/burpsuite/
sudo chmod +x /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
```
