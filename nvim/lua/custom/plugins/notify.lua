local present, notify = pcall(require, "notify")

if not present then
	return
end

local options = {
	background_colour = "#aaaaaa",
}

notify.setup(options)

-- notify("Welcome to my world", "success", { background_colour = "#000000", title = "System" })
