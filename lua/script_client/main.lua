print('script_client:hello world')

PackageHandlers.registerClientHandler("SetTimer", function(player, packet)
    local wnd = UI:openWindow('Layout/countdown')
    wnd:setTimer(packet.time)
    local leaderboard = UI:openWindow('Layout/leaderboard')
    leaderboard:showLeaderboard()
end)

World.Timer(3, function()
    local guiMgr = GUIManager:Instance()
    local window = UI:openWindow("Layout/countdown")
end)
