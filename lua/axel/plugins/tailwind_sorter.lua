return {
    {
        'laytan/tailwind-sorter.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim'
        },
        build = function()
            vim.fn.system('cd formatter && npm install && npm run build')
        end,
        config = function()
            require('tailwind-sorter').setup()
            -- Plugin-specific configuration
        end,
    },
}
