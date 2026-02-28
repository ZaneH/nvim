local toggleterm = require("toggleterm")

toggleterm.setup({
	start_in_insert = false,
})

vim.keymap.set("n", "<leader>ot", function()
	toggleterm.toggle()
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
