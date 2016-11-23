-- global functions

function reload()
    hs.reload()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Config Reloaded"
    }):send()
end

function console()
    hs.openConsole()
end