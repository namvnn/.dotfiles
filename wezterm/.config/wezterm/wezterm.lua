local wezterm = require("wezterm")

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

local function get_color_scheme(appearance)
    if appearance:find("Dark") then
        return "Builtin Dark"
    else
        return "Tomorrow"
    end
end

local function get_theme_mode_env(appearance)
    if appearance:find("Dark") then
        return "dark"
    else
        return "light"
    end
end

local appearance = get_appearance()

return {
    audible_bell = "Disabled",
    color_scheme = get_color_scheme(appearance),
    enable_tab_bar = false,
    font_size = 13,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    set_environment_variables = { THEME_MODE = get_theme_mode_env(appearance) },
    window_close_confirmation = "NeverPrompt",
}
