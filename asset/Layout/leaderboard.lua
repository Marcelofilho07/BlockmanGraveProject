local rowComponent = UI:openWindow('Layout/leaderboardRow'):child('HorizontalLayoutRow')
local leaderboardTable = {}

function self:updatePlayer(playerName, points)  
    leaderboardTable[playerName] = points
    self:updateLeaderboard(playerName)
end

function self:removePlayer(playerName)
   self:child('VerticalLayoutContainer'):child(playerName):destroy()
   table.remove(leaderboardTable, playerName)
   self:updateLeaderboard(playerName);
end

function self:updateLeaderboard(playerName)
 
  for k,v in pairs(leaderboardTable) do
    if self:child('VerticalLayoutContainer'):child(k) then
      self:child('VerticalLayoutContainer'):child(k):destroy()
    end
  end
  
  for k,v in pairs(leaderboardTable) do
    local newRow = rowComponent:clone()
    newRow:child('PlayerName'):setText(k)
    newRow:child('Points'):setText(v)
    self:child('VerticalLayoutContainer'):addChild(newRow:getWindow())
    self:child('VerticalLayoutContainer'):child(newRow:getWindow():getName()):setName(k)
  end
end
  