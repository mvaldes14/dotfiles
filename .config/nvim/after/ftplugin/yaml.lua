local path = vim.fn.getcwd()

if string.match(path, "ansible") then
	vim.opt_local.filetype = "ansible"
end
