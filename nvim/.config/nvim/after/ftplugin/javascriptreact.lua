local function once()
    if vim.g.nn_ftplugin_javascripreact == 1 then
        return
    end

    vim.g.nn_ftplugin_javascripreact = 1

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.javascriptreact =
            { "oxfmt", "biome", "prettier", stop_after_first = true }
    end
end

local function always()
    if vim.b.nn_ftplugin_javascripreact == 1 then
        return
    end

    vim.b.nn_ftplugin_javascripreact = 1
end

once()
always()
