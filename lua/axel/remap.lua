vim.keymap.set('n', "<leader>e", ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><Esc>', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><Esc><Esc>', ':q!<CR>', { noremap = true, silent = true })

-- for easy indentation
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("n", "<Tab>", "v><C-\\><C-N>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<S-Tab>", "v<<C-\\><C-N>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- splitting windows
vim.keymap.set("n", "<leader>vp", ':vsp<CR>')
vim.keymap.set("n", "@", '<C-w>l')
vim.keymap.set("n", "!", '<C-w>h')

vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>a", "ggVG\"+y")

vim.keymap.set('v', '<leader>r', function()
    -- Save the visually selected text to a variable
    local saved_reg = vim.fn.getreg('"')     -- Save the current unnamed register
    vim.cmd('normal! y')                     -- Yank the visually selected text
    local selected_text = vim.fn.getreg('"') -- Get the yanked text
    vim.fn.setreg('"', saved_reg)            -- Restore the unnamed register

    -- Escape special characters in the selected text
    selected_text = vim.fn.escape(selected_text, '\\/')

    -- Prompt for replacement text
    local replacement = vim.fn.input('Replace with: ')

    -- Perform the global search and replace
    vim.cmd('%s/\\V' .. selected_text .. '/' .. replacement .. '/g')

    -- Clear the command-line prompt
    vim.cmd('redraw!')
end, { silent = true })
