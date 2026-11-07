local function once()
    if vim.g.nn_ftplugin_rust == 1 then
        return
    end

    vim.g.nn_ftplugin_rust = 1

    if vim.fn.executable("rust-analyzer") then
        vim.lsp.enable("rust_analyzer")
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.rust = { "rustfmt" }
    end
end

local function always()
    if vim.b.nn_ftplugin_rust == 1 then
        return
    end

    vim.b.nn_ftplugin_rust = 1
end

once()
always()
