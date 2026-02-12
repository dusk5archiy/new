if vim.g.vscode then
	vim.opt.clipboard = "unnamedplus"
	return
end

local W_CUSTOM_NVIM_CONFIG_DIR = os.getenv("W_CUSTOM_NVIM_CONFIG_DIR")

if W_CUSTOM_NVIM_CONFIG_DIR then
	package.path = package.path .. ";" .. W_CUSTOM_NVIM_CONFIG_DIR .. "\\lua\\?.lua"
	require("config.lazy")
end
