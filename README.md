# AutoRefinedInstaller

This is a script to automatically install TopazTK's Re:Fined mod to a game of Kingdom hearts 1, Kingdom Hearts 2, and Kingdom hearts BBS. (This does not install the Refined mod for Dream Drop at this time.)

This also automatically installs the Offline Patch for the game. 

### Intructions
 
 1.Download the Script
 
 2.Run the script.
 
 3.Confirm if it found your game's install location (It should)
 
 4.Type the directory you would like the wineprefix to install to. EXAMPLE: ~/KHPrefix (Please do not add a slash at the end)
 
 5.Confirm if you are using Proton or Proton GE to run Kingdom hearts (they have different prefix structures, cant have it do both)
 
 6.Launch the game.
 
 
 
 
### Dependencies:
  
  1.Winetricks
  
  2.Curl
  
  
  
### Notes:

  The script isnt very robust. if you feed it an invalid directory it will just error out. A wineprefix will be auto-generated if one des not exist at the current location. 
  
