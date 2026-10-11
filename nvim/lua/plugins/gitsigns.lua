-- Adds git related signs to the gutter, as well as utilities for managing changes
do
	local function gh(repo)
		return "https://github.com/" .. repo
	end

	vim.pack.add({ gh("lewis6991/gitsigns.nvim") })

	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	})
end
