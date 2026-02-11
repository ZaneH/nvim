require("nvim-devdocs").setup({
	previewer_cmd = "glow",
	cmd_args = { "-s", "dark", "-w", "100" },
	picker_cmd = true,
	picker_cmd_args = { "-s", "dark", "-w", "80" },
})

vim.keymap.set("n", "<leader>hd", "<cmd>DevdocsOpenCurrent<cr>", { desc = "Devdocs current" })
vim.keymap.set("n", "<leader>hD", "<cmd>DevdocsOpen<cr>", { desc = "Devdocs choose" })
vim.keymap.set("n", "<leader>hI", "<cmd>DevdocsInstall<cr>", { desc = "Devdocs install" })
