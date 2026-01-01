---@diagnostic disable: undefined-doc-name
return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    {
        "Aasim-A/scrollEOF.nvim",
        event = { "CursorMoved", "WinScrolled" },
        -- lazy = false,
        opts = {},
    },
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        float = {
            preview_split = "right",
        },
        opts = {
            skip_confirm_for_simple_edits = true,

            keymaps = {
                ["q"] = { "actions.close", mode = "n" },
                ["gd"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns { "icon", "permissions", "size", "mtime" }
                        else
                            require("oil").set_columns { "icon" }
                        end
                    end,
                },
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("ibl").setup {
                indent = {
                    char = "│",
                    tab_char = "│",
                },
                scope = { show_start = false, show_end = false },
                exclude = {
                    filetypes = {
                        "Trouble",
                        "alpha",
                        "dashboard",
                        "help",
                        "lazy",
                        "mason",
                        "neo-tree",
                        "notify",
                        "snacks_dashboard",
                        "snacks_notif",
                        "snacks_terminal",
                        "snacks_win",
                        "toggleterm",
                        "trouble",
                    },
                },
            }
        end,
        main = "ibl",
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    { import = "nvchad.blink.lazyspec" },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
            size = 100,
            open_mapping = [[<c-f>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "vertical", -- bisa 'horizontal', 'vertical', 'tab', 'float'
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "rounded",
                width = 140,
                height = 30,
                winblend = 3,
            },
        },
    },

    {
        "nvim-mini/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },

    {
        "mbbill/undotree",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "Undotree toggle" },
        },
    },

    {
        "folke/flash.nvim",
        event = { "BufReadPre", "BufNewFile" },
        --@type Flash.Config
        opts = {
            highlight = {
                backdrop = false,
            },

            modes = {
                char = {
                    highlight = { backdrop = false },
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
}
