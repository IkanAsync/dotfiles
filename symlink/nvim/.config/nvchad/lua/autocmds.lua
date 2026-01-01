require "nvchad.autocmds"
local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end
    end,

    map("n", "<leader>cr", require "nvchad.lsp.renamer", { desc = "Rename" }),
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" }),
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})
