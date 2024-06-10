vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu rnu")
vim.cmd("set scrolloff=4")
vim.g.mapleader = " "
vim.keymap.set("n", "<F3>", "<CMD>hls!<CR>", { desc = "Toggle high light search" })
