local opts = { noremap = true, silent = true }

-- Use "jk" in insert mode to enter Normal mode
vim.keymap.set("i", "jk", "<Esc>")

-- Save with <Space>w
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write file" })

-- Jump vim panels with hjkl
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window management
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "window" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split below" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split right" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Balance windows" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Window right" })

-- Show diagnostics
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, opts)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end, opts)

vim.keymap.set("n", "<leader>q", "<nop>", { desc = "quit" })
vim.keymap.set("n", "<leader>qq", ":qa<cr>", { desc = "Quit nvim" })
