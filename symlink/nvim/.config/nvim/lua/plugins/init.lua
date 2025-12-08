local detail = false
return {
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
        keys = {
            { "<leader>e", ":Oil --preview<CR>", desc = "Oil" },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        keys = {
            { "<leader>fs", "<cmd>Telescope aerial<cr>", desc = "telescope symbols" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "telescope find file" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffer" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "telescope find oldfiles" },
            { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "telescope live grep" },
            { "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" } },
            { "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" } },
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            notify = true,
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show { global = false }
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        opts = function()
            require("mason").setup {
                PATH = "skip",
                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = " ",
                        package_uninstalled = " ",
                    },
                },

                max_concurrent_installers = 10,
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        },
        config = function()
            require("config.lspconfig").defaults()
        end,
    },
    {
        "Aasim-A/scrollEOF.nvim",
        event = { "CursorMoved", "WinScrolled" },
        -- lazy = false,
        opts = {},
        config = function()
            require("scrollEOF").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
    },
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },

        version = "1.*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "enter" },
            snippets = { preset = "default" },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = { auto_show = false },
                ghost_text = {
                    enabled = true,
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        name = "LSP",
                        min_keyword_length = 2,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },

    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
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
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
            size = 40,
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
    },
}
