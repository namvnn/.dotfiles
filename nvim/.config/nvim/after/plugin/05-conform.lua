local conform = require("conform")

local biome_files = { "biome.json", "biome.jsonc" }
local deno_files = { "deno.json", "deno.jsonc" }
local oxfmt_files = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" }

local function oxfmt_prettier(bufnr)
    if vim.fs.root(bufnr, oxfmt_files) then
        return { "oxfmt" }
    end

    return { "prettier" }
end

local function oxfmt_deno_biome_prettier(bufnr)
    if vim.fs.root(bufnr, oxfmt_files) then
        return { "oxfmt" }
    end

    if vim.fs.root(bufnr, deno_files) then
        return { "deno_fmt" }
    end

    if vim.fs.root(bufnr, biome_files) then
        return { "biome" }
    end

    return { "prettier" }
end

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        cs = { "csharpier" },
        javascript = oxfmt_deno_biome_prettier,
        javascriptreact = oxfmt_deno_biome_prettier,
        json = oxfmt_prettier,
        jsonc = oxfmt_prettier,
        lua = { "stylua" },
        markdown = oxfmt_prettier,
        python = { "ruff_format" },
        rust = { "rustfmt" },
        typescript = oxfmt_deno_biome_prettier,
        typescriptreact = oxfmt_deno_biome_prettier,
        yaml = oxfmt_prettier,
    },
})

vim.keymap.set("n", "<Leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
