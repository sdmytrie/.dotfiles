local config = {

	-- Set colorscheme
	colorscheme = "onedark",

	-- Add plugins
	plugins = {
		-- { "andweeb/presence.nvim" },
		-- {
		-- "ray-x/lsp_signature.nvim",
		-- event = "BufRead",
		-- config = function()
		-- require("lsp_signature").setup()
		-- end,
		-- },
		{ "preservim/tagbar" },
		{
			"vimwiki/vimwiki",
			config = function()
				vim.g["vimwiki_list"] = {
					{
						template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
						syntax = "markdown",
						ext = ".md",
					},
				}
				vim.g["vimwiki_global_ext"] = 0
			end,
		},
		{ "mhinz/vim-startify" },
	},

	overrides = {
		treesitter = {
			ensure_installed = { "lua" },
		},
	},

	-- On/off virtual diagnostics text
	virtual_text = true,

	-- Disable default plugins
	enabled = {
		bufferline = true,
		nvim_tree = true,
		lualine = true,
		lspsaga = true,
		gitsigns = true,
		colorizer = true,
		toggle_term = true,
		comment = true,
		symbols_outline = true,
		indent_blankline = true,
		dashboard = false,
		which_key = true,
		neoscroll = true,
		ts_rainbow = true,
		ts_autotag = true,
	},

	packer_file = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",

	polish = function()
		local opts = { noremap = true, silent = true }
		local map = vim.api.nvim_set_keymap
		local set = vim.opt
		-- Set options
		set.relativenumber = true

		-- Set key bindings
		map("n", "<C-s>", ":w!<CR>", opts)
		map("n", "<F8>", "<cmd>TagbarToggle<CR>", opts)

		-- Set autocommands
		vim.cmd([[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]])
	end,
}

return config
