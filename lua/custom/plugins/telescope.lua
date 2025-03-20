return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55 },
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		if vim.fn.executable("git") == 1 then
			vim.keymap.set("n", "<leader>gb", function()
				builtin.git_branches({ use_file_path = true })
			end, { desc = "Find [g]it [b]ranches" })
		end
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "[f]ind all [F]iles" })

		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })

		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[f]ind word under [c]ursor" })

		vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "[f]ind [r]registers" })

		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[s]earch [n]eovim files" })

		if vim.fn.executable("rg") == 1 then
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[f]ind [w]ords" })

			vim.keymap.set("n", "<leader>fW", function()
				builtin.live_grep({
					additional_args = function(args)
						return vim.list_extend(args, { "--hidden", "--no-ignore" })
					end,
				})
			end, { desc = "[f]ind [W]ords in all files" })
		end
	end,
}
