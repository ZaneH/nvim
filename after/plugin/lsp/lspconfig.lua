--
-- Neovim 0.11+ LSP config (vim.lsp.config + vim.lsp.enable)
--

-- 1) Keymaps on attach (replacement for lsp_zero's lsp_attach)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
	callback = function(ev)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "LSP Hover")
		map("n", "gd", require("telescope.builtin").lsp_definitions, "LSP Goto Definition")
		map("n", "gD", vim.lsp.buf.declaration, "LSP Goto Declaration")
		map("n", "gi", vim.lsp.buf.implementation, "LSP Goto Implementation")
		map("n", "go", vim.lsp.buf.type_definition, "LSP Goto Type Definition")
		map("n", "gr", require("telescope.builtin").lsp_references, "LSP References")
		map("n", "gs", vim.lsp.buf.signature_help, "LSP Signature Help")
		map("n", "<leader>cr", vim.lsp.buf.rename, "LSP Rename")
		map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
		map("n", "<leader>cd", vim.diagnostic.open_float, "LSP Line Diagnostics")
		map("n", "<leader>cq", vim.diagnostic.setloclist, "LSP Diagnostics to Loclist")
		map({ "n", "x" }, "<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, "LSP Format")
		map("n", "<F4>", vim.lsp.buf.code_action, "LSP Code Action")
		map("n", "<leader>ch", function()
			local ok, enabled = pcall(vim.lsp.inlay_hint.is_enabled, { bufnr = ev.buf })
			if not ok then
				ok, enabled = pcall(vim.lsp.inlay_hint.is_enabled, ev.buf)
			end
			if ok then
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
			end
		end, "LSP Toggle Inlay Hints")
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
