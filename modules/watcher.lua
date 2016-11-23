appWatcher = hs.application.watcher.new(function(name, event, app)

    if event == hs.application.watcher.activated then
        hs.printf(hs.inspect(app:bundleID()))

        if appIgnore[app:bundleID()] then
            return true;
        end

        local bSwitch
        local currentMethod = hs.keycodes.currentMethod()

        if appMethods[app:bundleID()] then
            if currentMethod == '搜狗拼音' then
                bSwitch = 1
            else
                bSwitch = hs.keycodes.setMethod('搜狗拼音')
            end
        else
            if not currentMethod then
                bSwitch = 1
            else
                bSwitch = hs.keycodes.setLayout("U.S.")
            end
        end

        if bSwitch then
            hs.alert.closeAll()
            local method = hs.keycodes.currentMethod()
            if method == nil then
                method = 'En_US'
            end
            hs.alert.show(name .. ' - ' .. method)
        end
    end
end):start()

caffeinateWatcher = hs.caffeinate.watcher.new(function(event)
    hs.printf(event)

    --[[
        The order when the display is close:
        systemWillSleep   1
        screensDidSleep   3
        screensDidLock    10
        screensDidWake    4
        systemDidWake     0
        screensDidUnlock  11
    --]]

    if event == hs.caffeinate.watcher.screenDidSleep then
        appWatcher:stop()
    elseif event == hs.caffeinate.watcher.screenDidWake then
        appWatcher:start()
        reload()
    end
end):start()

-- auto reload
-- TODO:
-- 加个计时器 防止频繁加载
myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload):start()

--[[
-- TODO:
-- 存在切换应用多次回调的问题
inputMethodWatcher = hs.keycodes.inputSourceChanged(function()
    hs.printf('yes')
end)
--]]
