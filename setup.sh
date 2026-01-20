#!/bin/bash

echo _____________________________________
echo Starting V2...
echo ..
echo ..
echo ..

echo Updating Linux to the latest version
sudo dnf update -y #Red Hat based
sudo apt update && sudo apt upgrade -y #Debian based

echo Installing apps and tools #ONE OF THESE DOESN"T WORK
sudo dnf install dmenu xbacklight feh conky polybar rofi solaar xrandr curl wget arandr dunst btop brightnessctl vim sway waybar wdisplays grim slurp -y
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
cp -f ~/Linux-Setup/Files/.bashrc ~/
cp -f ~/Linux-Setup/Files/.bash_aliases ~/
source ~/.bashrc
#use \cp -f .... if it doesn't work

echo Setting up wallpaper
mkdir ~/Pictures
mkdir -p ~/Pictures/Wallpapers
cp ~/Linux-Setup/Images/Wallpaper.png ~/Pictures/Wallpapers/

echo Setting up rofi
mkdir -p ~/.config/rofi
cp ~/Linux-Setup/Files/config.rasi ~/.config/rofi/

echo Setting up polybar
mkdir -p ~/.config/polybar
cp ~/Linux-Setup/Files/launch.sh ~/.config/polybar/
cp ~/Linux-Setup/Files/config.ini ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

echo Setting up scripts
mkdir ~/.scripts
cd ~/.scripts
echo "xdg-open https://www.youtube.com/watch?v=fMMEM-aGihA" > nerd-radar.sh
echo "xdg-open https://www.youtube.com/watch?v=dQw4w9WgXcQ" > rick-roll.sh
echo '#!/bin/bash' >> startup.sh
echo feh --bg-fill ~/Pictures/Wallpapers/Wallpaper.png >> startup.sh
echo bash ~/.config/polybar/launch.sh >> startup.sh
echo i3-msg restart >> startup.sh
chmod +x nerd-radar.sh rick-roll.sh startup.sh
cd ~

echo Setting up Sway
mkdir -p ~/.config/sway ~/.config/waybar
cp ~/Linux-Setup/Files/Sway/config ~/.config/sway/
cp ~/Linux-Setup/Files/Sway/config.jsonc ~/.config/waybar/
cp ~/Linux-Setup/Files/Sway/style.css ~/.config/waybar/

echo ---- Setting Up Obsidian Directories - Personal Setup ----
cd ~
mkdir -p Documents/Obsidian
cd Documents/Obsidian
mkdir General-Vault Improvement-Vault School-Vault Technical-Vault Bible-Vault Trash-Bin
cd ~

echo ---- Setting Up Other Directories ----
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
echo Rebooting in 15 seconds. 
echo After reboot, click the settings icon in the bottom right corner, then click i3/sway. 
sleep 15
echo ___________________________________________________________________________

echo Rebooting Now...
sleep 2
reboot
