local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("n", "<Esc>", ":noh<CR>", { silent = true })
map("n", ";", ":")
map("n", "<leader>e", ":Oil --preview<CR>", { silent = true, noremap = true })
map("n", "<leader>ww", ":wa<CR>", { silent = true })

map("n", "<S-h>", ":bprevious<cr>", { silent = true })
map("n", "<S-l>", ":bnext<cr>", { silent = true })
map("n", "<leader>qq", ":qa<CR>", { silent = true, noremap = true, desc = "Quit" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
