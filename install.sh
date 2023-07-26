sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

echo "Grabbing packages via yay"
yay -S \
alacritty-git \
asusctl-git \
brave-nightly-bin \
brightnessctl  \
docker \
docker-compose \
dunst \
eww-wayland \
ffmpeg \
gnome-keyring \
google-chrome-dev \
grimblast-git \
hyprland-git \
jq \
kitty \
neovim-git \
nordic-theme \
nwg-look-bin \
pamac-all \
playerctl \
protonvpn-gui \
starship \
supergfxctl-git \
swaylock-effects-git \
swww-git \
tableplus \
ttf-iosevka-nerd \
ttf-jetbrains-mono-nerd \
visual-studio-code-insiders-bin \
wl-clipboard \
wlogout \
wofi \
xdg-desktop-portal-hyprland-git \
zsh \
zsh-autosuggestions \
zsh-syntax-highlighting-git \
--noconfirm


echo "Switching from bash to zsh"
chsh -s /usr/bin/zsh

echo "Moving dot files"
echo "Making Project folder"
mkdir ~/Projects

echo "Moving config"
cp -r . ~/

echo "Setting background photo"
cp nightstudyroom.jpg ~/Pictures/

echo "Set default terminal to alacritty"
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

#echo "Setting grub theme"
#git clone https://github.com/vinceliuice/grub2-themes.git --depth 0
#sudo sh grub2-themes/install.sh -b -t vimix
#rm -rf grub2-themes

echo "Remove extras"
rm ~/.install.sh
rm README.md

echo "Done script"

exit
