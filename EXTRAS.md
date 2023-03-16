### Extras

#### 1. Install `cubic`

```shell
sudo apt-add-repository -y ppa:cubic-wizard/release
sudo apt-get -y update && sudo apt-get -y install cubic
```

* * *

#### 2. Install `virtualbox`

```shell
sudo apt-get -y install virtualbox virtualbox-dkms virtualbox-guest-utils
```

* * *

#### 3. Install `sublime-text`

```shell
cd /tmp/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list >/dev/null
sudo apt-get -y update && sudo apt-get -y install sublime-text
cd /
```

#### 4. Install `filezilla`

```shell
sudo apt-get -y install filezilla
```

* * *

#### 5. Install `shutter`

```shell
sudo apt-get -y install shutter
```

* * *

#### 6. Install `pyside2`

```shell
python3 -m pip install pyside2
```
