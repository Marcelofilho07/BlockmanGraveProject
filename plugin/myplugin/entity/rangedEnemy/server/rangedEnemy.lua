Trigger.RegisterHandler(this:cfg(), "ENTITY_DIE", function(context)
  local entity = context.obj1
  local player = context.obj2
  local posFireRune = entity:getFrontPos(2)
  local posHealthPotion = entity:getFrontPos(-2)
  
  local paramsFireRune = {
      item = Item.CreateItem("myplugin/fireRune", 5),
      map = entity.map,
      pos = posFireRune
  }
  
  local paramsHealthPotion = {
      item = Item.CreateItem("myplugin/healthPotion", 1),
      map = entity.map,
      pos = posHealthPotion
  }
  
  local dropFireRune = DropItemServer.Create(paramsFireRune)
  local dropHealthPotion = DropItemServer.Create(paramsHealthPotion)
  
  Lib.emitEvent('EnemyDeath')
  Lib.emitEvent('PLAYER_SCORE', player)
end)