vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Fungsi untuk mengubah warna kursor terminal
local function set_cursor_color(color)
	io.write(string.format("\27]12;%s\7", color))
	io.flush()
end

-- Saat masuk mode insert → biru
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:i",
	callback = function()
		set_cursor_color("deepskyblue")
	end,
})

-- Saat keluar dari insert (kembali normal) → putih
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "i:*",
	callback = function()
		set_cursor_color("deepskyblue")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"qf",
		"lspinfo",
		"checkhealth",
		"man",
		"git",
		"NvimTree", -- contoh sidebar
		"neotest",
	},
	callback = function()
		vim.keymap.set("n", "q", "<C-w>q", { buffer = true, silent = true })
	end,
})
