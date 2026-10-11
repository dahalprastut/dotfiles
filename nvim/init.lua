require("core.options")
require("core.keymaps")

vim.pack.add({
	-- theme
	"https://github.com/AlexvZyl/nordic.nvim",
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
	-- bufferline
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/moll/vim-bbye",
	-- lualine for statusline
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("plugins.colortheme")
require("plugins.neotree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.autocompletion")
require("plugins.autoformatting")
require("plugins.gitsigns")
require("plugins.alpha")
