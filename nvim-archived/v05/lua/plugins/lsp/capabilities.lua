return vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    -- Reference: https://github.com/hrsh7th/cmp-nvim-lsp/blob/cbc7b02bb99fae35cb42f514762b89b5126651ef/lua/cmp_nvim_lsp/init.lua#L42
    {
        textDocument = {
            completion = {
                dynamicRegistration = false,
                completionItem = {
                    snippetSupport = true,
                    commitCharactersSupport = true,
                    deprecatedSupport = true,
                    preselectSupport = true,
                    tagSupport = {
                        valueSet = {
                            1, -- Deprecated
                        },
                    },
                    insertReplaceSupport = false, -- This has to be off to avoid nvim runtime error
                    resolveSupport = {
                        properties = {
                            "documentation",
                            "additionalTextEdits",
                            "insertTextFormat",
                            "insertTextMode",
                            "command",
                        },
                    },
                    insertTextModeSupport = {
                        valueSet = {
                            1, -- asIs
                            2, -- adjustIndentation
                        },
                    },
                    labelDetailsSupport = true,
                },
                contextSupport = true,
                insertTextMode = 1,
                completionList = {
                    itemDefaults = {
                        "commitCharacters",
                        "editRange",
                        "insertTextFormat",
                        "insertTextMode",
                        "data",
                    },
                },
            },
        },
    }
)
