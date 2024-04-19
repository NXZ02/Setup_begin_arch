# text
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"
R="$(printf '\033[1;31m')"
#
yes=" --noconfirm"


head() {
clear
echo -e "" ${Y}
echo -e "##############################################################" | lolcat
echo -e "" ${C}
figlet SETUP.sh | lolcat 
#echo -e "" ${Y}
echo -e "##############################################################" | lolcat 
echo -e "" ${W}
}

#
arch_yay() {
    if ! which yay > /dev/null; then
	    clear
	    echo "[+] YAY SETUP" | lolcat
	    sleep 1
    sudo pacman -Syu $yes
    sudo pacman -S --needed base-devel git $yes
    git clone https://aur.archlinux.org/yay.git
    cd yay 
    makepkg -si $yes
fi
}

arch_lolcat(){
if ! which lolcat > /dev/null; then
	clear
	echo "[+] LOLCAT SETUP" | lolcat
	sleep 1
	sudo pacman -S $yes lolcat

fi
}


arch_figlet() {
    if ! which figlet > /dev/null; then
clear
echo "[+] FIGLET SETUP" | lolcat 
sleep 1
    sudo pacman -S figlet  $yes
    #sudo pacman -S lolcat $yes
fi
}
user() {
    
	echo "[+] INSTALLER BASIC SETUP " | lolcat
	echo
	echo "[+] FOR ARCH LINUX" | lolcat
	echo
	echo "[+] ENTER TO INSTALL..."  | lolcat
	echo
	
	read pass

}
step_1(){
    clear
    echo "[+] XDG FOLDER NOT SHOW " | lolcat
    sleep 1
    sudo pacman -S xdg-utils $yes
    sudo pacman -S archlinux-xdg-menu $yes
    sudo pacman -S xdg-user-dirs $yes
    xdg-user-dirs-update 
} 
step_2(){
    clear
    echo "[+] ANDROID TOOLS" | lolcat
    sleep 1
	
	sudo pacman -S android-tools $yes

    yay -S  simple-mtpfs  $yes
    sudo pacman -S mtpfs $yes
    git clone https://aur.archlinux.org/jmtpfs.git
    cd jmtpfs
    makepkg -si $yes
    sudo pacman -Sy gvfs-mtp $yes
    sudo pacman -Sy gvfs-gphoto2 $yes
} 
step_3() {
    clear
    echo "[+] IMG NOT SHOW " | lolcat
    sleep 1
	
	sudo pacman -S lightdm-gtk-greeter-settings $yes
    sudo pacman -S mpv $yes
    sudo pacman -S ffmpeg $yes 
    sudo pacman -S gthumb $yes 
    sudo pacman -S ffmpegthumbnailer ffmpeg $yes
    sudo pacman -S vlc $yes
    sudo pacman -S unzip unrar p7zip $yes
    sudo pacman -S noto-fonts-emoji noto-fonts  ttf-dejavu noto-fonts-cjk noto-fonts-extra $yes
}

deep(){
    step_1
    step_2
    step_3
    clear
    echo ${G} "done >> OK \n" | lolcat
}
# main
arch_lolcat
arch_figlet
arch_yay
head
user
deep
