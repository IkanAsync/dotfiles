local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

opt.whichwrap:append("<>[]hl")

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

opt.tabstop = 4 -- jumlah spasi saat menekan tab
opt.shiftwidth = 4 -- jumlah spasi untuk indentasi (>> dan <<)
opt.softtabstop = 4 -- jumlah spasi saat tekan <Tab> di insert mode
opt.expandtab = true -- ubah tab jadi spasi
opt.relativenumber = true
opt.number = true
opt.guicursor = { "n-v-c-i:block" }
opt.scrolloff = 10
-- opt.termguicolors = true
opt.cursorline = true
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", extends = ">", precedes = "<", space = "·" }
opt.winborder = "rounded"

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

vim.api.nvim_clear_autocmds({ event = "TextYankPost" })
