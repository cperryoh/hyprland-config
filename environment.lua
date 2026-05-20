
-- Export to environment table for reference
env = {
    HYPRCURSOR_THEME = "Nordzy-cursors",
    HYPRCURSOR_SIZE = "24",
    XDG_CURRENT_DESKTOP = "Hyprland",
    FILE_MANAGER = "thunar",
    LIBVA_DRIVER_NAME = "nvidia",
    __GLX_VENDOR_LIBRARY_NAME = "nvidia",
    NVD_BACKEND = "direct",
    QT_STYLE_OVERRIDE = "kvantum",
    QT_QPA_PLATFORMTHEME = "qt5ct",
    QT_QPA_PLATFORM = "wayland",
}
for key,value in pairs(env) do
    hl.env(key,value)
end
