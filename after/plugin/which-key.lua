require("which-key").setup({
	preset = "modern",
})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end)

vim.keymap.set("n", "<leader>p", "<nop>", { desc = "project" })
vim.keymap.set("n", "<leader>s", "<nop>", { desc = "search" })
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "window" })
vim.keymap.set("n", "<leader>d", "<nop>", { desc = "debug" })
vim.keymap.set("n", "<leader>g", "<nop>", { desc = "git" })
vim.keymap.set("n", "<leader>l", "<nop>", { desc = "lsp" })
vim.keymap.set("n", "<leader>t", "<nop>", { desc = "toggle" })
vim.keymap.set("n", "<leader>q", "<nop>", { desc = "quit/session" })
vim.keymap.set("n", "<leader>h", "<nop>", { desc = "help" })
vim.keymap.set("n", "<leader>x", "<nop>", { desc = "trouble" })
