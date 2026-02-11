require("gitsigns").setup()

vim.keymap.set("n", "<leader>g", "<nop>", { desc = "git" })
vim.keymap.set("n", "<leader>gs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gS", require("gitsigns").stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gR", require("gitsigns").reset_buffer, { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, { desc = "Blame line" })
