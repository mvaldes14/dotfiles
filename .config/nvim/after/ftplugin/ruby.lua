local path = vim.fn.getcwd()

if string.match(path, "chef") then
	vim.bo.filetype = "chef"
end
