# After install

## System

### Secure Boot (`lanzaboote`)

```zsh
sudo bootctl status
```

```zsh
sudo sbctl create-keys
sudo sbctl verify
```

Then `reboot` and enter BIOS, set `Secure Boot` to SETUP mode.


```zsh
sudo sbctl enroll-keys --microsoft
```

(` --microsoft` is for Windows dual-boot.)

`reboot` and check `sudo bootctl status`.

## Home

### Mihomo (Clash-Meta)

copy `config.yaml` to `/etc/mihomo/config.yaml`

then `sudo systemctl restart mihomo`

### Auths (Login)

- Google Chrome
- Steam

### CloudFlare WARP (`warp-cli`)

```zsh
warp-cli register
```
(Use as alternative proxy provider. Connect: `warp-cli connect`)

### DoomEmacs

```zsh
doom sync
```
