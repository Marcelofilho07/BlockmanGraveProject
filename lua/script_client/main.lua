print('script_client:hello world')

PackageHandlers.registerClientHandler("SetTimer", function(player, packet)
    local wnd = UI:openWindow('Layout/countdown')
    wnd:setTimer(packet.time)
end)

PackageHandlers.registerClientHandler("AddPlayerToLeaderboard", function(player, packet)
    local leaderboard = UI:openWindow('Layout/leaderboard')
    leaderboard:addPlayer(packet.playerName, packet.points)
end)

World.Timer(3, function()
    local guiMgr = GUIManager:Instance()
    local window = UI:openWindow("Layout/countdown")
end)
