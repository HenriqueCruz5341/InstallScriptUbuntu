#!/bin/bash

sudo apt update && apt upgrade
#========================================================================================

# ===| Google Chrome |===
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
#========================================================================================

# ===| Discord |===
wget https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb
sudo dpkg -i discord-0.0.13.deb
#========================================================================================

# ===| Visual Studio Code |===
wget https://az764295.vo.msecnd.net/stable/ea3859d4ba2f3e577a159bc91e3074c5d85c0523/code_1.52.1-1608136922_amd64.deb
sudo dpkg -i code_1.52.1-1608136922_amd64.deb
#========================================================================================

# ===| Kolourpaint |===
sudo apt -y install kolourpaint
#========================================================================================

# ===| SCP |===
sudo apt install -y openssh-client openssh-server
#========================================================================================

# ===| GIMP |===
sudo apt -y install flatpak
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref 
#========================================================================================

# ===| Insomnia |===
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update
sudo apt-get install insomnia
#========================================================================================

# ===| Postman |===
wget https://dl.pstmn.io/download/latest/linux64
sudo tar -xvf linux64 -C /usr/bin
export PATH=$PATH:/usr/bin/Postman
sudo su 
echo -e "[Desktop Entry]\nName=Postman API Tool\nGenericName=Postman\nComment=Testing API\nExec=/usr/bin/Postman/Postman\nTerminal=false\nX-MultipleArgs=false\nType=Application\nIcon=/usr/bin/Postman/app/resources/app/assets/icon.png\nStartupWMClass=Postman\nStartupNotify=true" > /usr/share/applications/Postman.desktop
exit
#========================================================================================

# ===| Spotify |===
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client
#========================================================================================

# ===| MongoDB Compass |===
wget https://downloads.mongodb.com/compass/mongodb-compass_1.25.0_amd64.deb -O mongodb-compass.deb
sudo dpkg -i mongodb-compass.deb
sudo apt -y install --fix-broken
#========================================================================================

# ===| Git |===
sudo apt -y install git
git config --global user.name "HenriqueCruz"
git config --global user.email "henriquepaulinocruz@hotmail.com"
#========================================================================================

# ===| Java |===
sudo apt -y install default-jre
sudo apt -y install default-jdk
#========================================================================================

# ===| Docker |===
sudo apt -y install docker
sudo apt -y install docker.io
sudo apt -y install docker-compose
sudo usermod -aG docker $USER
#========================================================================================

# ===| asdf |===
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git -C ~/.asdf checkout "$(git -C ~/.asdf describe --abbrev=0 --tags)"
echo -e "\n. \$HOME/.asdf/asdf.sh" >> ~/.bashrc
echo -e ". \$HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
source ~/.bashrc
#========================================================================================

# ===| nodejs (from asdf) |===
asdf plugin-add nodejs
echo "Digite qual a versao LTS do NodeJS"
read version
asdf install nodejs $version
asdf global nodejs $version
#========================================================================================

# ===| npm |===
sudo apt -y install npm
#========================================================================================

# ===| OBS-Studio |===
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get -y install obs-studio
#========================================================================================

# ===| Filezilla |===
sudo add-apt-repository ppa:sicklylife/filezilla
sudo apt update
sudo apt -y install filezilla
#========================================================================================

# ===| Eclipse |===
# wget -c https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2020-12/R/eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
# sudo tar -zxvf eclipse.tar.gz -C /opt/
# sudo mv /opt/eclipse*/ /opt/eclipse
# sudo wget https://dl2.macupdate.com/images/icons128/11662.png -O /opt/eclipse/eclipse.png
# echo -e '[Desktop Entry]\n Version=1.0\n Name=eclipse\n Exec=/opt/eclipse/eclipse\n Icon=/opt/eclipse/eclipse.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/eclipse.desktop
#========================================================================================

# ===| Steam |===
wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo dpkg -i steam_latest.deb
sudo apt -y install --fix-broken
#========================================================================================

# ===| DBeaver |===
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce
#========================================================================================

# ===| VLC |===
sudo apt install vlc
#========================================================================================

# ===| Configurando o tema do sistema |===
sudo apt -y install gnome-tweak-tool

sudo apt install gnome-shell-extensions

wget https://codeload.github.com/dracula/gtk/zip/master
unzip master
rm -r master
mkdir -p ~/.icons && mkdir -p ~/.themes
mv gtk-master ~/.themes/Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme
sudo apt-get install papirus-folders
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
papirus-folders -C violet --theme Papirus-Dark

sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh -s Dracula --install-dircolors
rm -r gnome-terminal

wget https://wallpaperaccess.com/full/1267200.jpg
mv 1267200.jpg ~/Imagens/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri "file:///home/henrique/Imagens/wallpaper.jpg"
#========================================================================================

sudo apt autoremove -y
sudo apt autoclean -y
sudo reboot now