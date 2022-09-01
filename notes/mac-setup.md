## Mac Ruby on Rails Developer Environment Setup

**1. Begin by reading the external guide**

- Open the Install Ruby on Rails 7 on Mac guide:\
  [https://mac.install.guide/rubyonrails/index.html](https://mac.install.guide/rubyonrails/index.html)
- Note that you do not need to upgrade your operating system as this guide instructs, but you should make sure you have the Xcode Command Line Tools installed (see upcoming section)
- Also note that you do not need to install Node or Yarn, nor do you need to create a new Rails application
- Recognize that no guide is perfect, and be prepared to consult multiple secondary sources

**2. Determine Your Shell**

- Newer Macs default to the ZSH shell over bash
- Check the bar on top of your terminal to determine which you are on
- You can use ZSH if you choose, but this guide assumes you are on bash
- To switch over...
- Type `chsh -s /bin/bash`
- To silence the repeated warnings that you should switch back...
- Add `export BASH_SILENCE_DEPRECATION_WARNING=1` to the `.bash_profile` in your home `~` directory

**3. Install Xcode**

- Visit the App Store on your Mac
- Search for Xcode and install it
- Note that this will also install git

**4. Install MySQL 8 (Database)**

- Download: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql)
- Be sure to select the version that corresponds to your operating system (Intel Mac = x86, M1 Mac = ARM)
- Follow the installation procedure
- Choose "Use Legacy Password Encryption" when prompted
- Set the root database password using only alphanumeric characters (no special symbols!)
- Make note of it since you will need it later
- Ensure that `/usr/local/mysql/bin` has been added to your `PATH` 

**5. Install Homebrew (Package Manger)**

- First consult the software's guide: [https://brew.sh](https://brew.sh)
- Note that installing Homebrew will also install the Xcode Command Line Tools
- From your command line type:\
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Type `echo $PATH` to ensure that `/opt/homebrew/bin` is present
- Type `brew doctor` to check if it has been properly installed

**6. Configure git (Version Control)**

- `git config --global user.name "Your Name"`
- `git config --global user.email "me@example.com"`
- `git config --global color.ui true`
- `git config -l --global`
- Setup or migrate your SSH keys for GitHub access by following the instructions:\
  [https://docs.github.com/en/authentication/connecting-to-github-with-ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- Type `ssh -T git@github.com` to be sure they are configured correctly

**7. Install asdf (Programming Language Version Manager)**

- First consult the software's guide: [https://asdf-vm.com/guide/getting-started.html](https://asdf-vm.com/guide/getting-started.html)
- Follow the instructions to install via git. From your command line type:\
  `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2`
- Make sure that `asdf` has been added to your `PATH` by adding two lines to the end of your profile file (usually named `.bash_profile`):\
   `. $HOME/.asdf/asdf.sh`\
   `. $HOME/.asdf/completions/asdf.bash`
- Close your terminal and reopen it for the changes to take effect   
- Type `asdf --version` to check if it has been properly installed

**8. Install Ruby via asdf**

- Begin by installing system dependencies via Homebrew:\
  `brew install openssl readline`\
  `brew install ruby-build`\
  `brew install shared-mime-info`
- Add the Ruby plugin to asdf: `asdf plugin add ruby`
- Configure environment variables to prepare for installation:\
  `export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"`\
  `export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"`
- Install Ruby 3.1.2 with: `asdf install ruby 3.1.2`
- Set this version of Ruby as your default with: `asdf global ruby 3.1.2`
- Type `ruby -v` to check if it has been properly installed
- Note that: `adsf install ruby` = `ruby-build` = `rbenv install`

**9. Install Essential Ruby Gems (Libraries)**

- Disable downloading bloated documentation files: `echo "gem: --no-document" >> ~/.gemrc`
- Install Rails 7.0.3.1: `gem install rails --version 7.0.3.1`
- Install mysql2: `gem install mysql2  -- --with-opt-dir="$(brew --prefix openssl@1.1)"`
- Ensure you are on the latest version of bundler: `gem update bundler`
