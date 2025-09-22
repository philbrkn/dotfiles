return {
    "folke/tokyonight.nvim",
    -- lazy = false,
    priority = 1000,
    -- opts = {},
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('tokyonight').setup {
            styles = {
                comments = { italic = false }, -- Disable italics in comments
            },
        }

        -- Load the colorscheme here.
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
