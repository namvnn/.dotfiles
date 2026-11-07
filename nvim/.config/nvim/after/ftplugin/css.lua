local function once()
    if vim.g.nn_ftplugin_css == 1 then
        return
    end

    vim.g.nn_ftplugin_css = 1

    if
        vim.fn.executable("node_modules/.bin/vscode-css-language-server")
        or vim.fn.executable("vscode-css-language-server")
    then
        vim.lsp.enable("cssls")
    end
end

local function always()
    if vim.b.nn_ftplugin_css == 1 then
        return
    end

    vim.b.nn_ftplugin_css = 1
end

once()
always()
