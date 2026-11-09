local BUNDLE_ID = "app.monitorcontrol.MonitorControl"
local DEBOUNCE_SECONDS = 2

local function hasExternalDisplay()
	return #hs.screen.allScreens() > 1
end

local function sync()
	local app = hs.application.get(BUNDLE_ID)
	if hasExternalDisplay() then
		if not app then
			hs.application.open(BUNDLE_ID)
		end
	else
		if app then
			app:kill()
		end
	end
end

local debounce = nil
local watcher = hs.screen.watcher.new(function()
	if debounce then
		debounce:stop()
	end
	debounce = hs.timer.doAfter(DEBOUNCE_SECONDS, sync)
end)
watcher:start()

sync()

return watcher
