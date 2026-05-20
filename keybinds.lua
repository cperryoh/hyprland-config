-- Hyprland Keybindings Configuration (Corrected)
-- Properly formatted to match official hl.bind() API

-- Main modifier definitions
local mainMod = "SUPER"
local alt = "ALT"
local ns = "qs -c noctalia-shell"
local shift = "SHIFT"
local ctrl = "CTRL"
local ipc = 'qs -c noctalia-shell ipc call'

-- ===== APPLICATION LAUNCHER KEYBINDS =====
-- Core Applications
hl.bind(mainMod .. " + q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call wallpaper toggle"))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("librewolf --new-window:Data https://google.com"))
hl.bind(mainMod .. " + " .. shift .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + " .. shift .. " + g", hl.dsp.exec_cmd("~/scripts/gym_activity.py"))

-- Specialized Launches
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd("librewolf https://gmail.com https://moodle.rose-hulman.edu/my/index.php https://outlook.office.com/mail/"))

-- Launchers & Menus
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd('qs -c noctalia-shell ipc call launcher toggle'))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/scripts/quick_links.sh"))

-- ===== HARDWARE KEY BINDINGS (Volume, Brightness, Media) =====
-- Volume Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && paplay /usr/share/sounds/freedesktop/stereo/message.oga & quickshell msg \"volume-update\""), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && paplay /usr/share/sounds/freedesktop/stereo/message.oga & quickshell msg \"volume-update\""), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && paplay /usr/share/sounds/freedesktop/stereo/complete.oga & quickshell msg \"volume-update\""))
hl.bind("xf86audiomicmute", hl.dsp.exec_cmd("wpctl set-mute @default_audio_source@ toggle"))

-- Brightness Controls
hl.bind("xf86monbrightnessup", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })

-- Media Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc.." volume increase"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc.." volume decrease"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc.." volume muteOutput"))

-- ===== MOUSE CONTROLS =====
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ===== SYSTEM CONTROL KEYBINDS =====
hl.bind(mainMod .. " + m", hl.dsp.exit())
hl.bind(mainMod .. " + " .. shift .. " + h", hl.dsp.exec_cmd("bash ~/scripts/toggle-hibernate.sh"))
hl.bind(alt .. " + " .. shift .. " + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(alt .. " + " .. shift .. " + R", hl.dsp.exec_cmd("python ~/scripts/open_rgb_script.py"))

-- ===== UTILITY & TOOL KEYBINDS =====
-- Screenshots
hl.bind(mainMod .. " + " .. shift .. " + P", hl.dsp.exec_cmd("sh -c 'f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; hyprshot -m region -o ~/Pictures/Screenshots -f \"$(basename \"$f\")\" && wl-copy --type image/png < \"$f\"'"))
hl.bind(mainMod .. " + " .. shift .. " + W", hl.dsp.exec_cmd("sh -c 'f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; hyprshot -m window -o ~/Pictures/Screenshots -f \"$(basename \"$f\")\" && wl-copy --type image/png < \"$f\"'"))
hl.bind(mainMod .. " + " .. shift .. " + 1", hl.dsp.exec_cmd("sh -c 'f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; hyprshot -m output -m DP-1 -o ~/Pictures/Screenshots -f \"$(basename \"$f\")\" && wl-copy --type image/png < \"$f\"'"))
hl.bind(mainMod .. " + " .. shift .. " + 2", hl.dsp.exec_cmd("sh -c 'f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; hyprshot -m output -m DP-2 -o ~/Pictures/Screenshots -f \"$(basename \"$f\")\" && wl-copy --type image/png < \"$f\"'"))

-- Clipboard
hl.bind(mainMod .. " + " .. shift .. " + V", hl.dsp.exec_cmd(ns.." ipc call launcher clipboard"))

-- Fun/Visual Tools
hl.bind(mainMod .. " + " .. shift .. " + b", hl.dsp.exec_cmd("kitty bonsai.sh -l -t .04 -i --life 30"))
hl.bind(mainMod .. " + " .. shift .. " + L", hl.dsp.exec_cmd("hyprloc"))

-- Hardware Control
hl.bind(mainMod .. " + " .. shift .. " + o", hl.dsp.exec_cmd("openrgb --profile off"))

-- System Menus
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/applets/bin/volume.sh"))
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd(ns.." ipc call sessionMenu toggle"))

