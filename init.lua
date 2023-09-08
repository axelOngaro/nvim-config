local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.wo.number = true         -- Show line numbers
vim.wo.relativenumber = true -- Show relative line numbers

-- options
-- require
require("axel.set")
require("axel.lazy")
require("axel.remap")
