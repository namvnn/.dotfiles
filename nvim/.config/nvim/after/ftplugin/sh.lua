local function once()
    if vim.g.nn_ftplugin_sh == 1 then
        return
    end

    vim.g.nn_ftplugin_sh = 1
end

local function always()
    if vim.b.nn_ftplugin_sh == 1 then
        return
    end

    vim.b.nn_ftplugin_sh = 1

    vim.b.dispatch = "shellcheck '%'"
    vim.b.start = "shellcheck '%'"
end

once()
always()
