local function once()
    if vim.g.nn_ftplugin_html == 1 then
        return
    end

    vim.g.nn_ftplugin_html = 1

    if
        vim.fn.executable("node_modules/.bin/vscode-html-language-server")
        or vim.fn.executable("vscode-html-language-server")
    then
        vim.lsp.enable("html")
    end
end

local function always()
    if vim.b.nn_ftplugin_html == 1 then
        return
    end

    vim.b.nn_ftplugin_html = 1
end

once()
always()
