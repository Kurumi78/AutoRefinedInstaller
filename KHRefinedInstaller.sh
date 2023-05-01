#!/bin/bash
echo "Welcome to the Automated Kingdom Hearts Re:Fined Installer by Kurumi78"

echo "Please wait while your game install is located."

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


echo "Creating temporary working directories..."
mkdir ~/RefinedSetup

cd ~/RefinedSetup

echo "Downloading Kingdom Hearts Re:Fined 3.00 by TopazTK"
curl -LJO https://github.com/TopazTK/KH-ReFined/releases/download/v3.00/ReFined_v3.00.zip
unzip ReFined_v3.00.zip


mkdir "${khInstall}/backup"
while true; do

read -p "Which version of Re:Fined would you like to download? To select which game, please enter one game at a time (kh1/kh2/kh2da/bbs/bbsda). When you are finished, enter ''done'' without the quotation marks and hit enter. " GameSel

case $GameSel in
        [Kk][Hh]1 | [Kk][Hh][Ii] | [Kk][Hh] )
               mv "${khInstall}/KINGDOM HEARTS FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS FINAL MIX.exe"
               mv "Kingdom Hearts I/Kingdom Hearts I.exe" "${khInstall}/KINGDOM HEARTS FINAL MIX.exe"
               ;;
        [Kk][Hh]2 | [Kk][Hh][Ii][Ii] ) 
               mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
               mv "Kingdom Hearts II/Kingdom Hearts II.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" 
               ;;
        [Kk][Hh]2[Dd][Aa] | [Kk][Hh][Ii][Ii][Dd][Aa] )
               mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
               mv "Kingdom Hearts II/Kingdom Hearts II - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe"
               ;;
        [Bb][Bb][Ss] )
               mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               mv "Birth by Sleep/Birth by Sleep.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               ;;
        [Bb][Bb][Ss][Dd][Aa] )
               mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               mv "Birth by Sleep/Birth by Sleep - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
               ;;
	    [Dd][Oo][Nn][Ee] ) break;;
   
        * ) echo invalid response;;
esac

done

read -p "Would you like to install the Offline Patch? This will allow you to play the games offline and bypass the game launcher, but save data will be made with the EGS ID of ''1638'', which may make older save files not made with this ID incompatable! (y/n) " OCon


if [[ $OCon == "y" ]]; then
echo "Moving Game Launcher, WaitTitleProject.exe, and original EOSSDK-Win64-Shipping.dll to the backup folder..."
cd ${khInstall}
mv "${khInstall}/KINGDOM HEARTS HD 1.5+2.5 ReMIX.exe" "${khInstall}/backup/KINGDOM HEARTS HD 1.5+2.5 ReMIX.exe"
mv "${khInstall}/KINGDOM HEARTS HD 1.5+2.5 Launcher.exe" "${khInstall}/backup/KINGDOM HEARTS HD 1.5+2.5 Launcher.exe"
mv "${khInstall}/WaitTitleProject.exe" "${khInstall}/backup/WaitTitleProject.exe"
mv "${khInstall}/EOSSDK-Win64-Shipping.dll" "${khInstall}/backup/EOSSDK-Win64-Shipping.dll"

cd ~/RefinedSetup

echo "Downloading Offline Patch!"
curl -LJO https://cloud.audreyvps.net/s/Offlinepatch/download/OfflinePatch.zip
unzip OfflinePatch.zip

echo "Installing Offline Patch..."
mv "OfflinePatch/CODEX64.dll" "${khInstall}"
mv "OfflinePatch/EOSSDK-Win64-Shipping.dll" "${khInstall}"
mv "OfflinePatch/epic_emu.ini" "${khInstall}"

fi

echo "Deleting Temporary Working Directories"

rm -rf ~/RefinedSetup/


echo "Creating new Wineprefix"
echo "Installing dependencies to Wineprefix, this may take awhile."

while true; do

read -p "Will you be running Kingdom Hearts with Proton/Proton-GE, or Wine/Wine-GE? (proton/wine) " ProCon

#echo "$prefixlocation" 
 
case $ProCon in
        [Pp][Rr][Oo][Tt][Oo][Nn] ) WINEPREFIX=~/RefinedPrefix/pfx winetricks -q -f dotnet48 vcrun2022 win10
	       break;;
        [Ww][Ii][Nn][Ee] ) WINEPREFIX=~/RefinedPrefix winetricks -q -f dotnet48 vcrun2022 win10
      	       break;;
        * ) echo invalid response;;
esac

done
echo "Renaming EPIC to EPIC.bak to prevent FMV videos from crashing the game..."
mv "${khInstall}/EPIC" "${khInstall}/EPIC.bak"

echo "Thanks for using my Re:Fined Installer. If you run into issues, contact Kurumi Tokisaki#0001 on Discord."

