local present, twilight = pcall(require, "twilight")

if not present then
  return
end

twilight.setup {}
-- vim.api.nvim_command "autocmd BufEnter * TwilightEnable"
