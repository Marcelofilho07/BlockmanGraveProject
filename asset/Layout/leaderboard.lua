local rowComponent = UI:openWindow('Layout/leaderboardRow'):child('HorizontalLayoutRow')

function self:addPlayer(player, points)  
  local newRow = rowComponent:clone()
  newRow:child('PlayerName'):setText(player.name)
  newRow:child('Points'):setText(points)
  self:child('VerticalLayoutContainer'):addChild(newRow:getWindow())
end

function self:showLeaderboard()
  if exist then
    local newRow = rowComponent:clone()
    newRow:child('PlayerName'):setText('TEEEXT IHUUUL')
    newRow:child('Points'):setText(initialPlayerScore)
    self:child('VerticalLayoutContainer'):addChild(newRow)
    playersScore[playername] = newRow:getID()
    exist = false
  end
  print(playersScore[playername])
  local PlayerScore = self:isChildID(playersScore[playername])--:child('Points'):getText()) + 1
  print(PlayerScore)
  --self:getChildById(playersScore[playername]):child('Points'):setText(tonumber(self:getChildById(playersScore[playername]):child('Points'):getText()) + 1)
end



function self:addPoint(player)
  self:getChildById(playersScore[player.name]):child('Points'):setText(tonumber(self:getChildById(playersScore[player.name]):child('Points'):getText()) + 1)
end
  