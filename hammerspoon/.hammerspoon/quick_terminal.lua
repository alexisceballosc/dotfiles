local GHOSTTY = "com.mitchellh.ghostty"

local PADDING = 0.025
local BIG_WIDTH = 0.55
local BIG_HEIGHT = 0.80

local pendingShow = nil

local function span(dim)
	local lo, hi = math.huge, -math.huge
	for _, s in ipairs(hs.screen.allScreens()) do
		local v = s:frame()[dim]
		lo, hi = math.min(lo, v), math.max(hi, v)
	end
	return lo, hi
end

local function blend(x, x0, x1, y0, y1)
	if x1 <= x0 then
		return y0
	end
	local t = math.max(0, math.min(1, (x - x0) / (x1 - x0)))
	return y0 + t * (y1 - y0)
end

local function layoutFor(screen)
	local f = screen:frame()
	local maxCover = 1 - 2 * PADDING
	local loW, hiW = span("w")
	local loH, hiH = span("h")
	local w = f.w * blend(f.w, loW, hiW, maxCover, BIG_WIDTH)
	local h = f.h * blend(f.h, loH, hiH, maxCover, BIG_HEIGHT)
	return hs.geometry.rect(f.x + (f.w - w) / 2, f.y + f.h - h - f.h * PADDING, w, h)
end

local function floatOnTop(app)
	local float = app:findMenuItem({ "Window", "Float on Top" })
	if float and not float.ticked then
		app:selectMenuItem({ "Window", "Float on Top" })
	end
end

local function show(app)
	local win = app:mainWindow()
	if win then
		pcall(hs.spaces.moveWindowToSpace, win, hs.spaces.focusedSpace())
		local screen = hs.mouse.getCurrentScreen()
		if win:screen():id() ~= screen:id() then
			win:moveToScreen(screen, false, true, 0)
		end
		win:setFrame(layoutFor(screen), 0)
	end
	app:activate()
	floatOnTop(app)
end

local function showWhenReady()
	pendingShow = hs.timer.waitUntil(function()
		local app = hs.application.get(GHOSTTY)
		return app and app:mainWindow() ~= nil
	end, function()
		show(hs.application.get(GHOSTTY))
		pendingShow = nil
	end, 0.05)
end

hs.hotkey.bind({ "cmd" }, "`", function()
	local app = hs.application.get(GHOSTTY)

	if not app then
		hs.application.launchOrFocusByBundleID(GHOSTTY)
		showWhenReady()
		return
	end

	local win = app:mainWindow()
	if not win then
		app:selectMenuItem({ "File", "New Window" })
		showWhenReady()
		return
	end

	if win:isVisible() then
		app:hide()
	else
		show(app)
	end
end)
