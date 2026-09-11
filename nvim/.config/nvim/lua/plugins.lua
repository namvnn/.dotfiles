local specs = {
    "https://github.com/junegunn/fzf",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tommcdo/vim-lion",
    "https://github.com/tpope/vim-dispatch",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-projectionist",
}

local optional = {
    lsp = {
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/j-hui/fidget.nvim",
    },
    format = {
        "https://github.com/stevearc/conform.nvim",
    },
    debug = {
        "https://github.com/mfussenegger/nvim-dap",
    },
    database = {
        "https://github.com/tpope/vim-dadbod",
        "https://github.com/kristijanhusak/vim-dadbod-ui",
    },
    repl = {
        "https://github.com/Olical/conjure",
    },
    clojure = {
        "https://github.com/tpope/vim-fireplace",
        "https://github.com/tpope/vim-salve",
    },
    csharp = {
        "https://github.com/GustavEikaas/easy-dotnet.nvim",
    },
    java = {
        "https://github.com/nvim-java/nvim-java",
    },
    mssql = {
        "https://github.com/NicholasMata/sqlserver.nvim",
    },
}

local config_ok, config = pcall(require, "_config")

if config_ok and config.plugins then
    for name, plugins in pairs(optional) do
        local cfg = config.plugins[name]
        if cfg and cfg.enabled then
            vim.list_extend(specs, plugins)

            for gkey, gvalue in pairs(cfg.gvars or {}) do
                vim.g[gkey] = gvalue
            end
        end
    end
end

vim.pack.add(specs)
