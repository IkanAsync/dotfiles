local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("n", ";", ":")
map("n", "<Esc>", ":noh<CR>", { silent = true, noremap = true })
map("n", "<leader>w", ":wa<CR>", { silent = true, noremap = true, desc = "Save all" })
map("n", "<leader>qq", ":qa<CR>", { silent = true, noremap = true, desc = "quit all" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<S-h>", ":bprevious<CR>", { silent = true })
map("n", "<S-l>", ":bnext<CR>", { silent = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

--theme
map("n", "<leader>th", "<cmd>Themery<CR>", { silent = true, desc = "Theme" })
