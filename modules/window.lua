local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local hints = require 'hs.hints'
local grid = require 'hs.grid'

-- vsplit --------------------------------------------------

hotkey.bind(hyper, '[', function()
    window.focusedWindow():moveToUnit(layout.left50)
end)

hotkey.bind(hyper, ']', function()
    window.focusedWindow():moveToUnit(layout.right50)
end)

-- hints --------------------------------------------------

-- TODO:
-- 使用程序名称首字母作为快捷键
-- 存在系统应用无字母问题
--hints.style = 'vimperator'

hotkey.bind('Ctrl', 'up', function()
    hints.windowHints()
end)

hotkey.bind('Ctrl', 'down', function()
    hints.windowHints(window.focusedWindow():application():allWindows())
end)

-- window --------------------------------------------------

-- Hotkeys to interact with the window grid
hotkey.bind(hyper, ',', grid.show)

-- the position of window on screen
hotkey.bind(hyper, 'Left', grid.pushWindowLeft)
hotkey.bind(hyper, 'Right', grid.pushWindowRight)

-- fullscreen
hs.hotkey.bind(hyper, 'Up', function()
    hs.grid.maximizeWindow()
end)

-- move the current window to another monitor

hotkey.bind(hyperShift, 'left', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end

    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

hotkey.bind(hyperShift, 'right', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end

    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)
