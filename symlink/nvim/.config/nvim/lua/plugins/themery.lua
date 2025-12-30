return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup {}
            vim.cmd.colorscheme "nord"
        end,
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup {
                themes = { "tokyonight", "tokyonight-storm", "nord" },
                livePreview = true,
            }
        end,
    },
}
