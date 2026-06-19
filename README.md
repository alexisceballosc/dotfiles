# dotfiles

Personal dotfiles for macOS. If you're on Linux or Windows, you're on your own.

## Install

**1. Install [1Password](https://1password.com/downloads/mac/) and sign in**

SSH keys and secrets are pulled from 1Password at runtime. Nothing works without it.

**2. Install [Homebrew](https://brew.sh)**

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**3. Clone the repo**

```sh
git clone https://github.com/alexisceballos/dotfiles.git ~/dotfiles
```

**4. Install Homebrew dependencies**

```sh
brew install stow
brew bundle --file ~/dotfiles/brewfile/.config/Brewfile
```

**5. Stow everything**

```sh
cd ~/dotfiles && stow *
```
