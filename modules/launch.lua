local hotkey = require 'hs.hotkey'
local application = require 'hs.application'

local key2App = {
    d = 'Dash',
    e = 'Evernote',
    f = 'Finder',
    i = 'iTerm',
    p = 'PhpStorm',
    c = 'charles',
    w = 'Wechat',
    q = 'QQ',
    m = 'Mweb',
    s = 'Safari',
    b = 'Google Chrome Canary',
    t = 'Postman',
}

for key, app in pairs(key2App) do
    hotkey.bind(hyper, key, function()
        application.launchOrFocus(app)
    end)
end

-- reload
hotkey.bind(hyper, 'escape', reload)

hotkey.bind(hyper, '`', console)
