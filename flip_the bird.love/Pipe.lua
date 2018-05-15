PipeClass = {}


function PipeClass:new(orientation, y)
  local pipe = {}
  pipe.image = pipe_image
  pipe.x = SCREEN_W - 20
  pipe.y = y
  pipe.w = pipe.image:getWidth() * 0.6
  return pipe
end