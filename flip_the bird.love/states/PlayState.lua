PlayState = {}

PlayState.check_collisions = function()
  if bird.y >= SCREEN_H-ground:getHeight()-40 then
    love.audio.play(bird_hit_sound)
    return true
  end
  for i, pair in pairs(pipe_pairs) do
    if ((bird.x <= pair.x + pair['lower'].w and bird.x >= pair.x) or (bird.x+bird.w <= pair.x + pair['lower'].w and bird.x+bird.w >= pair.x)) and bird.y+bird.h-20 >= pair['lower'].y then
      love.audio.play(bird_hit_sound)
      return true
    end
    if ((bird.x <= pair.x + pair['upper'].w and bird.x >= pair.x) or (bird.x+bird.w <= pair.x + pair['upper'].w and bird.x+bird.w >= pair.x)) and bird.y+10 <= pair['upper'].y then
      love.audio.play(bird_hit_sound)
      return true
    end
  end
  return false
end

PlayState.update = function(dt)
  fact = fact + 1
  if fact == 5 then
    bird_index = bird_index + 1
    fact = 0
  end
  background_start = (background_start + BACKGROUND_SPEED * dt) % BACKGROUND_LOOPING_POINT
  ground_start = (ground_start + GROUND_SPEED * dt) % GROUND_LOOPING_POINT
  spawn_timer = spawn_timer + dt
  if spawn_timer > 3 then
    table.insert(pipe_pairs, PipePairClass:new(math.random(SCREEN_H / 4,(SCREEN_H * 3) / 4)))
    spawn_timer = 0
  end
  
  
  for i, pair in pairs(pipe_pairs) do
    pair.x = pair.x + PIPE_SPEED * dt
    if pair.x < -pair['upper'].image:getWidth() then
      pair.remove = true
    end
    if not pair.passed then
      if pair.x+pair['lower'].w < bird.x then
        game_score = game_score+1
        love.audio.play(point_sound)
        pair.passed = true
      end
    end
    if PlayState.check_collisions() then
      current_state = 'game_over'
      love.audio.play(bird_die_sound)
      return
    end
  end
  
  for i, pair in pairs(pipe_pairs) do
    if pair.remove then
      table.remove(pipe_pairs, i)
    end
  end
  bird.dy = bird.dy + GRAVITY * dt
  bird.y = math.min(SCREEN_H-ground:getHeight()-40,bird.y + bird.dy)
  if bird.y >= SCREEN_H-ground:getHeight()-40 then
    love.audio.play(bird_hit_sound)
    current_state = 'game_over'
    return
  end
  bird.y = math.max(0,bird.y)
end

PlayState.draw = function()
  love.graphics.clear(0,0,0)
  love.graphics.draw(backGround, -background_start , 0,0,SCREEN_W/backGround:getWidth()*2,SCREEN_H/backGround:getHeight())
  for i, pair in pairs(pipe_pairs) do
    love.graphics.draw(pair['upper'].image,pair.x,pair['upper'].y,0 ,0.6,-0.6)
    love.graphics.draw(pair['lower'].image,pair.x,pair['lower'].y,0 ,0.6,0.6)
  end
  love.graphics.print({{0,0,0},"Score: " .. game_score}, 20, 20)
  love.graphics.draw(ground, -ground_start,SCREEN_H-ground:getHeight()+5, 0, SCREEN_W/ground:getWidth()*2,1)
  love.graphics.draw(bird.images[bird_index%8 + 1],bird.x,bird.y,0,0.06,0.06)
end