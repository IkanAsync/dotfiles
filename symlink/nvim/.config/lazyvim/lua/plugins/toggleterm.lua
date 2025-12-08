return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        size = 20,
        open_mapping = [[<c-f>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- bisa 'horizontal', 'vertical', 'tab', 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "rounded",
            width = 140,
            height = 30,
            winblend = 3,
        },
    },
}
