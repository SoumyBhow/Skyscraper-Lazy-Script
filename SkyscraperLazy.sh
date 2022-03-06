SYSTEMS=$(whiptail --title "Lazy Skyline ROM Scraping Script" --checklist "Please select the systems you want to scrape" 20 78 15 \
    "atari2600" "Atari - 2600" OFF \
	"atarilynx" "Atari - Lynx" OFF \
	"doom" "DOOM" OFF \
	"dos" "DOS" OFF \
	"arcade" "Arcade Games" OFF \
	"pcengine" "NEC - PC Engine - TurboGrafx 16" OFF \
	"pcenginecd" "NEC - PC Engine CD - TurboGrafx-CD" OFF \
	"gb" "Nintendo - Game Boy" OFF \
	"gba" "Nintendo - Game Boy Advance" OFF \
	"gbc" "Nintendo - Game Boy Color" OFF \
	"gc" "Nintendo - GameCube" OFF \
	"3ds" "Nintendo - Nintendo 3DS" OFF \
	"n64" "Nintendo - Nintendo 64" OFF \
	"nds" "Nintendo - Nintendo DS" OFF \
	"nes" "Nintendo - Nintendo Entertainment System" OFF \
	"pokemini" "Nintendo - Pokemon Mini" OFF \
	"snes" "Nintendo - Super Nintendo Entertainment System" OFF \
	"wii" "Nintendo - Wii" OFF \
	"neogeo" "SNK - Neo Geo" OFF \
	"neogeocd" "SNK - Neo Geo CD" OFF \
	"ngp" "SNK - Neo Geo Pocket" OFF \
	"ngpc" "SNK - Neo Geo Pocket Color" OFF \
	"scummvm" "ScummVM" OFF \
	"sega32x" "Sega - 32X" OFF \
	"dreamcast" "Sega - Dreamcast" OFF \
	"gamegear" "Sega - Game Gear" OFF \
	"mastersystem" "Sega - Master System" OFF \
	"genesis" "Sega - Mega Drive - Genesis" OFF \
	"segacd" "Sega - Mega-CD - Sega CD" OFF \
	"saturn" "Sega - Saturn" OFF \
	"psx" "Sony - PlayStation" OFF \
	"ps2" "Sony - PlayStation 2" OFF \
	"psp" "Sony - PlayStation Portable" OFF \
	"3do" "The 3DO Company - 3DO" OFF \
 3>&1 1>&2 2>&3)

SOURCES=$(whiptail --title "Lazy Skyline ROM Scraping Script" --checklist "Please select the sources you want to fetch from" 3 78 15 \
    "screenscraper" "" OFF \
    "mobygames" "" OFF \
    "thegamesdb" "" OFF \
    "arcadedb" "" OFF \
    "openretro" "" OFF \
 3>&1 1>&2 2>&3)
 for SYSTEM in ${SYSTEMS[@]};
do
SYSTEM=$(echo $SYSTEM | sed 's/\"//g')
for SOURCE in ${SOURCES[@]};
do
SOURCE=$(echo $SOURCE| sed 's/\"//g')

Skyscraper -p $SYSTEM -s $SOURCE
done
Skyscraper -p $SYSTEM
done
