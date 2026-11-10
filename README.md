# dotfiles

Personal dotfiles for macOS. If you're on Linux or Windows, you're on your own.

> [!NOTE]
> I know the wallpapers are heavy for GitHub. Uploading them somewhere else and linking back is effort I'm not putting in. It's my repo, I do what I want.

## Install

**1. Clone the repo**

```sh
git clone https://github.com/alexisceballosc/dotfiles.git ~/dotfiles
```

**2. Install [Homebrew](https://brew.sh)**

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**3. Install Homebrew dependencies**

```sh
brew install stow
brew bundle --file ~/dotfiles/brewfile/.config/Brewfile
```

**4. Stow everything**

```sh
cd ~/dotfiles && stow */
```

**5. Sign in to 1Password**

SSH keys come from the 1Password SSH agent. Git over SSH doesn't work without it.
