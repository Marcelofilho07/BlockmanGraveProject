local rowComponent = UI:openWindow('Layout/leaderboardRow'):child('HorizontalLayoutRow')

function self:addPlayer(playerName, points)  
  if not self:child('VerticalLayoutContainer'):child(playerName) then
    local newRow = rowComponent:clone()
    newRow:child('PlayerName'):setText(playerName)
    newRow:child('Points'):setText(points)
    self:child('VerticalLayoutContainer'):addChild(newRow:getWindow())
    self:child('VerticalLayoutContainer'):child(newRow:getWindow():getName()):setName(playerName)
  end
end

function self:addPoint(player)
  self:getChildById(playersScore[player.name]):child('Points'):setText(tonumber(self:getChildById(playersScore[player.name]):child('Points'):getText()) + 1)
end
  