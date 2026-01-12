require("oil").setup({
    columns = {
        "permissions",
        "size",
        "mtime",
    },
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
