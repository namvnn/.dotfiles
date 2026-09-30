local dotnet_ok, dotnet = pcall(require, "easy-dotnet")
if dotnet_ok then
    vim.lsp.config("easy_dotnet", {
        settings = {
            ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = false,
                csharp_enable_inlay_hints_for_implicit_variable_types = false,
            },
            ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = false,
            },
        },
    })
    dotnet.setup()
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.cs = { "csharpier" }
end
