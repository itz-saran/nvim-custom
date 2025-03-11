return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "harpoon add current file" })
		vim.keymap.set("n", "<leader>ht", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "harpoon toggle ui" })

		vim.keymap.set("n", "<leader>hq", function()
			harpoon:list():select(1)
		end, { desc = "harpoon select item [1]" })
		vim.keymap.set("n", "<leader>hw", function()
			harpoon:list():select(2)
		end, { desc = "harpoon select item [2]" })
		vim.keymap.set("n", "<leader>he", function()
			harpoon:list():select(3)
		end, { desc = "harpoon select item [3]" })
		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():select(4)
		end, { desc = "harpoon select item [4]" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():prev()
		end, { desc = "harpoon list prev" })
		vim.keymap.set("n", "<leader>hy", function()
			harpoon:list():next()
		end, { desc = "harpoon list next" })
	end,
}
