sudo apt-get update

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo "Enter git username: "
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in git ?"
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set Nano as your default GIT editor for you? (y/n)"
read git_core_editor_to_nano
if echo "$git_core_editor_to_nano" | grep -iq "^y" ;then
	git config --global core.editor nano
else
	echo "Okay"
fi

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

echo "Generating a SSH Key abd copying it to clipboard"
ssh-keygen -t ed25519 -C $git_config_user_email
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing code'
sudo snap install --classic code

echo 'installing extensions'

code --install-extension vsciot-vscode.vscode-arduino
code --install-extension octref.vetur
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.cpptools
code --install-extension Equinusocio.vsc-material-theme

echo 'installing spotify' 
snap install spotify

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)"

source ~/.zshrc
nvm --version
nvm install 14
nvm alias default 14
node --version
npm --version

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing theme'
sudo apt install fonts-firacode -y
wget -O ~/.oh-my-zsh/themes/node.zsh-theme https://raw.githubusercontent.com/skuridin/oh-my-zsh-node-theme/master/node.zsh-theme 
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="node"/g' ~/.zshrc

echo 'installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y

echo 'installing discord'
sudo snap install discord -y

echo 'installing terminator'
sudo apt-get update
sudo apt-get install terminator -y

echo 'installing kicad nightly build'
sudo add-apt-repository --yes ppa:kicad/kicad-dev-nightly
sudo apt update
sudo apt install kicad-nightly -y
sudo apt install kicad-nightly-footprints kicad-nightly-libraries kicad-nightly-packages3d kicad-nightly-symbols kicad-nightly-templates -y
