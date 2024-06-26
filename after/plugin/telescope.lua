local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ hidden = true })
end, {})

vim.keymap.set('n', '<leader>fg', function()
    builtin.git_files({ hidden = true })
end, {})

vim.keymap.set('n', '<leader>gp', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
