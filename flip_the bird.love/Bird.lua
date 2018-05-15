BirdClass = {}

function BirdClass:new()
  local bird = {}
  bird.images = {
    love.graphics.newImage('images/bird_frames/frame-1.png'),
    love.graphics.newImage('images/bird_frames/frame-2.png'),
    love.graphics.newImage('images/bird_frames/frame-3.png'),
    love.graphics.newImage('images/bird_frames/frame-4.png'),
    love.graphics.newImage('images/bird_frames/frame-5.png'),
    love.graphics.newImage('images/bird_frames/frame-6.png'),
    love.graphics.newImage('images/bird_frames/frame-7.png'),
    love.graphics.newImage('images/bird_frames/frame-8.png')
  }
  bird.x = SCREEN_W / 2
  bird.y = SCREEN_H / 2
  bird.w = bird.images[2]:getWidth() * 0.06
  bird.h = bird.images[2]:getHeight() * 0.06
  bird.dy = 0
  return bird
end
