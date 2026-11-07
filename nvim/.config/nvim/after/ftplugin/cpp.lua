local function once()
    if vim.g.nn_ftplugin_cpp == 1 then
        return
    end

    vim.g.nn_ftplugin_cpp = 1

    if vim.fn.executable("clangd") then
        vim.lsp.config("clangd", {
            capabilities = { offsetEncoding = { "utf-16" } },
            init_options = {
                fallbackFlags = { "-std=c++23" },
            },
        })
        vim.lsp.enable("clangd")
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.cpp = { "clang_format" }
    end
end

local function always()
    if vim.b.nn_ftplugin_cpp == 1 then
        return
    end

    vim.b.nn_ftplugin_cpp = 1

    vim.b.dispatch = "c++ -std=c++23 -o %:p:r % && %:p:r"
    vim.b.start = "c++ -std=c++23 -o %:p:r % && %:p:r"
end

once()
always()
