### Extras

#### 1. Install `cubic`

```shell
sudo apt-add-repository -y ppa:cubic-wizard/release
sudo apt -y update && sudo apt -y install cubic
```

* * *

#### 2. Install `virtualbox`

```shell
sudo apt -y install virtualbox virtualbox-dkms virtualbox-guest-utils
```

* * *

#### 3. Install `metasploit`

```shell
cd /tmp/
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
sudo ./msfinstall
msfconsole
cd /
```

* * *

#### 4. Install `gimp`

```shell
sudo apt -y install gimp gimp-data gimp-data-extras gimp-plugin-registry gimp-texturize
```

* * *

#### 5. Install `inkscape`

```shell
sudo apt -y install inkscape
```

* * *

#### 6. Install `kdenlive`

```shell
sudo apt -y install kdenlive
```

* * *

#### 7. Install `sublime-text`

```shell
cd /tmp/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list >/dev/null
sudo apt -y update && sudo apt -y install sublime-text
cd /
```

* * *

#### 8. Install `pyside2`

```shell
python3 -m pip install pyside2
```

* * *

#### 9. Install `pyqt5`

```shell
python3 -m pip install pyqt5
```
