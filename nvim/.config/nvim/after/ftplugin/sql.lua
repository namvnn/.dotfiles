local sqlserver_ok, sqlserver = pcall(require, "sqlserver")
local snacks_ok, snacks = pcall(require, "snacks")
if sqlserver_ok and snacks_ok then
    sqlserver.setup({
        keymap_prefix = "<LocalLeader>m",
        results = {
            column_icons = false,
        },
    })
    snacks.setup({
        picker = {
            enabled = true,
        },
    })
end
