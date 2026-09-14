local ok, sqlserver = pcall(require, "sqlserver")

if not ok then
    return
end

sqlserver.setup({
    keymap_prefix = "<LocalLeader>m",
})
