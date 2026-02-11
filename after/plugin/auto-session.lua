require("auto-session").setup({
	auto_restore_enabled = true,
	auto_save_enabled = true,
	auto_session_suppress_dirs = {
		"~/",
		"~/Downloads",
		"~/Desktop",
	},
})

vim.keymap.set("n", "<leader>a", "<nop>", { desc = "activities" })
vim.keymap.set("n", "<leader>aa", "<cmd>AutoSession search<cr>", { desc = "Activities" })
vim.keymap.set("n", "<leader>as", "<cmd>AutoSession save<cr>", { desc = "Save activity" })
vim.keymap.set("n", "<leader>ad", "<cmd>AutoSession delete<cr>", { desc = "Delete activity" })
vim.keymap.set("n", "<leader>at", "<cmd>AutoSession toggle<cr>", { desc = "Toggle autosave" })
