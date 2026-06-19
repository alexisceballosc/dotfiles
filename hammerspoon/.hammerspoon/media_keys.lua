local SPOTIFY = "com.spotify.client"

local actions = {
	PLAY = hs.spotify.playpause,
	NEXT = hs.spotify.next,
	FAST = hs.spotify.next,
	PREVIOUS = hs.spotify.previous,
	REWIND = hs.spotify.previous,
}

local function audioBusy()
	local out = hs.audiodevice.defaultOutputDevice()
	return out ~= nil and out:inUse()
end

local tap = hs.eventtap.new({ hs.eventtap.event.types.systemDefined }, function(event)
	local key = event:systemKey()
	local action = key and actions[key.key]
	if not action then
		return false
	end

	if hs.application.get(SPOTIFY) then
		if key.down and not key["repeat"] then
			action()
		end
		return true
	end

	if key.key == "PLAY" and not audioBusy() then
		return true
	end

	return false
end)
tap:start()

return tap
