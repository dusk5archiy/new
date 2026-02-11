if vim.g.vscode then
	vim.opt.clipboard = "unnamedplus"
	return
end

local CUSTOM_NVIM_CONFIG_DIR = os.getenv("CUSTOM_NVIM_CONFIG_DIR")

if CUSTOM_NVIM_CONFIG_DIR then
	package.path = package.path .. ";" .. CUSTOM_NVIM_CONFIG_DIR .. "/lua/?.lua"
	require("config.lazy")
end
