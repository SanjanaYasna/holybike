## Windows Ruby on Rails Developer Environment Setup

**1. Begin by reading the external guides**

- Open the install Ruby on Rails on Windows guide:\
  [https://gorails.com/setup/windows/10](https://gorails.com/setup/windows/10)
- Note that we will use asdf instead of rbenv
- Open the Install asdf (ruby, nodejs, and yarn) in WSL2 guide:\
  [https://dev.to/michellelwt/install-asdf-ruby-nodejs-and-yarn-in-wsl2-207o](https://dev.to/michellelwt/install-asdf-ruby-nodejs-and-yarn-in-wsl2-207o)
- Note that you do not need to install NodeJS or Yarn
- Recognize that no guide is perfect, and be prepared to consult multiple secondary sources

**2. Install the Windows Subsystem for Linux (WSL)**

- First understand that you are installing a new shell for the Linux (Ubuntu) operating system on your computer
- From your Windows PowerShell, prepare your computer with:\
  `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`\
  `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
- Visit the Windows store to install Ubuntu: [https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6)
- Open Ubuntu from the Start menu OR by typing `wsl` in your PowerShell
- Set up a new root user for Ubuntu and be sure to note the password you create (this will be your `sudo` password in the WSL)
- Note that all subsequent steps in this guide should be performed from within the WSL (not your Windows PowerShell)

**3. Install MySQL 8 (Database)**

- Use apt (the Advanced Packaging Tool) to install MySQL: `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`
- Then use `sudo mysql` to enter the MySQL console without a password
- Type `alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` to set a password
- Choose a password that uses only alphanumeric characters (no special symbols!)  
- Then apply it with `flush privileges;` followed by `exit;`
- Try logging in with `mysql -u root -p` to confirm the password for the root user

**4. Configure git (Version Control)**

- `git config --global user.name "Your Name"`
- `git config --global user.email "me@example.com"`
- `git config --global color.ui true`
- `git config -l --global`
- Setup or migrate your SSH keys for GitHub access by following the instructions:\
  [https://docs.github.com/en/authentication/connecting-to-github-with-ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- Type `ssh -T git@github.com` to be sure they are configured correctly

**5. Install asdf (Programming Language Version Manager)**

- Begin by installing system dependencies via apt (the Advanced Packaging Tool):\
  `sudo apt-get update`\
  `sudo apt install autoconf bison build-essential curl git libcurl4-openssl-dev libffi-dev libgdbm-dev libncurses-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev software-properties-common sqlite3 zlib1g-dev`
- Then consult the software's guide: [https://asdf-vm.com/guide/getting-started.html](https://asdf-vm.com/guide/getting-started.html)
- Follow the instructions to install via git. From your command line type:\
  `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2`
- Make sure that `asdf` has been added to your `PATH` by adding two lines to the end of your profile file (usually named `.bashrc`):\
   `. $HOME/.asdf/asdf.sh`\
   `. $HOME/.asdf/completions/asdf.bash`
- Close your shell and reopen it for the changes to take effect   
- Type `asdf --version` to check if it has been properly installed

**6. Install Ruby via asdf**

- Add the Ruby plugin to asdf: `asdf plugin add ruby`
- Install Ruby 3.1.2 with: `asdf install ruby 3.1.2`
- Set this version of Ruby as your default with: `asdf global ruby 3.1.2`
- Type `ruby -v` to check if it has been properly installed
- Note that: `adsf install ruby` = `ruby-build` = `rbenv install`

**9. Install Essential Ruby Gems (Libraries)**

- Disable downloading bloated documentation files: `echo "gem: --no-document" >> ~/.gemrc`
- Install Rails 7.0.3.1: `gem install rails --version 7.0.3.1`
- Install mysql2: `gem install mysql2`
- Ensure you are on the latest version of bundler: `gem update bundler`
