# ES2 Launch Arguments

At the bottom of this document is a list of launch arguments relevant to modding.

## How to use launch arguments

### Steam
In your Steam library, right click the game and hit "Properties". A window will pop up, at the bottom of the window will be a text box labelled "Launch Options". Input any of the following commands inside of this text box (separated by a space if you are using multiple.</br></br>


### GOG
In your GOG library, right click the game, hover over "Manage Installation", then hit "Configure". Go to the "Features" tab, then check off "Custom executables / arguments". A few new options will appear, but under one of them the "Default executable" radio button will be selected, on that one, hit Duplicate. Then, in the new custom executable path, put your launch arguments in the "Arguments" text box (separated by a space if you are using multiple). Make sure it has the "Default executable" radio button selected or it will not work.

# List of launch arguments

| Command              | Description                                                                |
|----------------------|----------------------------------------------------------------------------|
| --enablemoddingtools | Launches game with the modding debug tools                                 |
| --enableimagedebug   | Launches game with image debugging tools                                   |
| --use-xml-save       | Saves game in an xml .zip, allows for save editing. Note large save sizes. |
| --disable-ai         | When a match is started, ALL AI factions will be set to inactive           |
| --disablediagnostics | Completely disables the output of diagnostic files      
| --logquests          | Enables verbose quest logging
| --logpopulation      | Enables verbose population logging
| --logdiplomacy       | Enables verbose diplomacy logging
| --logentityactions   | Enables verbose entity action logging
| --logherorecruitment | Enables verbose hero recruitment logging|
| -novideo             | Disables playback of video cutscenes                                       |
| -nologo              | Disables amplitude/sega logo when game launches  