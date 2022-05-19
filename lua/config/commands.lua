vim.api.nvim_create_user_command(
    "Help",
    ":keepjumps enew | :set buftype=help | :keepjumps help <args>",
    { nargs = 1, complete = "help" }
)

-- Causes :help or :h to be automatically changed to :Help
vim.api.nvim_exec(":cabbrev help Help", false)
vim.api.nvim_exec(":cabbrev h Help", false)
