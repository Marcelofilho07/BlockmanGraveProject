local gameState = {}

local RedisHandler = require "redishandler"
local rankName = World.CurWorld.GameName..'Test'

local roundStartTime = 10
local roundDuration = 5
local currentCountdownTime = 0
local currentRoundTime = 0
local playerCount = 0
local playerScoreTable = {}

function gameState:startTimer()
  currentCountdownTime = roundStartTime
  World.Timer(20, function()
          currentCountdownTime = currentCountdownTime - 1
          if currentCountdownTime ~= 0 then
            return true
          end
          Lib.emitEvent('SpawnEnemies')
          gameState:BeginRoundTimer()
    end)
end

local function playerEnter(player)
    if not player or not player:isValid() then
      return
    end
    
    if playerCount == 0 then
      gameState:startTimer()
    end
            
    playerScoreTable[player.name] = 0
    playerCount = playerCount + 1
    
    for i, _player in pairs(Game.GetAllPlayers() ) do
      for i, lbPlayer in pairs(Game.GetAllPlayers()) do
        PackageHandlers.sendServerHandler(_player, "AddPlayerToLeaderboard", {playerName = lbPlayer.name ,points = playerScoreTable[lbPlayer.name]})
      end
    end
    
    PackageHandlers.sendServerHandler(player, "SetTimer", {time = currentCountdownTime})
    World.Timer(10, function()
            PackageHandlers.sendServerHandler(player, "SetTimer", {time = currentCountdownTime}) --Set the time displayed by the client
            if currentCountdownTime ~= 0 then
                return true
            end
        end)
end

Lib.subscribeEvent("PLAYER_ENTER", playerEnter)

local function OnPlayerScore(player, points)
  playerScoreTable[player.name] = playerScoreTable[player.name] + points
end

Lib.subscribeEvent("PLAYER_SCORE", OnPlayerScore)

function gameState:ShowLeaderboard()
  for k,v in pairs(playerScoreTable) do
    print(k,v)
  end
end

function gameState:BeginRoundTimer()
  currentRoundTime = roundDuration
  World.Timer(20, function()
          currentRoundTime = currentRoundTime - 1
          if currentRoundTime ~= 0 then
            return true
          end
          gameState:ShowLeaderboard()
    end)
end

return gameState