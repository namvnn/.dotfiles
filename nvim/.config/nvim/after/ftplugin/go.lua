local function once()
    if vim.g.nn_ftplugin_go == 1 then
        return
    end

    vim.g.nn_ftplugin_go = 1

    if vim.fn.executable("gopls") then
        vim.lsp.enable("gopls")
    end
end

local function always()
    if vim.b.nn_ftplugin_go == 1 then
        return
    end

    vim.b.nn_ftplugin_go = 1
end

once()
always()
