local enemiesCounter = 0

local function OnEnemyDeath()
  enemiesCounter = enemiesCounter - 1
end

Lib.subscribeEvent("EnemyDeath", OnEnemyDeath)

local function spawnEntity(cfgName)
    local spawnParams = { cfgName = cfgName, pos = Lib.v3(math.random(-60,60), 1, math.random(-60,60))} --Math.random(-60,60)
    local entity = EntityServer.Create(spawnParams)
    enemiesCounter = enemiesCounter + 1
end

local function spawnEnemies()
  World.Timer(50, function()
    if enemiesCounter < 20 then
      spawnEntity('myplugin/meleeEnemy')
      spawnEntity('myplugin/rangedEnemy')
    end
    return true
  end)
end

Lib.subscribeEvent("SpawnEnemies", spawnEnemies)