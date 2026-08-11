
-- Export to environment table for reference
env = {
    HYPRCURSOR_THEME = "Nordzy-cursors",
    HYPRCURSOR_SIZE = "24",
    XDG_CURRENT_DESKTOP = "Hyprland",
    FILE_MANAGER = "thunar",
    NVD_BACKEND = "direct",
    QT_STYLE_OVERRIDE = "kvantum",
    QT_QPA_PLATFORMTHEME = "qt5ct",
    QT_QPA_PLATFORM = "wayland",
}
for key,value in pairs(env) do
    hl.env(key,value)
end
