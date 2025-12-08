vim.g.lazyvim_picker = "telescope"
vim.g.snacks_animate = false

local opt = vim.opt

opt.tabstop = 4 -- jumlah spasi saat menekan tab
opt.shiftwidth = 4 -- jumlah spasi untuk indentasi (>> dan <<)
opt.softtabstop = 4 -- jumlah spasi saat tekan <Tab> di insert mode
opt.expandtab = true -- ubah tab jadi spasi

opt.guicursor = { "n-v-c-i:block" }
opt.scrolloff = 10
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", extends = ">", precedes = "<", space = "·" }
