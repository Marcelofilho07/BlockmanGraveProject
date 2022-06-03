local gameState = {}

local roundStartTime = 10
local currentCountdownTime = 0
local playerCount = 0


function gameState:startTimer()
  currentCountdownTime = roundStartTime
  World.Timer(20, function()
          currentCountdownTime = currentCountdownTime - 1
          if currentCountdownTime ~= 0 then
            return true
          end
          Lib.emitEvent('SpawnEnemies')
    end)
end

local function playerEnter(player)
    if playerCount == 0 then
      gameState:startTimer()
    end
    
    playerCount = playerCount + 1
    
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

return gameState