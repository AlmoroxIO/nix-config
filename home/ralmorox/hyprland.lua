-- Automatic monitor detection for the initial setup.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "intl",
    },

    general = {
        layout      = "dwindle",
        gaps_in     = 5,
        gaps_out    = 10,
        border_size = 2,
    },

    dwindle = {
        preserve_split = true,
    },
})

local mod = "SUPER"

-- Applications and windows.
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Return to the login console.
hl.bind(mod .. " + SHIFT + M",
    hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))

-- Focus.
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces 1–10; workspace 10 uses the 0 key.
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end

-- Move and resize with Super + mouse buttons.
hl.bind(mod .. " + mouse:272",
    hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273",
    hl.dsp.window.resize(), { mouse = true })

require("host")
