local cfg = Entity.GetCfg('myplugin/player1')


Trigger.RegisterHandler(cfg, "ENTITY_ENTER", function(context)
    local player = context.obj1
    Lib.emitEvent('PLAYER_ENTER', player)
end)