### Extras

#### 1. Install `cubic`

```shell
sudo apt-add-repository -y ppa:cubic-wizard/release
sudo apt-get -y update && sudo apt-get -y install cubic
```

* * *

#### 2. Install `sublime-text`

```shell
cd /tmp/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list >/dev/null
sudo apt-get -y update && sudo apt-get -y install sublime-text
cd /
```

#### 3. Install `filezilla`

```shell
sudo apt-get -y install filezilla
```

* * *

#### 4. Install `shutter`

```shell
sudo apt-get -y install shutter
```

* * *

#### 5. Install `git-lfs`

```shell
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
```

* * *

#### 6. Install `metasploit`

```shell
cd /tmp/
wget -O "msfinstall" "https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb"
chmod +x msfinstall
./msfinstall
sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/metasploit-keyring.gpg
cd /
```

* * *

#### 7. Install `gimp`

```shell
sudo apt-get -y install gimp gimp-data gimp-data-extras gimp-plugin-registry gimp-texturize
```

* * *

#### 8. Install `inkscape`

```shell
sudo apt-get -y install inkscape
```

* * *

#### 9. Install `kdenlive`

```shell
sudo apt-get -y install kdenlive
```

* * *

#### 10. Install `evolution`

```shell
sudo apt-get -y install evolution evolution-ews
```


* * *

#### 9. Install `libreoffice`

```shell
sudo apt-get -y install libreoffice
```