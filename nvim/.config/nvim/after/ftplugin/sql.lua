local sqlserver_ok, sqlserver = pcall(require, "sqlserver")
if sqlserver_ok then
    sqlserver.setup({
        keymap_prefix = "<LocalLeader>m",
    })
end
