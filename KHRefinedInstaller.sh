!/bin/bash
echo "Welcome to the Automated KHRefined installer by Kurumi78"

echo "Please wait while your game install is located"

khInstall=$(find / -type d -name "KH_1.5_2.5" -print -quit 2>/dev/null)

#read -p "Is ${khInstall} your games install location? (Y/n)" yn


while true; do

read -p "Is ${khInstall} your games install location? (y/n) " LocCon

case $LocCon in 
	[yY] ) break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done


echo "Creating temporary working directories"
mkdir ~/RefinedSetup

cd ~/RefinedSetup

echo "Downloading KHRefined 3.00"
curl -LJO https://github.com/TopazTK/KH-ReFined/releases/download/v3.00/ReFined_v3.00.zip
unzip ReFined_v3.00.zip

while true; do

read -p "What game would you like to install Refined for? Type done when you've finished installing all of the options that you want (kh1/kh2/bbs) " GameSel

case $GameSel in
        kh1 | Kh1 | KH1 | KH )
               mv "${khInstall}/KINGDOM HEARTS FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS FINAL MIX.exe"
               mv "Kingdom Hearts I/Kingdom Hearts I.exe" "${khInstall}/KINGDOM HEARTS FINAL MIX.exe"
               ;;
        kh2 | Kh2 | KH2 ) 
               mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
               mv "Kingdom Hearts II/Kingdom Hearts II.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" 
               ;;
        bbs | Bbs | BBs | BBS | BbS )
               mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               mv "Birth by Sleep/Birth by Sleep.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               ;;
	done | Done ) break;;
   
        * ) echo invalid response;;
esac

done

echo "Downloading Offline Patch"
curl -LJO https://cloud.audreyvps.net/s/Offlinepatch/download/OfflinePatch.zip
unzip OfflinePatch.zip

echo "Installing Offline Patch"
mv "OfflinePatch/CODEX64.dll" "${khInstall}"
mv "OfflinePatch/EOSSDK-Win64-Shipping.dll" "${khInstall}"
mv "OfflinePatch/epic_emu.ini" "${khInstall}"

echo "Deleting Temporary Working Directories"

rm -rf ~/RefinedSetup/

read -p "Where would you like to install your wineprefix? Please give an Absolute path (No relative paths like '~')" prefixlocation

echo "Creating new Wineprefix at ~/KHPrefix"
echo "Installing dependencies to wineprefix, this may take awhile."

while true; do

read -p "Are you running Kingdom hearts with proton or Proton GE? (y/n) " ProCon

case $ProCon in
        [yY] ) WINEPREFIX=${prefixlocation}/pfx winetricks -q dotnet48 vcrun2022; 
	       break;;
        [nN] ) WINEPREFIX=${prefixlocation} winetricks -q dotnet48 vcrun2022;
      	       break;;
        * ) echo invalid response;;
esac

done


echo "Thanks for using my Refined Installer. If you run into issues contact Kurumi Tokisaki#0001 on discord."
