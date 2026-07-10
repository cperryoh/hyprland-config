-- Alternative: Define as a list of strings for easier iteration
startup_commands_list = {
	"vicinae server",
  "systemctl --user start hypridle.service",
	"hyprpm reload -nn && hyprctl dismissnotify",
	'input-remapper-control --preset main --command start --device "BY Tech Gaming Keyboard"',
	'/usr/bin/input-remapper-control --preset main --command start --device "Logitech PRO 2 MOUSE"',
	"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
	"solaar --window=hide",
	"kdeconnect-indicator",
	"wal --theme dkeg-branch &",
	" qs -c noctalia-shell",
	"wl-paste --type text --watch cliphist store",
	"wl-paste --type image --watch cliphist store",
	"sleep 2 && cliphist wipe &",
	"python ~/git/scripts/open_rgb.py >> ~/logs.txt",
	"wayvnc -r -C ~/.config/wayvnc/config -o DP-2 0.0.0.0 5900 > /tmp/wayvnc-hypr.log 2>&1",
	'tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"',
	"hyprland-qtutils",
	"kvantummanager --set KvYaru-PurpleDark",
	"hyprctl dispatch workspace 1",
	"systemctl --user restart hyprpolkitagent sunshine.service",
  "meto-qt",
	"hyprpm reload -n",
  "hyprctl plugin load /usr/lib/libhyprfocus.so",
  "/home/cperryoh/AppImages/azeron_software.appimage"
}
hl.on("hyprland.start", function()
	for _, item in ipairs(startup_commands_list) do
		hl.exec_cmd(item)
	end
end)
