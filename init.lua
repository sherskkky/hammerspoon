-- global variables

-- hyper key
-- TODO:
-- 虽然可以自定义，但尽量不要设置为 ctrl + cmd
-- 当 hotkey 与系统快捷键产生冲突时，会失效
hyper = { 'ctrl', 'alt', 'cmd' }
hyperShift = { 'ctrl', 'alt', 'cmd', 'shift' }

-- app input methods
appMethods = {
    ['com.google.Chrome.canary'] = 1,
    ['com.evernote.Evernote'] = 1,
    ['com.tencent.qq'] = 1,
    ['com.tencent.xinWeChat'] = 1,
}
-- TODO:
-- 改用正则匹配
appIgnore = {
    ['com.apple.systempreferences'] = 1,
    ['org.hammerspoon.Hammerspoon'] = 1,
    ['com.apple.finder'] = 1,
}

require "modules/utility"
require "modules/launch"
require "modules/window"
require "modules/watcher"
