return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				skip_confirm_for_simple_edits = true,
				watch_for_changes = true,
				view_options = {
					show_hidden = true,
					case_insensitive = true,
				},
				keymaps = {
					["<CR>"] = "actions.select",
					["<C-p>"] = "actions.preview",
				},
				confirmation = {
					border = "rounded",
				},
				use_default_keymaps = false,
			})
		end,
	},
}
