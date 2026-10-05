local specs = {
    -- Base
    {
        name = "fzf",
        src = "https://github.com/junegunn/fzf",
    },
    {
        name = "oil",
        src = "https://github.com/stevearc/oil.nvim",
    },
    {
        name = "lion",
        src = "https://github.com/tommcdo/vim-lion",
    },
    {
        name = "dispatch",
        src = "https://github.com/tpope/vim-dispatch",
    },
    {
        name = "fugitive",
        src = "https://github.com/tpope/vim-fugitive",
    },
    {
        name = "projectionist",
        src = "https://github.com/tpope/vim-projectionist",
    },
    {
        name = "rainbow",
        src = "https://github.com/luochen1990/rainbow",
        init = function()
            vim.g.rainbow_active = 1
            vim.g.rainbow_conf = {
                ctermfgs = {
                    "blue",
                    "green",
                    "red",
                    "cyan",
                },
            }
        end,
    },

    -- LSP
    {
        name = "lspconfig",
        src = "https://github.com/neovim/nvim-lspconfig",
    },
    {
        name = "fidget",
        src = "https://github.com/j-hui/fidget.nvim",
    },

    -- Format
    {
        name = "conform",
        src = "https://github.com/stevearc/conform.nvim",
    },

    -- Debug
    {
        name = "dap",
        src = "https://github.com/mfussenegger/nvim-dap",
    },

    -- Database
    {
        name = "dadbob",
        src = "https://github.com/tpope/vim-dadbod",
    },
    {
        name = "dadbodui",
        src = "https://github.com/kristijanhusak/vim-dadbod-ui",
    },
    {
        name = "mssql",
        src = "https://github.com/NicholasMata/sqlserver.nvim",
    },
    {
        name = "mssqlpicker",
        src = "https://github.com/folke/snacks.nvim",
    },

    -- REPL
    {
        name = "conjure",
        src = "https://github.com/Olical/conjure",
    },

    -- Clojure
    {
        name = "fireplace",
        src = "https://github.com/tpope/vim-fireplace",
    },
    {
        name = "salve",
        src = "https://github.com/tpope/vim-salve",
    },

    -- C#
    {
        name = "dotnet",
        src = "https://github.com/GustavEikaas/easy-dotnet.nvim",
    },

    -- Java
    {
        name = "java",
        src = "https://github.com/nvim-java/nvim-java",
    },
}

local packspecs = {}
local config_ok, config = pcall(require, "_config")

if config_ok and config.plugins then
    for _, spec in ipairs(specs) do
        local plugin = config.plugins[spec.name]
        if
            plugin == true
            or (type(plugin) == "table" and plugin.enabled == true)
        then
            table.insert(packspecs, {
                name = spec.name,
                src = spec.src,
            })
            if type(spec.init) == "function" then
                spec.init()
            end
            if type(plugin) == "table" and type(plugin.init) == "function" then
                plugin.init()
            end
        end
    end
end

vim.pack.add(packspecs)