-- Special Keys
hl.bind("END", hl.dsp.exec_cmd("ydotool key home"))

-- Additional media keys
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd(ns.." ipc call media playPause"))
hl.bind(mainMod .. " + n", hl.dsp.exec_cmd(ns.." ipc call media next"))
hl.bind(mainMod .. " + " .. shift .. " + n", hl.dsp.exec_cmd(ns.." ipc call media previous"))
hl.bind(mainMod .. " + a", hl.dsp.exec_cmd("vicinae 'vicinae://launch/@rastsislaux/store.vicinae.pulseaudio/outputDevices' > ~/vicinae.txt"))
hl.bind(mainMod .. " + d", hl.dsp.exec_cmd("~/.config/rofi/scripts/disconnect_devices.sh"))

-- ===== WINDOW MANAGEMENT KEYBINDS =====
-- Window States
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({mode="fullscreen",action="toggle"}))
hl.bind(mainMod .. " + " .. shift .. " + f", hl.dsp.window.float({action="toggle"}))
hl.bind(mainMod .. " + c", hl.dsp.window.kill())

-- Window Cycling
hl.bind(alt .. " + TAB", hl.dsp.window.cycle_next())

-- Focus Movement (vim keys + arrows)
local hy3 = hl.plugin.hy3
hl.bind(mainMod .. " + h", hy3.move_focus("l"))
hl.bind(mainMod .. " + J", hy3.move_focus("d"))
hl.bind(mainMod .. " + K", hy3.move_focus("u"))
hl.bind(mainMod .. " + l", hy3.move_focus("r"))
hl.bind(mainMod .. " + left", hy3.move_focus("l"))
hl.bind(mainMod .. " + right", hy3.move_focus("r"))
hl.bind(mainMod .. " + up", hy3.move_focus("u"))
hl.bind(mainMod .. " + down", hy3.move_focus("d"))

-- Window Moving (alt+vim keys)
hl.bind(alt .. " + H", hy3.move_window("l"))
hl.bind(alt .. " + J", hy3.move_window("d"))
hl.bind(alt .. " + K", hy3.move_window("u"))
hl.bind(alt .. " + L", hy3.move_window("r"))

-- Group Management (hy3 plugin)
hl.bind(alt .. " + G", hy3.make_group("tab"))
hl.bind(alt .. " + N", hy3.make_group("h"))
hl.bind(alt .. " + V", hy3.make_group("v"))
hl.bind(alt .. " + X", hy3.change_group("opposite"))
hl.bind(alt .. " + T", hy3.focus_tab({index=1, wrap = true }))
hl.bind(alt .. " + o", hy3.change_focus("raise"))
hl.bind(alt .. " + u", hy3.change_focus("lower"))
hl.bind(alt .. " + R", hy3.equalize({scope="workspace"}))

-- Workspace Switching within Groups
hl.bind(alt .. " + " .. shift .. " + H", hy3.move_to_workspace("e-1"))
hl.bind(alt .. " + " .. shift .. " + L", hy3.move_to_workspace("e+1"))

-- ===== RESIZE MODE =====

-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()

    -- Set repeating binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))

end)

-- Keybinds further down will be global again...
-- ===== WORKSPACE MANAGEMENT KEYBINDS =====
-- Workspace Switching (Super + Numbers)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
end
-- 2. Move active window to workspace (SHIFT + 1 through 9)
hl.bind(mainMod .. " + 0", hl.dsp.focus({workspace='10'}))
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))

-- Move Windows to Workspaces (Alt + Numbers)
for i = 1, 9 do
    hl.bind(alt .. " + " .. tostring(i), hy3.move_to_workspace(tostring(i),{ follow = true }))
end
hl.bind(alt .. " + 0", hy3.move_to_workspace('10',{  follow = true }))
hl.bind(alt .. " + S", hy3.move_to_workspace("special:magic",{  follow = true }))

-- Workspace Scrolling (Super + Mouse Wheel)
