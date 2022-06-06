local gameState = {}

local roundStartTime = 10
local roundDuration = 5
local currentCountdownTime = 0
local currentRoundTime = 0
local playerCount = 0
local playerName = ''
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
    if playerCount == 0 then
      gameState:startTimer()
    end
    
    playerScoreTable[player.name] = 0
    playerCount = playerCount + 1
    
    playerName = player.name
    PackageHandlers.sendServerHandler(player, "SetTimer", {time = currentCountdownTime})
    World.Timer(10, function()
            if not player or not player:isValid() then --Return if player is invalid
                return
            end
            PackageHandlers.sendServerHandler(player, "SetTimer", {time = currentCountdownTime}) --Set the time displayed by the client
            if currentCountdownTime ~= 0 then
                return true
            end
        end)
end

Lib.subscribeEvent("PLAYER_ENTER", playerEnter)

local function OnPlayerScore(player)
  playerScoreTable[player.name] = playerScoreTable[player.name] + 1
end

Lib.subscribeEvent("PLAYER_SCORE", OnPlayerScore)

function gameState:ShowLeaderboard()
  World.CurWorld.SystemNotice(1, playerScoreTable[playerName] , 40)
  for k,v in pairs(playerScoreTable) do
    print(k,v)
  end
end

function gameState:BeginRoundTimer()
  currentRoundTime = roundDuration
  World.CurWorld.SystemNotice(1, 'BEGIN TIMER' , 40)
  World.Timer(20, function()
          currentRoundTime = currentRoundTime - 1
          if currentRoundTime ~= 0 then
            return true
          end
          gameState:ShowLeaderboard()
    end)
end

return gameState