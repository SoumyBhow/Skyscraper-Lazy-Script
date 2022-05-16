SYSTEMS=$(whiptail --title "Lazy Skyline ROM Scraping Script" --checklist "Please select the systems you want to scrape" 20 78 15 \
	"3do" "The 3DO Company - 3DO" OFF \
	"3ds" "Nintendo - Nintendo 3DS" OFF \
	"arcade" "Arcade Games" OFF \
	"atari2600" "Atari - 2600" OFF \
	"atarilynx" "Atari - Lynx" OFF \
	"doom" "DOOM" OFF \
	"dos" "DOS" OFF \
	"dreamcast" "Sega - Dreamcast" OFF \
	"gamegear" "Sega - Game Gear" OFF \
	"gba" "Nintendo - Game Boy Advance" OFF \
	"gbc" "Nintendo - Game Boy Color" OFF \
	"gb" "Nintendo - Game Boy" OFF \
	"gc" "Nintendo - GameCube" OFF \
	"genesis" "Sega - Mega Drive - Genesis" OFF \
	"mastersystem" "Sega - Master System" OFF \
	"n64" "Nintendo - Nintendo 64" OFF \
	"nds" "Nintendo - Nintendo DS" OFF \
	"neogeocd" "SNK - Neo Geo CD" OFF \
	"neogeo" "SNK - Neo Geo" OFF \
	"nes" "Nintendo - Nintendo Entertainment System" OFF \
	"ngpc" "SNK - Neo Geo Pocket Color" OFF \
	"ngp" "SNK - Neo Geo Pocket" OFF \
	"pcenginecd" "NEC - PC Engine CD - TurboGrafx-CD" OFF \
	"pcengine" "NEC - PC Engine - TurboGrafx 16" OFF \
	"pokemini" "Nintendo - Pokemon Mini" OFF \
	"ps2" "Sony - PlayStation 2" OFF \
	"psp" "Sony - PlayStation Portable" OFF \
	"psx" "Sony - PlayStation" OFF \
	"saturn" "Sega - Saturn" OFF \
	"scummvm" "ScummVM" OFF \
	"sega32x" "Sega - 32X" OFF \
	"segacd" "Sega - Mega-CD - Sega CD" OFF \
	"snes" "Nintendo - Super Nintendo Entertainment System" OFF \
	"switch" "Nintendo - Nintendo Switch" OFF \
	"wii" "Nintendo - Wii" OFF \
 3>&1 1>&2 2>&3)

SOURCES=$(whiptail --title "Lazy Skyline ROM Scraping Script" --checklist "Please select the sources you want to fetch from" 3 78 15 \
    "screenscraper" "" OFF \
    "mobygames" "" OFF \
    "thegamesdb" "" OFF \
    "arcadedb" "" OFF \
    "openretro" "" OFF \
 3>&1 1>&2 2>&3)


REFRESH=$(whiptail --title "Lazy Skyline ROM Scraping Script" --yesno "Would you like to refetch all data from online?" 8 78 3>&1 1>&2 2>&3)


for SYSTEM in ${SYSTEMS[@]}; do
	SYSTEM=$(echo $SYSTEM | sed 's/\"//g')
for SOURCE in ${SOURCES[@]}; do
	SOURCE=$(echo $SOURCE| sed 's/\"//g')


	if $REFRESH; then
		Skyscraper -p $SYSTEM -s $SOURCE --refresh
	else
		Skyscraper -p $SYSTEM -s $SOURCE
	fi
	done
Skyscraper -p $SYSTEM
done
