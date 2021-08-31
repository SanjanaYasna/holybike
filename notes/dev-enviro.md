# Ruby on Rails Developer Environment Setup
Instructions for setting up RoR environment on Apple M1 machine.

## 1. Install Xcode via App Store
- This will also install Git

## 2. Ensure your Terminal is not on Rosetta
- `uname -m` should return arm64 not x86_64

## 3. Install Homebrew
- This will also install Xcode Command Line Tools
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Add `/opt/homebrew/bin` to your path

## 4. Configure your global git params
- `git config --global user.name "Your Name"`
- `git config --global user.email "me@example.com"`
- `git config --global core.editor "mate"`
- `git config --global color.ui true`
- `git config -l --global`

## 5. Migrate SSH keys and verify Github access
- Copy keys to ~/.ssh
- `ssh-add .ssh/*`
- `eval "$(ssh-agent -s)"`
- `ssh-add -l -E sha256`
- `ssh -T git@github.com`

## 6. Install MySQL
- Download ARM64 *.dmg from https://dev.mysql.com/downloads/mysql/
- After install, choose "Use Legacy Password Encryption"
- Set password as rootroot
- Add `/usr/local/mysql/bin` to your path 
- Migrate databases and SequelPro favorites (use SequelAce)

## 7. Install asdf (Ruby version manager)
- `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1`
- Add two lines at the end of bash_profile:
  - `. $HOME/.asdf/asdf.sh`
  - `. $HOME/.asdf/completions/asdf.bash`
- `asdf --version` should return info
- Configure asdf to acept legacy files:
  - `echo "legacy_version_file = yes" >> ~/.asdfrc`

## 8. Install Ruby via asdf
- Install system dependencies:
  - `brew install openssl readline`
  - `brew install ruby-build`
  - `brew install shared-mime-info`
- Add plugin:
  - `asdf plugin add ruby`
  - `asdf list all ruby`
- Install Ruby:
  - `export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"` (only for Ruby > 2.4)
  - `export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"`
  - `asdf install ruby 2.6.3` (or whatever version you need)
  - `asdf global ruby 2.6.3` (creates ~/.tool-versions)
  - `asdf local ruby 2.6.3` (for file in repo)
- FYI: adsf install ruby = ruby-build = rbenv install

## 9. Install essential gems
- Disable gem docs:
  - `echo "gem: --no-document" >> ~/.gemrc`
- Confirm basics are installed:
  - `gem list`
  - `bundler -v`
- Install Rails and MySQL:
  - `gem install rails --version 6.0.0.rc1`
  - `gem install mysql2  -- --with-opt-dir="$(brew --prefix openssl@1.1)"`
