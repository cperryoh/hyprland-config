local logger = require("logger")
logger.log("BEGIN LOAD STARTUP")

startup_commands_list = {
--  "hyprpaper",
	"noctalia",
  "sleep 1 && qs -c noctalia-shell ipc call lockScreen lock",
	"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
	"vicinae server",
	"hypridle",
	'input-remapper-control --preset main --command start --device "SONIX Galaxy70"',
	'input-remapper-control --preset main --command start --device "BY Tech Gaming Keyboard"',
	'/usr/bin/input-remapper-control --preset main --command start --device "Logitech PRO 2 MOUSE"',
	"solaar --window=hide",
	"kdeconnect-indicator",
	"wal --theme dkeg-branch",
  --"waybar",
	"wl-paste --type text --watch cliphist store",
	"wl-paste --type image --watch cliphist store",
	"sleep 2 && cliphist wipe",
	"python ~/git/scripts/open_rgb.py >> ~/logs.txt",
	"wayvnc -r -C ~/.config/wayvnc/config -o DP-2 0.0.0.0 5900 > /tmp/wayvnc-hypr.log 2>&1",
	'tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"',
	"hyprland-qtutils",
	"kvantummanager --set KvYaru-PurpleDark",
	"hyprctl dispatch workspace 1",
	"systemctl --user restart hyprpolkitagent sunshine.service",
	"meto-qt",
	"home/cperryoh/AppImages/azeron_software.appimage",
}

-- Target file to store PIDs for this session

hl.on("hyprland.start", function()
	logger.log("Beginning to execute startup items and capture PIDs")

	-- Ensure a clean tracking file for this run

	for _, item in ipairs(startup_commands_list) do
		logger.log("starting " .. item)

		-- Wrap the command to background it, sleep for a fraction of a second to let it fork,
		-- and then look up the exact real running process name using pgrep to dump to our file.
		hl.exec_cmd(item)
	end
end)

logger.log("STARTUP COMPLETE")
