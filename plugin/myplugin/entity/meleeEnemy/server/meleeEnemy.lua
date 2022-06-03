Trigger.RegisterHandler(this:cfg(), "ENTITY_DIE", function(context)
  local entity = context.obj1
  local posFireRune = entity:getFrontPos(2)
  local posHealthPotion = entity:getFrontPos(-2)
  
  local paramsFireRune = {
      item = Item.CreateItem("myplugin/fireRune", 10),
      map = entity.map,
      pos = posFireRune
  }
  
  local paramsHealthPotion = {
      item = Item.CreateItem("myplugin/healthPotion", 1),
      map = entity.map,
      pos = posHealthPotion
  }
  
  local dropFireRune = DropItemServer.Create(params)
  local dropHealthPotion = DropItemServer.Create(params)
  
  
  Lib.emitEvent('EnemyDeath')
end)