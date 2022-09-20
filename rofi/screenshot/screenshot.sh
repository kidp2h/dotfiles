#!/usr/bin/env bash

dir="$HOME/.config/bspwm/rofi"
rofi_command="rofi -theme $dir/screenshot/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"
case $chosen in
$screen)
	if [[ -f /usr/local/bin/takeshot ]]; then
		sleep 1
		takeshot --now
	else
		msg
	fi
	;;
$area)
	if [[ -f /usr/local/bin/takeshot ]]; then
		takeshot --area
	else
		msg
	fi
	;;
$window)
	if [[ -f /usr/local/bin/takeshot ]]; then
		sleep 1
		takeshot --win
	else
		msg
	fi
	;;
esac
