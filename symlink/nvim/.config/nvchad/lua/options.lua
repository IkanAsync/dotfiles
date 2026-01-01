require "nvchad.options"

local opt = vim.opt
local o = vim.o
local g = vim.g

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.relativenumber = true
opt.number = true
opt.guicursor = { "n-v-c-i:block" }
opt.scrolloff = 10
opt.termguicolors = true
opt.cursorline = true
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", extends = ">", precedes = "<", space = "·" }
