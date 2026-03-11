require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cs = { "csharpier" },
        rust = { "rustfmt" },
        python = { "ruff_format" },
        json = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            return { "prettier" }
        end,
        jsonc = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            return { "prettier" }
        end,
        typescript = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
                return { "deno_fmt" }
            end

            if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
                return { "biome" }
            end

            return { "prettier" }
        end,
        typescriptreact = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
                return { "deno_fmt" }
            end

            if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
                return { "biome" }
            end

            return { "prettier" }
        end,
        javascript = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
                return {}
            end

            if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
                return { "deno_fmt" }
            end

            return { "prettier" }
        end,
        javascriptreact = function(bufnr)
            if vim.fs.root(bufnr, { ".oxfmtrc.json", ".oxfmtrc.jsonc" }) then
                return { "oxfmt" }
            end

            if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
                return { "deno_fmt" }
            end

            if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
                return { "biome" }
            end

            return { "prettier" }
        end,
    },
})

vim.keymap.set("n", "<Leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
