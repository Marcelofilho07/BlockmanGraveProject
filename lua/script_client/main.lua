print('script_client:hello world')

PackageHandlers.registerClientHandler("SetTimer", function(player, packet)
    local wnd = UI:openWindow('countdown')
    wnd:setTimer(packet.time)
end)

World.Timer(3, function()
    --local guiMgr = GUIManager:Instance()
    --local window = UI:openWindow("countdown")
end)
