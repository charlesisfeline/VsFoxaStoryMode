--[[
	SimplifiedWindow.lua
	Created by Raltyro
	
	THIS IS NOT AN EVENTS SCRIPT
	THIS IS FOR ANYONE WHO HAD A LITTLE BIT OF CODING KNOWLEDGE
	
	screenWidth = getWindowProperty("display.currentMode.width")
	screenHeight = getWindowProperty("display.currentMode.height")
	
	API Documentation [
		
		screenWidth:int (read only)
		--	Width Size of Current Display
		
		screenHeight:int (read only)
		--	Height Size of Current Display
		
		window.x:int
		--	X Position of Current Window
		
		window.y:int
		--	Y Position of Current Window
		
		window.forcePos:boolean
		--	Force Current Window Positions to Current Positions
		
		window.width:int
		--	Width Size of Current Window
		
		window.height:int
		--	Height Size of Current Window
		
		window.forceSize:boolean
		--	Force Current Window Sizes to Current Sizes
		
		window.title:string
		--	Title of Current Window
		
		window.borderless:boolean
		--	Border of Current Window
			Hides the border of Current Window
		
		window.fullscreen:boolean
		--	Display Mode of Current Window
			Fills the entire Screen with Game Display
			(MAXIMIZED AND FULLSCREEN ARE DIFFERENT)
		
		window.maximized:boolean
		--	Window Display Mode of Current Window
			Fills the entire Desktop with Game Display
			(MAXIMIZED AND FULLSCREEN ARE DIFFERENT)
		
		window.fps:float
		--	Framerate of Current Window
		
	]
	
	Example [
		
		```lua -- Changes the Window Position to Game Camera Position
		function onCreatePost()
			initializeWindow()
			resetWindow()
		end
		
		function onDestroy()
			resetWindow()
		end
		
		function onUpdatePost(dt)
			window.forcePos = true
			window.x = ((screenWidth / 2) - (window.width / 2)) + ((getProperty("camFollowPos.x") - 1222))
			window.y = ((screenHeight / 2) - (window.height / 2)) + ((getProperty("camFollowPos.y") - 478))
			
			updateWindow(dt)
		end
		```
		
		```lua -- Changes the Window Position to be around the center of the screen with Trigonometry functions
		function onCreatePost()
			initializeWindow()
			resetWindow()
		end
		
		function onDestroy()
			resetWindow()
		end
		
		function onUpdatePost(dt)
			local v = getPropertyFromClass("Conductor", "songPosition") / 1000 * (curBpm/60*math.pi*2/4)
			
			window.forcePos = true
			window.x = ((screenWidth / 2) - (window.width / 2)) + (math.cos(v) * window.height / 8)
			window.y = ((screenHeight / 2) - (window.height / 2)) + (math.sin(v) * window.height / 8)
			
			updateWindow(dt)
		end
		```
		
	]
--]]

--[[ WINDOW ]]--
local tableCopy
function tableCopy(t,st,copyMeta,x)
	x = x or 0
	getfenv().things = getfenv().things or {}
	local things = getfenv().things
	if (things[t] ~= nil) then return things[t] end

	st = st or {}
	
	if (copyMeta) then
		local meta = getmetatable(t)
		if (meta == "table") then
			setmetatable(st, meta)
		end
	end
	
	things[t] = st
	
	for i,v in pairs(t) do
		st[i] = type(v) == "table" and tableCopy(v,{},copyMeta,x + 1) or v
	end
	if (x <= 0) then getfenv().things = {} end
	return st
end

function setWindowProperty(p, v)
	setPropertyFromClass("lime.app.Application","current.window." .. p, v)
end

function getWindowProperty(p)
	return getPropertyFromClass("lime.app.Application","current.window." .. p)
end

