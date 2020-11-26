# Getting Started

### Generating a SSH key
```
ssh-keygen -t ed25519 -f ~/.ssh/id_ed_github_oximeeg -P ""
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

### Clone
```
git clone oximeeg.github.com:oximeeg/env.git
```

# Application

### [Homebrew](https://brew.sh/)

- CUI
  ```
  brew install coreutils git git-lfs nodenv rbenv tig
  ```

- GUI
  ```
  brew install --cask iterm2 google-chrome visual-studio-code karabiner-elements
  ```

### rbenv
```
rbenv install -l
rbenv install 2.7.2
rbenv global 2.7.2
rbenv rehash
```

### nodenv
```
nodenv install -l | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 3 | awk '{print $1}'
nodenv install 15.2.1
nodenv global 15.2.1
nodenv rehash
```

### iTerm2
- General > Preferences > Load preferences

### Karabiner-Elements
- Preferences > Complex modifications > Add rule > Enable All

### Visual Studio Code

- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)

# Environment

### Shortcuts
- System Preferences > Keyboard > Shortcuts > App Shortcuts > `Merge All Windows` > `shift + command + t`

### App Preferences
- Terminal
  ```
  touch ~/.hushlogin
  ```

- Git
  ```
  mkdir -p ~/.config/git
  ln -snf ~/github/env/git/config.txt ~/.config/git/config
  ln -snf ~/github/env/git/ignore.txt ~/.config/git/ignore
  ln -snf ~/github/env/git/tigrc.txt ~/.tigrc
  ```

- Karabiner-Elements
  ```
  ln -snf ~/github/env/karabiner/hhkb.json \
          ~/.config/karabiner/assets/complex_modifications/hhkb.json
  ```

- Visual Studio Code
  ```
  ln -snf ~/github/env/vscode/keybindings.json \
          ~/Library/Application\ Support/Code/User/keybindings.json
  ln -snf ~/github/env/vscode/settings.json \
          ~/Library/Application\ Support/Code/User/settings.json
  ```

- Shell
  ```
  ln -snf ~/github/env/zsh/zprofile ~/.zprofile
  ln -snf ~/github/env/zsh/zshrc ~/.zshrc
  ```

- SDKMAN
  ```
  sed -i '' \
      -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/' \
          ${HOME}/.sdkman/etc/config
  sed -i '' \
      -e 's/sdkman_auto_selfupdate=false/sdkman_auto_selfupdate=true/' \
          ${HOME}/.sdkman/etc/config
  ```

### Change layout of Launchpad
```
defaults write com.apple.dock springboard-columns -int 9
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock ResetLaunchPad -bool TRUE
killall Dock
```

### Don't Write Network Stores of .DS_Store
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
```
