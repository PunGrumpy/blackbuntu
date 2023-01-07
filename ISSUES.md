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