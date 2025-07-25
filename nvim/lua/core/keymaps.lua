-- leading key is space
vim.g.mapleader = " "

local keymap = vim.keymap

-- insert mode
keymap.set("i", "jk", "<ESC>")

-- visual mode
-- shift + i and shift + k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- normal node
-- new split window
keymap.set("n", "<leader>sv", "<C-w>v") -- horizontal
keymap.set("n", "<leader>sh", "<C-w>s") -- virtical


-- search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- change bufferline
keymap.set("n", "<leader>bn", ":bnext<CR>")
keymap.set("n", "<leader>bv", ":bprevious<CR>")
keymap.set('n', '<leader>bco', '<Cmd>BufferLineCloseOthers<CR>')

-- Lsp
keymap.set('n', 'gd', vim.lsp.buf.definition)
keymap.set('n', 'gD', vim.lsp.buf.declaration)
keymap.set('n', 'gi', vim.lsp.buf.implementation)
keymap.set('n', 'gr', vim.lsp.buf.references)

-- diagnostic
keymap.set('n', '<leader>ed', vim.diagnostic.open_float)
keymap.set('n', '<leader>ea', vim.diagnostic.setloclist)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)

-- copilot
vim.g.copilot_no_tab_map = true
keymap.set('i', '<M-Tab>', 'copilot#Accept("\\<CR>")', {expr = true, replace_keycodes = false})
