local wezterm = require("wezterm")

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

local function get_color_scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "Builtin Dark"
    else
        return "Builtin Light"
    end
end

return {
    color_scheme = get_color_scheme_for_appearance(get_appearance()),
    enable_tab_bar = false,
    font_size = 13,
}
