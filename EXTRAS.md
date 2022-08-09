### Extras

#### 1. Install `cubic`

```shell
sudo apt-add-repository -y ppa:cubic-wizard/release
sudo apt-get -y update && sudo apt -y install cubic
```

* * *

#### 2. Install `virtualbox`

```shell
sudo apt-get -y install virtualbox virtualbox-dkms virtualbox-guest-utils
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

#### 7. Install `holehe`

```shell
python3 -m pip install holehe
```

* * *

#### 8. Install `ignorant`

```shell
python3 -m pip install ignorant
```

* * *

#### 9. Install `OnionSearch`

```shell
python3 -m pip install onionsearch
```

* * *

#### 10. Install `toutatis`

```shell
python3 -m pip install toutatis
```

* * *

#### 11. Install `atom`

```shell
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt -y update && sudo apt -y install atom
```
