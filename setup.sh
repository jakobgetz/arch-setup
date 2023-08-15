# Setting up an arch linux installation
# 
# Originally based of https://freecodecamp.org/news/how-to-install-arch-linux/#how-to-manage-packages-using-packman

echo "INFO: Create my user..."
adduser useradd -m -G wheel jakob
rm /etc/sudoers
mv sudoers /etc/sudoers
echo "INFO: Dont forget to set a password"

echo "INFO: Configure network"
rm /etc/host
mv host /etc/host
rm /etc/hosts
mv hosts /etc/hosts

echo "INFO: Configure boot loader"
pacman -S grup efibootmgr
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg

echo "INFO: Configure window manger"
echo "INFO: Using 2880x1800"
pacman -S xorg xorg-xinit
pacman -S qtile
pacman -S alacritty
mv xinitrc .xinitrc
mv qtile.config.py /home/jakob/.config/qtile/config.py
mkdir /home/jakob/.config/alacritty
mv alacritty.yml /home/jakob/.config/alacritty/alacritty.yml

echo "INFO: Configure keyboard"
echo "INFO: Using Mac de layout"
setxkbmap -model macintosh -layout de
