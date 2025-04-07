return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		-- A list of parser names, or "all"
		ensure_installed = {
			"c",
			"lua",
			"typescript",
			"javascript",
			"tsx",
			"html",
			"css",
			"scss",
			"svelte",
			"go",
			"json",
			"jsdoc",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
		},
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		highlight = {
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = { "markdown" },
		},
	},
}
