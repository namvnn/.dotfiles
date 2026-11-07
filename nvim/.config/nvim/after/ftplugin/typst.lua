local function once()
    if vim.g.nn_ftplugin_typst == 1 then
        return
    end

    vim.g.nn_ftplugin_typst = 1

    if vim.fn.executable("tinymist") then
        vim.lsp.enable("tinymist")
    end
end

local function always()
    if vim.b.nn_ftplugin_typst == 1 then
        return
    end

    vim.b.nn_ftplugin_typst = 1
end

once()
always()
