-- Force the engine to suppress runtime/type error bars on the screen
local colors= require("colors")
my_config={}
my_config.debug = {
        suppress_errors = true
    }
my_config.plugin = {
    hy3 = {
        tabs = {
            height = 22,
            padding = 6,
            radius = 6,
            border_width = 3,
            render_text = true,
            text_center = true,
            text_font = "Sans",
            text_height = 12,
            blur = true,
            opacity = 1.0,
            colors = {
                active = colors.color12_tab,
                active_border = colors.color12_tab_border,
                active_text = colors.foreground_tab_text,
                active_alt_monitor = colors.color5_tab,
                active_alt_monitor_border = colors.color5_tab_border,
                active_alt_monitor_text = colors.foreground_tab_text,
                focused = colors.color3_tab,
                focused_border = colors.color3_tab_border,
                focused_text = colors.foreground_tab_text,
                inactive = colors.background_tab,
                inactive_border = colors.color6_tab_border,
                inactive_text = colors.color7_tab_text,
            },
        },
    },
}
-- Hyprland Lua Configuration
-- Converted from Hyprlang to Lua

-- Load color scheme

-- Define main modifier key
mainMod = "SUPER"

-- General configuration
my_config.general = {
    layout="hy3",
    gaps_in = 5,
    gaps_out = 10,
    border_size = 3,
    col = {
        active_border = colors.color3,
        inactive_border = colors.color5,
    },
    -- Lock screen and sleep commands
    lock_cmd = "pidof hyprlock || hyprlock",
}

-- Cursor configuration
my_config.cursor = {
    no_hardware_cursors = true,
}

-- Decoration settings
my_config.decoration = {
    rounding = 20,
    rounding_power = 2,
    dim_special = 0.6,
    dim_inactive = true,
    dim_strength = 0.2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
        enabled = true,
        range = 4,
        render_power = 5,
        color = "rgba(1a1a1aee)",
    },
    blur = {
        enabled = true,
        size = 3,
        passes = 1,
        vibrancy = 0.1696,
    },
}

-- Animation configuration
-- 1. Enable animations globally in your main config table
my_config.animations={
        enabled = true
}

-- 2. Register your Bezier Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve("focus_curve",    { type = "bezier", points = { {0, 0}, {1, 1} } })

-- 3. Define individual Animations
-- Format: hl.animation({ leaf = "name", enabled = true, speed = X, bezier = "name", style = "optional" })
hl.animation({ leaf = "global",         enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "hyprfocusIn",    enabled = true, speed = 1.7,  bezier = "linear" })
hl.animation({ leaf = "hyprfocusOut",   enabled = true, speed = 1.7,  bezier = "linear" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Master layout configuration
my_config.master = {
    new_status = "master",
}

-- Input configuration
my_config.input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    left_handed = true,
    follow_mouse = 1,
    accel_profile = "flat",
    sensitivity = -0.125,
    touchpad = {
        natural_scroll = false,
    },
}

-- Device-specific input config
my_config.device = {
    {
        name = "glorious-model-o-wireless",
        accel_profile = "flat",
    },
    {
        name = "BY Tech Gaming Keyboard",
    },
    {
        name = "Logitech PRO 2 MOUSE",
    },
}

-- Misc configuration
my_config.misc = {
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
    vrr = 1,
    enable_swallow = true,
}

-- Plugin configuration

-- Monitor configuration (loaded from monitors.lua)
-- Keyboard layout and bindings (loaded from keybinds files)

-- Layer rules for visual elements
my_config.layerrule = {
    { rule = "match:namespace waybar", property = "blur", value = "1" },
    { rule = "match:namespace waybar", property = "ignore_alpha", value = "0.5" },
    { rule = "match:namespace wofi", property = "blur", value = "true" },
    { rule = "match:namespace selection", property = "blur", value = "off" },
    { rule = "match:namespace selection", property = "no_anim", value = "on" },
    {
        name = "vicinae-blur",
        rule = "match:namespace vicinae",
        blur = "on",
        ignore_alpha = 0,
    },
    {
        name = "vicinae-no-animation",
        rule = "match:namespace vicinae",
        no_anim = "on",
    },
}

-- Load modular configurations

hl.config(my_config)
require("startup")
require("windowrules")
require("keybinds")
require("environment")
require("monitors")
