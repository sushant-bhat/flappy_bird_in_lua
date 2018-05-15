StartMenuState = {}

StartMenuState.update = function(dt)
  
end

StartMenuState.draw = function()
  love.graphics.draw(backGround, -background_start, 0, 0, SCREEN_W/backGround:getWidth()*2,SCREEN_H/backGround:getHeight())
  love.graphics.draw(ground, -ground_start,SCREEN_H-ground:getHeight()+5, 0, SCREEN_W/ground:getWidth()*2,1)
  love.graphics.printf({{0,0,0},"Welcome to Flip the Bird\nPress space to start"}, SCREEN_W/2-100, SCREEN_H/2-50, 200, 'center')
end