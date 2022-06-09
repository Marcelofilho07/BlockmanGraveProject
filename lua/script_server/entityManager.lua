local cfg = Entity.GetCfg('myplugin/player1')


Trigger.RegisterHandler(cfg, "ENTITY_ENTER", function(context)
    local player = context.obj1
    player:addItem('myplugin/e18a4eb5-f32f-43f3-bd95-0f0de3839a42', 1, nil, 'gift')
    player:addItem('myplugin/fireRune', 10, nil, 'gift')
    Lib.emitEvent('PLAYER_ENTER', player)
end)

Trigger.RegisterHandler(cfg, "ENTITY_LEAVE", function(context)
    local player = context.obj1
    Lib.emitEvent('PLAYER_LEAVE', player)
end)