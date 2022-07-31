### Extras

#### 1. Install `cubic`

```shell
sudo apt-add-repository -y ppa:cubic-wizard/release
sudo apt-get -y update && sudo apt -y install cubic
```

* * *

#### 2. Install `virtualbox`

```shell
sudo apt-get -y install virtualbox virtualbox-dkms virtualbox-guest-dkms virtualbox-guest-utils
```

* * *

#### 3. Install `metasploit`

```shell
cd /tmp/
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
sudo ./msfinstall
msfconsole
```

* * *

#### 4. Install `gimp`

```shell
sudo apt-get -y install gimp gimp-data gimp-data-extras gimp-plugin-registry gimp-texturize
```

* * *

#### 5. Install `inkscape`

```shell
sudo apt-get -y install inkscape
```

* * *

#### 6. Install `kdenlive`

```shell
sudo apt-get -y install kdenlive
```

* * *

####7. Install `libreoffice`

```shell
sudo apt-get -y install libreoffice
```

* * *

#### 8. Install `holehe`

```shell
cd /opt/blackbuntu/information-gathering/
sudo git clone https://github.com/megadose/holehe holehe
cd /opt/blackbuntu/information-gathering/holehe/
sudo python3 setup.py install
```

* * *

#### 9. Install `ignorant`

```shell
cd /opt/blackbuntu/information-gathering/
sudo git clone https://github.com/megadose/ignorant ignorant
cd /opt/blackbuntu/information-gathering/ignorant/
sudo python3 setup.py install
```

* * *

#### 10. Install `OnionSearch`

```shell
cd /opt/blackbuntu/information-gathering/
sudo git clone https://github.com/megadose/OnionSearch onionsearch
cd /opt/blackbuntu/information-gathering/onionsearch/
sudo python3 setup.py install
```

* * *

#### 11. Install `toutatis`

```shell
cd /opt/blackbuntu/information-gathering/
sudo git clone https://github.com/megadose/toutatis toutatis
cd /opt/blackbuntu/information-gathering/toutatis/
sudo python3 setup.py install
```

* * *

#### 12. Install `atom`

```shell
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt -y update && sudo apt -y install atom
```
