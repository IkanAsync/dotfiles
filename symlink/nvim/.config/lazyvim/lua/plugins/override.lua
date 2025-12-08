return {
    {
        "snacks.nvim",
        opts = {
            indent = { enabled = false },
            explorer = { enabled = false },
            dashboard = {
                enabled = true,
                sections = {
                    {
                        section = "terminal",
                        align = "center",
                        height = 26,
                        width = 72,
                        padding = 1,
                        cmd = "lolcat --seed=40 ~/.config/nvim/static/frieren.cat",
                    },
                    {
                        align = "center",
                        padding = 1,
                        text = {
                            { "  Update ", hl = "Label" },
                            { "  Sessions ", hl = "@property" },
                            { "  Last Session ", hl = "Number" },
                            { "  Files ", hl = "DiagnosticInfo" },
                            { "  Recent ", hl = "@string" },
                        },
                    },
                    { text = { "==============================================================" } },
                    {
                        section = "keys",
                        indent = 1,
                        align = "center",
                        gap = 0.5,
                        padding = 1,
                    },

                    { text = { "===============================================================" } },
                    height = 60,
                },
            },
        },
    },
    {
        "folke/flash.nvim",
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
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    mason = false,
                    cmd = { "/usr/bin/lua-language-server" },
                },
                nixd = {
                    mason = false,
                    cmd = { "nixd" },
                },
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "__pycache__/",
                    "__init__.py",
                    "node_modules/",
                    ".zig-cache/*",
                },
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                    i = {
                        ["<Tab>"] = require("telescope.actions").move_selection_next,
                        ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
                        ["<Esc>"] = require("telescope.actions").close,
                    },
                },
            },

            extensions_list = { "themes", "terms" },
            extensions = {
                aerial = {
                    col1_width = 4,
                    col2_width = 30,
                    format_symbol = function(symbol_path, filetype)
                        if filetype == "json" or filetype == "yaml" then
                            return table.concat(symbol_path, ".")
                        else
                            return symbol_path[#symbol_path]
                        end
                    end,
                    show_columns = "both",
                },
            },
        },
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
}
