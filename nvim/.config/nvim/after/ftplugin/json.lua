local function once()
    if vim.g.nn_ftplugin_json == 1 then
        return
    end

    vim.g.nn_ftplugin_json = 1

    if
        vim.fn.executable("node_modules/.bin/vscode-json-language-server")
        or vim.fn.executable("vscode-json-language-server")
    then
        vim.lsp.enable("jsonls")
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.json =
            { "oxfmt", "prettier", stop_after_first = true }
    end
end

local function always()
    if vim.b.nn_ftplugin_json == 1 then
        return
    end

    vim.b.nn_ftplugin_json = 1
end

once()
always()
