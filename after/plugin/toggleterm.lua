local toggleterm = require("toggleterm")

toggleterm.setup()

vim.keymap.set("n", "<leader>ot", function()
	toggleterm.toggle()
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
