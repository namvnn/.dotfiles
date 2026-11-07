local function once()
    if vim.g.nn_ftplugin_markdown == 1 then
        return
    end

    vim.g.nn_ftplugin_markdown = 1

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.markdown =
            { "oxfmt", "prettier", stop_after_first = true }
    end
end

local function always()
    if vim.b.nn_ftplugin_markdown == 1 then
        return
    end

    vim.b.nn_ftplugin_markdown = 1

    vim.b.dispatch = "mdp '%'"
    vim.b.start = "mdp '%'"
end

once()
always()
