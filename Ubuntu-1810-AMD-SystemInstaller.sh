# Script by Tyler Gale
# Last updated November 18th 2018
# For Ubuntu 18.10
####################################################
# This will ask the user to provide their sudo credentials if they do not run the script as sudo
sudo true
####################################################
# Make sure existing updates are installed
sudo apt update
sudo apt dist-upgrade -y
####################################################
# Let's get some PPAs we want
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo dpkg --add-architecture i386
wget -nc https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Ubuntu_18.10_standard/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Ubuntu_18.10_standard ./'
ver=$(lsb_release -sr); if [ $ver != "18.10" -a $ver != "18.04" -a $ver != "16.04" ]; then ver=18.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q https://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -
sudo add-apt-repository ppa:paulo-miguel-dias/mesa -y
####################################################
# OK Lets install the packages we are looking for
sudo apt update && sudo apt install ukuu lutris gnome-tweak-tool mesa-vulkan-drivers mesa-vulkan-drivers:i386 libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386 winbind chromium-browser chrome-gnome-shell steam gimp -y
sudo apt install --install-recommends winehq-staging -y
sudo apt dist-upgrade -y
# Lets update some configurations for Esync wine builds
sudo echo "DefaultLimitNOFILE=1048576" >> /etc/systemd/system.conf
sudo echo "DefaultLimitNOFILE=1048576" >> /etc/systemd/user.conf
echo "You need to restart your machine now, because we are all done here"

