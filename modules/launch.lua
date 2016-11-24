local hotkey = require 'hs.hotkey'
local application = require 'hs.application'

for key, app in pairs(key2App) do
    hotkey.bind(hyper, key, function()
        application.launchOrFocus(app)
    end)
end

-- reload
hotkey.bind(hyper, 'escape', reload)

hotkey.bind(hyper, '`', console)
