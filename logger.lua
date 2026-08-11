local M = {}

function M.log(message)
    local file = io.open(os.getenv("HOME") .. "/hyprland_lua_debug.log", "a")
    if file then
        file:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. message .. "\n")
        file:close()
    end
end

return M
