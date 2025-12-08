vim.cmd [[
  hi LspInlayHint guibg=NONE ctermbg=NONE
]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "qf",
        "lspinfo",
        "checkhealth",
        "man",
        "git",
        "NvimTree", -- contoh sidebar
        "neotest",
    },
    callback = function()
        vim.keymap.set("n", "q", "<C-w>q", { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

vim.api.nvim_create_autocmd({ "TextYankPost", "InsertLeave" }, {
    pattern = "*",
    callback = function()
        vim.cmd "silent! nohlsearch" -- hilangkan highlight search / yank
    end,
})
