CountDownState = {}

COUNTDOWN_INTERVAL = 0.75

CountDownState.count = 3
CountDownState.current = 0

CountDownState.update = function(dt)
  CountDownState.current = CountDownState.current + dt
  if CountDownState.current >= COUNTDOWN_INTERVAL then
    CountDownState.count = CountDownState.count - 1
    if CountDownState.count == 0 then
      CountDownState.count = 4
      current_state = 'play'
      reset()
      return
    end
    CountDownState.current = 0
  end
end

CountDownState.draw = function()
  love.graphics.draw(backGround, 0, 0, 0, SCREEN_W/backGround:getWidth()*2,SCREEN_H/backGround:getHeight())
  love.graphics.draw(ground, 0,SCREEN_H-ground:getHeight()+5, 0, SCREEN_W/ground:getWidth()*2,1)
  love.graphics.printf({{0,0,0},"Get Ready\n" .. CountDownState.count}, SCREEN_W/2-100, SCREEN_H/2-50,200,'center')
end