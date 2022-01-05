#!/bin/bash

#make sure to have iTerm installed before going ahead

#install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
#install xcode commandline-tools
xcode-select --install

#install agnoster theme for iTerm
# Guide here -> https://medium.com/featurepreneur/how-to-apply-agnoster-theme-in-mac-zshrc-876f3baf8bf
# Have a backup of your zshrc file
cd ~
cp ~/.zshrc ~/.zshrc.orig
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install the necessary fonts
git clone https://github.com/powerline/fonts
cd fonts && ./install.sh
#Edit the iTerm Preferences and select the new font
echo "Open iTerm Preferences -> Profiles -> Text -> tik USE A DIFFERENT FONT FOR NON-ASCII TEXT"
echo "Select GO MONO FOR POWERLINE"
read -p "Have you done it? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
echo "replacing robbyrussell theme with agnoster.."
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
#hide the username in terminal
echo "# hide the username" >> ~/.zshrc
echo "DEFAULT_USER prompt_context(){}" >> ~/.zshrc


#install rbenv
brew install rbenv
rbenv install 3.0.3
rbenv global 3.0.3
echo "export PATH=/usr/local/bin:\$PATH
export RBENV_ROOT=\$HOME/.rbenv
export PATH=\$RBENV_ROOT/shims:/versions:\$PATH" > ~/.zshrc


#install pyenv
brew install pyenv
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
#install python dependencies
brew install openssl readline sqlite3 xz zlib
pyenv install 3.3.0

#install terraform-switch
brew install warrensbox/tap/tfswitch
tfswitch 0.15.5
#install terragrunt
brew install terragrunt

#install nodejs through nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 12
node -v
echo "open a new shell to use nvm"
