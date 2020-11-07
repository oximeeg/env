# Getting Started

### Generating a SSH key
```
ssh-keygen -t ed25519 -f ~/.ssh/id_ed_github_oximeeg
# Don't enter anything when asked for passphrase.
```

### Copy the SSH key to your clipboard.
```
pbcopy < ~/.ssh/id_ed_github_oximeeg.pub
```

### Adding a new SSH key
[Github settings page](https://github.com/settings/keys).

### SSH config
- Open config file
  ```
  code ~/.ssh/config
  ```

- Add github host
  ```
  Host oximeeg.github.com
    User git
    HostName github.com
    IdentityFile ~/.ssh/id_ed_github_oximeeg
    IdentitiesOnly yes
  ```

- Verify
  ```
  ssh -T oximeeg.github.com
  ```
