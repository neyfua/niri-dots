local opts = { noremap = true, silent = true }
local modes = { "n", "i", "v" }
-- Oil
vim.keymap.set("n", "<leader>w", vim.cmd.Oil)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Bufferline
vim.keymap.set("n", "<A-q>", vim.cmd.bdelete, opts)
vim.keymap.set("n", "<leader>bc", vim.cmd.BufferLineCloseOthers, opts)

vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext, opts)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev, opts)

vim.keymap.set("n", "<A-p>", vim.cmd.BufferLineTogglePin, opts)

vim.keymap.set("n", "<A-]>", vim.cmd.BufferLineMoveNext, opts)
vim.keymap.set("n", "<A-[>", vim.cmd.BufferLineMovePrev, opts)

-- Comment.nvim
local toggle, comment = pcall(require, "Comment.api")
if not toggle then
	return
end

vim.keymap.set("n", "<leader>/", comment.toggle.linewise.current, opts)
vim.keymap.set("v", "<leader>/", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
	comment.toggle.linewise(vim.fn.visualmode())
end)

-- FTerm
local fterm = require("FTerm")

vim.keymap.set("n", "<A-`>", function()
	fterm.toggle()
	vim.defer_fn(function()
		local bufnr = vim.api.nvim_get_current_buf()
		if vim.bo[bufnr].buftype == "terminal" then
			vim.keymap.set("n", "<C-x>", "i", vim.tbl_extend("force", opts, { buffer = bufnr }))
			vim.keymap.set("n", "<Esc>", function()
				fterm.toggle()
			end, vim.tbl_extend("force", opts, { buffer = bufnr }))
			vim.keymap.set("n", "q", function()
				fterm.toggle()
			end, vim.tbl_extend("force", opts, { buffer = bufnr }))
		end
	end, 10)
end, opts)

vim.keymap.set("t", "<C-x>", function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true), "n", false)
	vim.keymap.set("n", "<C-x>", "i", vim.tbl_extend("force", opts, { buffer = bufnr }))
	vim.keymap.set("n", "<Esc>", function()
		fterm.toggle()
	end, vim.tbl_extend("force", opts, { buffer = bufnr }))
end, opts)

vim.keymap.set("t", "<Esc>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true), "n", false)
	fterm.toggle()
end, opts)

-- Search & Replace
vim.api.nvim_set_keymap("v", "<leader>r", "<cmd>SearchReplaceWithinVisualSelection<CR>", opts)

-- Disable PageUp/PageDown keys
for _, mode in ipairs(modes) do
	vim.keymap.set(mode, "<PageUp>", "<Nop>")
	vim.keymap.set(mode, "<PageDown>", "<Nop>")
	vim.keymap.set(mode, "<S-PageUp>", "<Nop>")
	vim.keymap.set(mode, "<S-PageDown>", "<Nop>")
end

-- Fast deleting
vim.keymap.set("o", "f", "0", opts)
vim.keymap.set("n", "df", "d0", opts)

-- Disable F1
vim.keymap.set({ "n", "i", "v", "o" }, "<F1>", "<Nop>", opts)

-- Clear highlight search
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)
