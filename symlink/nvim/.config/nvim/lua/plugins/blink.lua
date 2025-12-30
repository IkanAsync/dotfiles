return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        signature = {
            enabled = true,
            trigger = {
                enabled = true,
            },
        },
        keymap = {
            preset = "enter",
        },
        snippets = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = { auto_show = true },
            trigger = {
                show_on_insert_on_trigger_character = false,
                show_on_accept_on_trigger_character = false,
            },
            ghost_text = {
                enabled = false,
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
