local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("n", ";", ":")
map("n", "<leader>fs", ":Telescope aerial<CR>", { noremap = true, silent = true })
map("n", "<leader>ww", ":wa<CR>", { silent = true, noremap = true, desc = "Save all" })

map("x", "p", '"_dP', { noremap = true, silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "rounded",
        width = 180,
        height = 50,
        winblend = 3,
    },
})
local btop = Terminal:new({
    cmd = "btop",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "rounded",
        width = 180,
        height = 50,
        winblend = 3,
    },
})

function btop_toggle()
    btop:toggle()
end
function _lazygit_toggle()
    lazygit:toggle()
end

map("n", "<leader>tl", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
map("n", "<leader>tb", "<cmd>lua btop_toggle()<CR>", { noremap = true, silent = true })
