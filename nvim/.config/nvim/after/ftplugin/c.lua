local function once()
    if vim.g.nn_ftplugin_c == 1 then
        return
    end

    vim.g.nn_ftplugin_c = 1

    if vim.fn.executable("clangd") then
        vim.lsp.config("clangd", {
            capabilities = { offsetEncoding = { "utf-16" } },
            init_options = {
                fallbackFlags = { "-std=c99" },
            },
        })
        vim.lsp.enable("clangd")
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.c = { "clang_format" }
    end
end

local function always()
    if vim.b.nn_ftplugin_c == 1 then
        return
    end

    vim.b.nn_ftplugin_c = 1

    vim.b.dispatch = "cc -std=c99 -o %:p:r % && %:p:r"
    vim.b.start = "cc -std=c99 -o %:p:r % && %:p:r"
end

once()
always()
