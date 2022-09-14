local Input = require "nui.input"
local event = require("nui.utils.autocmd").event
local notify = require "notify"

local function replace(found, _replace)
  local command = string.format("%s/%s/%s/g", "%s", found, _replace)
  vim.api.nvim_command(command)
end
local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end
local function replaceInput(found)
  local input = Input({
    position = "50%",
    size = {
      width = 20,
    },
    border = {
      style = "rounded",
      text = {
        top = "Replace",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "> ",
    default_value = "",
    on_close = function() end,
    on_submit = function(value)
      if pcall(replace, found, value) then
        local message = string.format("%s replaced with %s", found, value)
        vim.api.nvim_command "set hlsearch!"
        notify(message, "success", { title = "Find and replace" })
      else
        notify("Not found text to replace", "error", { title = "Find and replace" })
      end
    end,
  })

  input:mount()
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

local function findInput()
  local input = Input({
    position = "50%",
    size = {
      width = 20,
    },
    border = {
      style = "rounded",
      text = {
        top = "FIND",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = " ",
    default_value = "",
    on_close = function() end,
    on_submit = function(value)
      if trim(value) ~= "" then
        replaceInput(value)
      end
    end,
  })
  input:mount()

  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

return {
  findInput = findInput,
}
