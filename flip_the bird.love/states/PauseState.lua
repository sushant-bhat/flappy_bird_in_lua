PauseState = {}

PauseState.update = function(dt)
  
end

PauseState.draw = function()
  love.graphics.clear(0,0,0)
  love.graphics.draw(backGround, -background_start , 0,0,SCREEN_W/backGround:getWidth()*2,SCREEN_H/backGround:getHeight())
  for i, pair in pairs(pipe_pairs) do
    love.graphics.draw(pair['upper'].image,pair.x,pair['upper'].y,0 ,0.6,-0.6)
    love.graphics.draw(pair['lower'].image,pair.x,pair['lower'].y,0 ,0.6,0.6)
  end
  love.graphics.draw(ground, -ground_start,SCREEN_H-ground:getHeight()+5, 0, SCREEN_W/ground:getWidth()*2,1)
  love.graphics.draw(hurt_bird_image,bird.x,bird.y,0,0.06,0.06)
  love.graphics.printf({{0,0,0},"Score: " .. game_score .. "\nPress space to play again"}, SCREEN_W/2-100, SCREEN_H/2-50,200,'center')
end