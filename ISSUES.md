### Troubleshooting

* * *

#### 1. Update Burpsuite to the latest version on BlackBuntu v22.04.1

```shell
sudo apt-get -y install libc6-x32
cd /tmp/
wget -O "jdk-17_linux-x64_bin.deb" "https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb"
wget -O "jdk-19_linux-x64_bin.deb" "https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb"
sudo dpkg -i jdk-17_linux-x64_bin.deb
sudo dpkg -i jdk-19_linux-x64_bin.deb
sudo apt-get -y install openjdk-17-jdk openjdk-17-jre openjdk-19-jdk openjdk-19-jre
wget -O "burpsuite.jar" "https://portswigger.net/burp/releases/download?product=community&type=Jar"
sudo rm -f /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
sudo mv burpsuite.jar /opt/blackbuntu/exploitation/burpsuite/
sudo chmod +x /opt/blackbuntu/exploitation/burpsuite/burpsuite.jar
cd /
```

* * *

#### 2. Update Electrum BTC AppImage on BlackBuntu v22.04.1

```shell
cd /tmp/
wget -O "electrum-btc.AppImage" "https://download.electrum.org/4.3.4/electrum-4.3.4-x86_64.AppImage"
sudo rm -f /opt/blackbuntu/crypto/electrum-btc/electrum-btc.AppImage
sudo mv electrum-btc.AppImage /opt/blackbuntu/crypto/electrum-btc/
sudo chmod +x /opt/blackbuntu/crypto/electrum-btc/electrum-btc.AppImage
cd /
```

* * *

#### 3. Update Electrum LTC AppImage on BlackBuntu v22.04.1

```shell
cd /tmp/
wget -O "electrum-ltc.AppImage" "https://electrum-ltc.org/download/electrum-ltc-4.2.2.1-x86_64.AppImage"
sudo rm -f /opt/blackbuntu/crypto/electrum-ltc/electrum-ltc.AppImage
sudo mv electrum-ltc.AppImage /opt/blackbuntu/crypto/electrum-ltc/
sudo chmod +x /opt/blackbuntu/crypto/electrum-ltc/electrum-ltc.AppImage
cd /
```

* * *

#### 4. Update Monero GUI Wallet on BlackBuntu v22.04.1

```shell
cd /tmp/
wget -O "monero.tar.bz2" "https://downloads.getmonero.org/gui/linux64"
tar -xf monero.tar.bz2
sudo rm -rf /opt/blackbuntu/crypto/monero/
sudo mv monero-gui-* /opt/blackbuntu/crypto/monero/
cd /
```

* * *

#### 5. Python 3 PIP Warning 'Consider adding this directory to PATH' on BlackBuntu v22.04.1

```shell
nano /home/$USER/.bashrc
```

Once the editor is open, add the following at the bottom and save it. You can directly press `Ctrl+End` to reach the end of the file.

```plain
# PIP Export Path 
# ===============
export PATH=$PATH:/home/$USER/.local/bin
```
