print('script_client:hello world')

PackageHandlers.registerClientHandler("SetTimer", function(player, packet)
    local wnd = UI:openWindow('Layout/countdown')
    wnd:setTimer(packet.time)
end)

PackageHandlers.registerClientHandler("SetVisibilityLeaderboard", function(player, packet)
  local leaderboard = UI:openWindow('Layout/leaderboard')
  print(packet.isVisible)
  leaderboard:setProperty("Visible", packet.isVisible)
end)

PackageHandlers.registerClientHandler("UpdatePlayerToLeaderboard", function(player, packet)
    local leaderboard = UI:openWindow('Layout/leaderboard')
    leaderboard:updatePlayer(packet.playerName, packet.points)
end)

PackageHandlers.registerClientHandler("RemovePlayerFromLeaderboard", function(player, packet)
    local leaderboard = UI:openWindow('Layout/leaderboard')
    leaderboard:removePlayer(packet.playerName)
end)

World.Timer(3, function()
    local guiMgr = GUIManager:Instance()
    local window = UI:openWindow("Layout/countdown")
end)
