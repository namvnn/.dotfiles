local sqlserver_ok, sqlserver = pcall(require, "sqlserver")
if sqlserver_ok then
    sqlserver.setup({
        keymap_prefix = "<LocalLeader>m",
        results = {
            column_icons = false,
        },
    })

    local snacks_ok, snacks = pcall(require, "snacks")
    if snacks_ok then
        snacks.setup({
            picker = {
                enabled = true,
            },
        })
    end
end
