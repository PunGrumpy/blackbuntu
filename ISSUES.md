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