local templateWindow = setmetatable(
	{
		x = 0,
		y = 0,
		
		width = 0,
		height = 0,
		
		fullscreen = false,
		borderless = false,
		fps = 0,
		
		title = "",
		
		forcePos = false,
		forceSize = false
	},
	{
		__index = function(t, i)
			if (i == "mouseLock") then
				return getWindowProperty("mouseLock")
			elseif (i == "maximized") then
				return getWindowProperty("maximized")
			elseif (i == "fps") then
				return getWindowProperty("frameRate")
			elseif (i == "fullscreen") then
				return getWindowProperty("fullscreen")
			end
			return rawget(t, i)
		end,
		__newindex = function(t, i, v)
			if (i == "mouseLock") then
				setWindowProperty("mouseLock", v)
			elseif (i == "maximized") then
				setWindowProperty("maximized", v)
				if (not v) then
					setWindowProperty("minimized", v)
				end
			elseif (i == "fps") then
				setWindowProperty("frameRate", v)
			elseif (i == "fullscreen") then
				setWindowProperty("fullscreen", v)
			else
				rawset(t, i, v)
			end
		end
	}
)

local defaultWindow

local windowDeltaUpdateCap, windowUpdateTime = 0, math.huge

local window = tableCopy(templateWindow, nil, true)
window.isReady = false

screenWidth = 0
screenHeight = 0

function initializeWindow()
	screenWidth = getWindowProperty("display.currentMode.width")
	screenHeight = getWindowProperty("display.currentMode.height")
	
	window.x = getWindowProperty("__x")
	window.y = getWindowProperty("__y")
	
	window.width = getWindowProperty("__width")
	window.height = getWindowProperty("__height")
	
	window.borderless = getWindowProperty("__borderless")
	window.title = getWindowProperty("title")
	window.title = window.title == nil or window.title == "" and "Friday Night Funkin': Vs. Foxa [Story Mode]" or window.title
	
	windowDeltaUpdateCap = window.fps
	
	window.isReady = true
	defaultWindow = tableCopy(window)
	defaultWindow.mouseLock = window.mouseLock
	defaultWindow.maximized = window.maximized
	defaultWindow.fullscreen = window.fullscreen
	defaultWindow.fps = window.fps
end

function updateWindow(dt, force)
	if (not window.isReady) then return end
	windowUpdateTime = windowUpdateTime + dt
	
	local canUpdate = force or windowUpdateTime > windowDeltaUpdateCap
	
	-- Miscs
	if (window.borderless ~= getWindowProperty("__borderless")) then setWindowProperty("borderless", window.borderless) end
	if (window.title ~= getWindowProperty("__title")) then setWindowProperty("title", window.title) end
	
	-- Position
	if (window.forcePos and canUpdate) then
		local fX, fY = math.floor(window.x), math.floor(window.y)
		
		local updateX = fX ~= getWindowProperty("__x")
		local updateY = fY ~= getWindowProperty("__y")
		
		if (updateX) then setWindowProperty(updateY and "__x" or "x", fX) end
		if (updateY) then setWindowProperty("y", fY) end
	else
		window.x = getWindowProperty("__x")
		window.y = getWindowProperty("__y")
	end
	
	if (window.forceSize and canUpdate) then
		local fX, fY = math.floor(window.width), math.floor(window.height)
		
		local updateX = fX ~= getWindowProperty("__width")
		local updateY = fY ~= getWindowProperty("__height")
		
		if (updateX) then setWindowProperty(updateY and "__width" or "width", fX) end
		if (updateY) then setWindowProperty("height", fY) end
	else
		window.width = getWindowProperty("__width")
		window.height = getWindowProperty("__height")
	end
	
	if (canUpdate) then
		windowUpdateTime = 0
	end
end

function resetWindow(fullscreen)
	local lastForcePos, lastForceSize = window.forcePos, window.forceSize
	
	window.title = defaultWindow.title
	if (fullscreen) then
		window.forcePos, window.forceSize = false, false
		
		window.fullscreen = true
	else
		window.forcePos, window.forceSize = true, true
		
		window.maximized = false
		window.width = 1280
		window.height = 720
		window.x = (screenWidth / 2) - (window.width / 2)
		window.y = (screenHeight / 2) - (window.height / 2)
		
		updateWindow(0, true)
	end
	
	window.forcePos, window.forceSize = lastForcePos, lastForceSize
end

--------------------

function onDestroy()
	resetWindow()
end

function onCreatePost()
	initializeWindow()
	resetWindow()
end

function onUpdatePost(dt)
	updateWindow(dt)
end