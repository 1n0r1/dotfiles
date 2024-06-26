local awful = require("awful")
local watch = awful.widget.watch
local wibox = require("wibox")

return function()
	local player = wibox.widget({
		{
			id = "icon",
			text = "",
			align = "center",
			valign = "center",
			widget = wibox.widget.textbox,
		},
		layout = wibox.layout.flex.horizontal,
	})
    local widget = wibox.widget({
        player,
		widget = wibox.container.background
    })

	watch(
		[[sh -c "playerctl metadata --format \"{{ trunc(artist, 20) }} - {{ trunc(title, 50) }}\""]],
		5,
		function(_, stdout)
            player.icon:set_text(stdout)
		end
	)

	return widget
end

