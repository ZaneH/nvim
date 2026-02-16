local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	defaults = { lazy = false },
	{ "nvim-lua/plenary.nvim" },

	-- Cosmetic
	-- { "folke/tokyonight.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "typicode/bg.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	{ "stevearc/dressing.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "onsails/lspkind.nvim" },

	-- Completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "David-Kunz/cmp-npm", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Testing & Debugging
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	},
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "folke/trouble.nvim" },

	-- Utility
	{ "folke/which-key.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "stevearc/oil.nvim" },
	{ "smjonas/inc-rename.nvim" },
	{ "stevearc/conform.nvim" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "kylechui/nvim-surround" },
	{ "numToStr/Comment.nvim" },
	{ "folke/zen-mode.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-mini/mini.nvim" },
	{ "kristijanhusak/vim-dadbod-ui", dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" } },
	{ "jake-stewart/multicursor.nvim", branch = "1.0" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"nvim-orgmode/orgmode",
		ft = { "org" },
		config = function()
			require("orgmode").setup({
				org_agenda_files = { "~/repos/org/**/*" },
				org_default_notes_file = "~/repos/org/notes.org",
			})
			vim.lsp.enable("org")
		end,
	},
	{
		"Aasim-A/scrollEOF.nvim",
		event = { "CursorMoved", "WinScrolled" },
		opts = {},
	},

	-- Navigation
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "https://codeberg.org/andyg/leap.nvim" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "debugloop/telescope-undo.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "rmagatti/auto-session", dependencies = { "nvim-telescope/telescope.nvim" } },
	{
		"warpaint9299/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"nvim-mini/mini.pick", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},

	-- Snippets
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Language Specific
	{ "ray-x/go.nvim" },
})
