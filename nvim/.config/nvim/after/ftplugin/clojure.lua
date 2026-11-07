local function once()
    if vim.g.nn_ftplugin_clojure == 1 then
        return
    end

    vim.g.nn_ftplugin_clojure = 1

    if vim.fn.executable("clojure-lsp") then
        vim.lsp.enable("clojure_lsp")
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.formatters_by_ft.clojure = { "cljfmt", "joker" }
    end
end

local function always()
    if vim.b.nn_ftplugin_clojure == 1 then
        return
    end

    vim.b.nn_ftplugin_clojure = 1
end

once()
always()
