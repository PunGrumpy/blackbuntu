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
wget -O "burpsuite.jar" "https://portswigger.net/burp/releases/download?product=community&type=Jar"
sudo rm -f /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
sudo mv burpsuite.jar /opt/blackbuntu/exploitation/burpsuite/
sudo chmod +x /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
cd /
```

* * *

#### 6. Update Electrum BTC AppImage

```shell
cd /tmp/
wget -O "electrum-btc.AppImage" "https://download.electrum.org/4.3.4/electrum-4.3.4-x86_64.AppImage"
sudo rm -f /opt/blackbuntu/crypto/electrum-btc/electrum-btc.AppImage
sudo mv electrum-btc.AppImage /opt/blackbuntu/crypto/electrum-btc/
sudo chmod +x /opt/blackbuntu/crypto/electrum-btc/electrum-btc.AppImage
cd /
```

* * *

#### 7. Update Electrum LTC AppImage

```shell
cd /tmp/
wget -O "electrum-ltc.AppImage" "https://electrum-ltc.org/download/electrum-ltc-4.2.2.1-x86_64.AppImage"
sudo rm -f /opt/blackbuntu/crypto/electrum-ltc/electrum-ltc.AppImage
sudo mv electrum-ltc.AppImage /opt/blackbuntu/crypto/electrum-ltc/
sudo chmod +x /opt/blackbuntu/crypto/electrum-ltc/electrum-ltc.AppImage
cd /
```

* * *

#### 8. Update Monero GUI Wallet

```shell
cd /tmp/
wget -O "monero.tar.bz2" "https://downloads.getmonero.org/gui/linux64"
tar -xf monero.tar.bz2
sudo rm -rf /opt/blackbuntu/crypto/monero/
sudo mv monero-gui-* /opt/blackbuntu/crypto/monero/
cd /
```

* * *

#### 9. Python 3 PIP Warning 'Consider adding this directory to PATH'

```shell
nano /home/$USER/.bashrc
```

Once the editor is open, add the following at the bottom and save it. You can directly press `Ctrl+End` to reach the end of the file.

´´´
# Fix PIP Alias
# =============
export PATH=$PATH:/home/$USER/.local/bin
```
