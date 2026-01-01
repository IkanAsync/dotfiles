require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<S-l>", ":bnext<CR>", { silent = true })
map("n", "<S-h>", ":bprevious<CR>", { silent = true })
map("n", "<leader>e", ":Oil --preview<CR>", { silent = true, noremap = true })
map("n", "<leader>ww", ":wa<CR>", { silent = true })
map("n", "<leader>qq", ":qa<CR>", { silent = true })

-- terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "rounded",
        width = 180,
        height = 50,
        winblend = 3,
    },
}

local gemini = Terminal:new {
    cmd = "gemini",
    hidden = true,
    direction = "vertical",
    float_opts = {
        border = "rounded",
        width = 180,
        height = 50,
        winblend = 3,
    },
}

local btop = Terminal:new {
    cmd = "btop",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "rounded",
        width = 180,
        height = 50,
        winblend = 3,
    },
}

function gemini_toggle()
    gemini:toggle()
end

function btop_toggle()
    btop:toggle()
end

function lazygit_toggle()
    lazygit:toggle()
end

map({ "n", "i", "t" }, "<C-g>", "<cmd>lua gemini_toggle()<CR>", { desc = "gemini ai", silent = true, noremap = true })
map("n", "<leader>tl", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true, desc = "lazygit" })
map("n", "<leader>tb", "<cmd>lua btop_toggle()<CR>", { noremap = true, silent = true, desc = "btop" })

-- diagnostic
local diagnostic_goto = function(next, serverity)
    return function()
        vim.diagnostic.jump {
            count = (next and 1 or -1) * vim.v.count1,
            severity = serverity and vim.diagnostic.severity[serverity] or nil,
            float = true,
        }
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Next Error" })

map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Next Warning" })
