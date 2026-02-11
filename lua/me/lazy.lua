local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	defaults = { lazy = false },
	{ "nvim-lua/plenary.nvim" },

	-- Cosmetic
	{ "folke/tokyonight.nvim" },
	{ "typicode/bg.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	{ "stevearc/dressing.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "onsails/lspkind.nvim" },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "debugloop/telescope-undo.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "David-Kunz/cmp-npm", dependencies = { "nvim-lua/plenary.nvim" } },

	{ "nvim-neotest/neotest", dependencies = { "nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },

	{ "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

	{ "https://codeberg.org/andyg/leap.nvim" },
	{ "folke/which-key.nvim" },
	{ "stevearc/conform.nvim" },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},

	{ "folke/trouble.nvim" },
	{ "ray-x/go.nvim" },
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "folke/zen-mode.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "kylechui/nvim-surround" },
	{ "numToStr/Comment.nvim" },
	{ "rmagatti/auto-session", dependencies = { "nvim-telescope/telescope.nvim" } },
	{
		"warpaint9299/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Snippets
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "saadparwaiz1/cmp_luasnip" },

	{ "stevearc/oil.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "epwalsh/obsidian.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "smjonas/inc-rename.nvim" },
	{ "echasnovski/mini.nvim" },
	{ "kristijanhusak/vim-dadbod-ui", dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" } },

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
})
