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
echo "Moving WaitTitleProject.exe to the backup folder..."
mv "${khInstall}/WaitTitleProject.exe" "${khInstall}/backup/WaitTitleProject.exe"



cd ~/RefinedSetup


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

