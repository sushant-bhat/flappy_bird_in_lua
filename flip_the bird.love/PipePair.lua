require 'Pipe'

PIPE_GAP = 130

PipePairClass = {}

function PipePairClass:new(y)
  local pipe_pair = {
    ['lower'] = PipeClass:new('lower',y),
    ['upper'] = PipeClass:new('upper',y - PIPE_GAP)
  }
  pipe_pair.x = SCREEN_W
  pipe_pair.remove = false
  pipe_pair.passed = false
  return pipe_pair
end