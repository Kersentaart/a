#!/bin/env bash
set -e

echo "Welcome!" && sleep 2

# Does full system update
echo "Doing a system update..."
sudo pacman --noconfirm -Syu

echo "###########################################################################"
echo "Will do stuff, get ready"
echo "###########################################################################"

# Install base-devel if not installed
sudo pacman -S --noconfirm --needed base-devel git

# Choose video driver
echo "1) xf86-video-intel 	2) xf86-video-amdgpu 3) nvidia 4) Skip"
read -r -p "Choose you video card driver(default 1)(will not re-install): " vid

case $vid in
[1])
	DRI='xf86-video-intel'
	;;

[2])
	DRI='xf86-video-amdgpu'
	;;

[3])
    DRI='nvidia nvidia-settings nvidia-utils'
    ;;

[4])
	DRI=""
	;;
[*])
	DRI='xf86-video-intel'
	;;
esac

# Install stuff
echo "Install packages!"
sudo pacman -S --noconfirm --needed rofi feh bspwm sxhkd vlc dunst bashtop glava flameshot firefox neovim thunar gimp
echo "Done!"

# AUR helper
echo "We need an AUR helper. It is essential. 1) aura 2) yay 3) paru"
read -r -p "What is the AUR helper of your choice? (Default is aura): " num

case $num in
[1])
	HELPER='aura'
	;;

[2])
	DRI='yay'
  ;;

[3])
  DRI='paru'
  ;;

[*])
	DRI='aura'
  ;;
esac

# install fonts
#echo "Installing fonts"
#sudo cp -r ./fonts/* /usr/share/fonts/
#fc-cache -f
#clear
#echo "Done!"


#if ! command -v $HELPER &> /dev/null
#  then
#    echo "It seems that you don't have $HELPER installed, I'll install that for you before continuing."
#    git clone https://aur.archlinux.org/$HELPER.git ~/.srcs/$HELPER
#    (cd ~/.srcs/$HELPER/ && makepkg -si )
#fi

#if [ $num -eq 1 ]
#  then
#    echo "Installing picom-ibhagwan-git..."
#    $HELPER -A picom-ibhagwan-git polybar
#  else
#    echo "Installing picom-ibhagwan-git..."
#    $HELPER -S picom-ibhagwan-git polybar
#fi
#
#mkdir -p ~/.config/
#echo "1)1366 x 768       2)1920 x 1080"
#read -r -p "Choose your screen resolution: " res
#case $res in
#  [1])
#    EWW_DIR='config/eww-1366'
#    ;;
#  [2])
#    EWW_DIR='config/eww-1920'
#    ;;
#  [*])
#    EWW_DIR='config/eww-1920'
#    ;;
#esac

for d in */ ; do
  if [ -d ~/.config/$d ]; then
    echo "$d configs detected, backing up..."
    cp ~/.config/$d ~/.config/$d.old;
    cp ./config/$d ~/.config/$d;
  else
    echo "Installing $d configs..."
    cp ./config/$d ~/.config/$d;
  fi
done

#if [ -d ./config/eww ]; then
#  if [ -d ~/.config/eww ]; then
#    echo "Eww configs detected, backing up..."
#    mkdir ~/.config/eww.old && mv ~/.config/eww/* ~/.config/eww.old/
#    cp -r ./$EWW_DIR/* ~/.config/eww;
#  else
#    echo "Installing eww configs..."
#    mkdir ~/.config/eww && cp -r ./$EWW_DIR/* ~/.config/eww;
#  fi
#fi
if [ -d ./wallpapers ]; then
  if [ -d ~/wallpapers ]; then
    echo "Adding wallpaper to ~/wallpapers..."
    cp ./wallpapers ~/wallpapers/;
  else
    echo "Adding wallpaper to ~/wallpapers..."
    mkdir ~/wallpapers && cp -r ./wallpapers/* ~/wallpapers/;
  fi
fi
if [ -f ~/.zshrc ]; then
  echo "~.zshrc detected, backing up..."
  mv ~/.zshrc ~/.zshrc.old
  cp ./.zshrc ~/.zshrc
  source ~/.zshrc
fi

echo "ALL DONE! Reboot for all changes to take place!"
echo "If the bar doesn't work, use tint2conf and set stuff up, if you're hopelessly lost, open an issue."
read -r -p "Reboot? y/n" reboot
if [ reboot = "y" ];
  then
    reboot
  else
    exit 1
fi
