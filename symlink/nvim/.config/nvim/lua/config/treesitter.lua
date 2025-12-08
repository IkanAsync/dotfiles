local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
    ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "go",
        "gowork",
        "gosum",
        "rust",
        "html",
        "css",
        "nix",
        "javascript",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}
