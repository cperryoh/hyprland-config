-- Monitor and Workspace Configuration

-- Monitor setup
hl.monitor({
	output = "DP-2",
	mode = "2560x1440@180",
	position = "auto",
	scale = 1,
	vrr = 1, -- Variable Refresh Rate (0=off, 1=on, 2=fullscreen, 3=adaptive)
	bitdepth = 10, -- Explicitly request a 10-bit color depth
	cm = "hdr", -- Options: "hdr" (standard wide/PQ) or "hdredid" (uses monitor EDID primaries)

	-- Fine-tune your SDR content blending so it doesn't look washed out globally:
	sdrbrightness = 1.2, -- Adjusts overall SDR brightness (1.0 to 2.0 is common)
	sdrsaturation = 1.0, -- Fine-tune SDR saturation while HDR is active
	sdr_min_luminance = 0.005, -- Matches true black floor for OLED/Mini-LED panels
	sdr_max_luminance = 250, -- Adjust peak brightness for SDR elements (usually 200-250 nits)
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "2560x1440@144",
	position = "-2560x0",
})

-- XWayland configuration
hl.config({ xwayland = {
	force_zero_scaling = true,
} })

-- Workspace assignments to monitors
-- Note: Workspace IDs are wrapped in quotes as strings to match docs
workspaces = {
	{ workspace = "1", monitor = "DP-2" },
	{ workspace = "2", monitor = "DP-2" },
	{ workspace = "3", monitor = "DP-2" },
	{ workspace = "4", monitor = "DP-2" },
	{ workspace = "5", monitor = "DP-2" },
	{ workspace = "6", monitor = "HDMI-A-1" },
	{ workspace = "7", monitor = "HDMI-A-1" },
	{ workspace = "8", monitor = "HDMI-A-1" },
	{ workspace = "9", monitor = "HDMI-A-1" },
	{ workspace = "10", monitor = "HDMI-A-1" },
	{
		workspace = "special:magic",
		gaps_out = 30, -- Fixed typo (added underscore)
	},
}
hl.layer_rule({
	name = "noctalia",
	match = { namespace = "noctalia-background-.*$" },
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

for _, item in ipairs(workspaces) do
	hl.workspace_rule(item)
end

hl.window_rule({ name = "Picture in picture float", match = { title = "Picture-in-Picture" }, float = true })
hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = { 
        class = "xwaylandvideobridge" 
    },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    size = { 1, 1 },
    opacity = 0.0,
})
