return {
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
                        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
            },
        },
    },
    keys = {
        { "<leader>e", ":Oil --preview<CR>", desc = "Oil" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
