-- Monitor and Workspace Configuration

-- Monitor setup
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@144",
    position = "0x0",
})
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@144",
    position = "-1920x0",
})

-- XWayland configuration
my_config.xwayland = {
    force_zero_scaling = true,
}

-- Workspace assignments to monitors
-- Note: Workspace IDs are wrapped in quotes as strings to match docs
workspaces = {
    { workspace = "1",  monitor = "DP-1" },
    { workspace = "2",  monitor = "DP-2" },
    { workspace = "3",  monitor = "DP-1" },
    { workspace = "4",  monitor = "DP-2" },
    { workspace = "5",  monitor = "DP-1" },
    { workspace = "6",  monitor = "DP-2" },
    { workspace = "7",  monitor = "DP-1" },
    { workspace = "8",  monitor = "DP-2" },
    { workspace = "9",  monitor = "DP-1" },
    { workspace = "10", monitor = "DP-2" },
    {
        workspace = "special:magic",
        gaps_out = 30, -- Fixed typo (added underscore)
    },
}
hl.layer_rule({name="noctalia",match={namespace="noctalia-background-.*$"}, ignore_alpha=0.5,blur=true,blur_popups=true})

for _, item in ipairs(workspaces) do
    hl.workspace_rule(item)
end
