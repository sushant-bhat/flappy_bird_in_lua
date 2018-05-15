GameOverState = {}

GameOverState.update = function(dt)
  bird.y = math.min(SCREEN_H-ground:getHeight()-40,bird.y+10)
  if bird.y == SCREEN_H-ground:getHeight()-40 then
    current_state = 'pause'
  end
end

GameOverState.draw = function()
  love.graphics.clear(0,0,0)
  love.graphics.draw(backGround, -background_start , 0,0,SCREEN_W/backGround:getWidth()*2,SCREEN_H/backGround:getHeight())
  for i, pair in pairs(pipe_pairs) do
    love.graphics.draw(pair['upper'].image,pair.x,pair['upper'].y,0 ,0.6,-0.6)
    love.graphics.draw(pair['lower'].image,pair.x,pair['lower'].y,0 ,0.6,0.6)
  end
  love.graphics.print({{0,0,0},"Score: " .. game_score}, 20, 20)
  love.graphics.draw(ground, -ground_start,SCREEN_H-ground:getHeight()+5, 0, SCREEN_W/ground:getWidth()*2,1)
  love.graphics.draw(hurt_bird_image,bird.x,bird.y,0,0.06,0.06)
end