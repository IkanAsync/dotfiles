local map = vim.keymap.set
-- telescope
require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "__pycache__/",
            "__init__.py",
            "node_modules/",
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
}

map("n", "<leader>fd", ":Telescope diagnostics<CR>", { silent = true, noremap = true })
map("n", "<leader>fs", ":Telescope aerial<CR>", { silent = true, noremap = true })
