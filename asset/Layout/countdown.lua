function self:setTimer(time)

  self:child('Txt_Timer'):setText(time)
  if time == 0 then
    UI:closeWindow('Layout/countdown')
  end
end