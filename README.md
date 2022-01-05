# Bash Scripts and more

## _Description_
This repository wants to collect some scripts that can help automate some boring work and automate the installation of tools

## _DevOps-Init script_
This is a bash script that install the following tools that are highly needed by devops using MacOS, including:

- Homebrew
- Xcode-tools command line for MacOS
- Agnoster theme for iTerm terminal
- Rbenv -> Ruby
- Pyenv -> Python
- NVM   -> NodeJS  
- Terraform-switch to install multiple versions of Terraform
- Terragrunt -> Wrapper for Terraform


N.B. this has been tested in MacOS Monterey and BigSur

## 💻 _Installation_

Runs the bash script and install the predefined tools
```sh
git clone git@github.com:marcomoscatiello/bash_scripts.git && cd "$(basename "$_" .git)"
chmod +x devops-init.sh
./devops-init.sh
```
