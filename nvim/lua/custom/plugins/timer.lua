local Popup = require "nui.popup"
local Timer = Popup:extend "Timer"

function Timer:init(popup_options)
  local options = vim.tbl_deep_extend("force", popup_options or {}, {
    focusable = false,
    position = { row = "93%", col = "100%" },
    size = { width = 10, height = 1 },

    border = {
      style = "rounded",
      text = {
        top = "TIMER",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })

  Timer.super.init(self, options)
end

function SecondsToClock(_seconds)
  local seconds = tonumber(_seconds)

  if seconds <= 0 then
    return "00:00:00"
  else
    hours = string.format("%02.f", math.floor(seconds / 3600))
    mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
    secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))
    return hours .. ":" .. mins .. ":" .. secs
  end
end
function Timer:timerCount(time, step, format)
  local function draw_content(text)
    local gap_width = 10 - vim.api.nvim_strwidth(text)
    vim.api.nvim_buf_set_lines(self.bufnr, 0, -1, false, {
      string.format(
        "%s%s%s",
        string.rep(" ", math.floor(gap_width / 2)),
        text,
        string.rep(" ", math.ceil(gap_width / 2))
      ),
    })
  end

  self:mount()

  local Time = time

  draw_content(SecondsToClock(time))
  vim.fn.timer_start(1000, function()
    Time = Time + 1
    draw_content(SecondsToClock(Time))
    -- notify "asdasd"
  end, { ["repeat"] = -1 })
end

local timer = Timer()

timer:timerCount(0, 1000, function()
  return tostring(0)
end)
