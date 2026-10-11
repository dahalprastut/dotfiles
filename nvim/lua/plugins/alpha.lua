-- Dashboard / start screen
do
	local function gh(repo)
		return "https://github.com/" .. repo
	end

	vim.pack.add({
		gh("goolord/alpha-nvim"),
		gh("nvim-tree/nvim-web-devicons"), -- dependency (already added in init.lua, harmless to repeat)
	})

	local alpha = require("alpha")
	local dashboard = require("alpha.themes.startify")

	dashboard.section.header.val = {
		[[                                                    ]],
		[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
		[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
		[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
		[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
		[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
		[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		[[                                                    ]],
	}

	alpha.setup(dashboard.opts)
end
