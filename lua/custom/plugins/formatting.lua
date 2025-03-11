return {
	-- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
        mode = "n",
        desc = "lsp format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
}
