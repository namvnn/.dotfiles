vim.keymap.set(
    "ia",
    "me::",
    vim.fn.strftime(
        "Author: Nam Nguyen <hi@namn.me><CR>"
            .. "Description:<CR>"
            .. "License: MIT License<CR>"
            .. "Date Created: %B %d, %Y<CR>"
            .. "Date Modified: %B %d, %Y"
    )
)
