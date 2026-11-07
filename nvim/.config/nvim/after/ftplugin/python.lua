local function once()
    if vim.g.nn_ftplugin_python == 1 then
        return
    end

    vim.g.nn_ftplugin_python = 1

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.python = { "ruff_format" }
    end
end

local function always()
    if vim.b.nn_ftplugin_python == 1 then
        return
    end

    vim.b.nn_ftplugin_python = 1

    vim.b.dispatch = "python3 %"
    vim.b.start = "python3 %"
end

once()
always()
