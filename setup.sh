#!/bin/bash

echo _____________________________________
echo Starting V2...
echo ..
echo ..
echo ..

echo Updating Linux to the latest version
# sudo dnf update -y #Red Hat based
sudo apt update && sudo apt upgrade -y #Debian based

echo Installing apps and tools #ONE OF THESE DOESN"T WORK
# sudo dnf install dmenu xbacklight feh conky polybar rofi solaar xrandr curl wget arandr dunst btop brightnessctl vim sway waybar wdisplays grim slurp -y
sudo apt install dmenu xbacklight feh conky polybar rofi solaar xrandr curl wget arandr dunst btop brightnessctl vim sway waybar wdisplays grim slurp -y

echo Enabling Minimize Buttom - GNOME
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

echo Downloading and setting up custom font
cd ~/Downloads
wget https://github.com/IdreesInc/Monocraft/releases/download/v4.0/Monocraft-nerd-fonts-patched.ttc
sleep 10
mkdir -p ~/.local/share/fonts
mv ~/Downloads/Monocraft-nerd-fonts-patched.ttc ~/.local/share/fonts 
fc-cache -fv

echo Setting up aliases  
### cp -f ~/Linux-Setup/Files/.bashrc ~/
echo "[WARNING] YOU NEED BASH RC FILE!"


cp -f ~/Linux-Setup/Files/.bash_aliases ~/
source ~/.bashrc
#use \cp -f .... if it doesn't work

echo Copying wallpapers
mkdir ~/Pictures
mkdir -p ~/Pictures/Wallpapers
cp ~/Linux-Setup/Images/Wallpaper.png ~/Pictures/Wallpapers/

echo Setting up Sway
mkdir -p ~/.config/sway ~/.config/waybar
cp ~/Linux-Setup/Files/Sway/config ~/.config/sway/

echo Setting up Waybar
cp ~/Linux-Setup/Files/Sway/config.jsonc ~/.config/waybar/
cp ~/Linux-Setup/Files/Sway/style.css ~/.config/waybar/

echo Setting up rofi
mkdir -p ~/.config/rofi
cp ~/Linux-Setup/Files/config.rasi ~/.config/rofi/



echo Add Personal Directories
mkdir -p ~/Documents/Obsidian
cd Pictures
mkdir Wallpapers Icons Folder-Icons Screenshots
mkdir ~/Downloads/Trash
cd ~/Documents
mkdir Trash Important

echo
echo # clear screen
echo ___________________________________________________________________________
echo Finished! 
echo . . . . . . . . . . . . . . . . . . . . . . . . . .
clear
echo Rebooting in seconds: 
for ((i = 10; i > 0; i--));
do
    echo $i
    sleep 1
done

echo ___________________________________________________________________________
sleep 2
echo Rebooting Now...
sleep 2
reboot
