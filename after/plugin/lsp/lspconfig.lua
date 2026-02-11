--
-- Neovim 0.11+ LSP config (vim.lsp.config + vim.lsp.enable)
--

-- 1) Keymaps on attach (replacement for lsp_zero's lsp_attach)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set({ "n", "x" }, "<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
	end,
})

-- 2) Capabilities (cmp-nvim-lsp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 3) Server configs
-- Note: Nvim 0.11 uses "root_markers" instead of lspconfig's root_dir.
vim.lsp.config("gopls", { capabilities = capabilities })
vim.lsp.config("ts_ls", { capabilities = capabilities })
vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.config("cssls", { capabilities = capabilities })
vim.lsp.config("bashls", { capabilities = capabilities })
vim.lsp.config("ocamllsp", { capabilities = capabilities })
vim.lsp.config("clangd", { capabilities = capabilities })

vim.lsp.config("sqls", {
	capabilities = capabilities,
	on_attach = function(client)
		-- keep your existing formatting workaround
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

-- 4) Enable servers
vim.lsp.enable({
	"gopls",
	"ts_ls",
	"lua_ls",
	"cssls",
	"sqls",
	"bashls",
	"ocamllsp",
	"clangd",
})
