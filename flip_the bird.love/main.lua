require 'Bird'
require 'Pipe'
require 'PipePair'
require 'states/CountDownState'
require 'states/PlayState'
require 'states/GameOverState'
require 'states/StartMenuState'
require 'states/PauseState'

SCREEN_W = 0
SCREEN_H = 0
GRAVITY = 25
ANTI_GRAVITY_SPEED = -7

BACKGROUND_SPEED = 10
GROUND_SPEED = 120
PIPE_SPEED = -120

BACKGROUND_LOOPING_POINT = 0
GROUND_LOOPING_POINT = 0

spawn_timer = 2
game_score = 0
current_state = 'start_menu'

GAME_STATES = {start_menu= StartMenuState, game_over= GameOverState, countdown= CountDownState, play= PlayState, pause= PauseState}

function load_res()
  backGround = love.graphics.newImage('images/back.png')
  ground = love.graphics.newImage('images/ground.jpg')
  pipe_image = love.graphics.newImage('images/pipe.png')
  hurt_bird_image = love.graphics.newImage('images/bird_hurt.png')
  bird_hop_sound = love.audio.newSource('sounds/bird_hop.wav', 'static')
  point_sound = love.audio.newSource('sounds/point.wav', 'static')
  bird_hit_sound = love.audio.newSource('sounds/bird_hit.wav', 'static')
  bird_fly_sound = love.audio.newSource('sounds/bird_fly.wav', 'static')
  bird_die_sound = love.audio.newSource('sounds/bird_die.wav', 'static')
  back_music = love.audio.newSource('sounds/music.mp3', 'static')
  back_music:setLooping(true)
  back_music:setVolume(0.1)
end

function reset()
  background_start = 0
  ground_start = 0
  game_score = 0
  fact = 0
  bird_index = 0
  bird.y = SCREEN_H/2
  bird.dy = 0
  pipe_pairs = {}
end

function love.load()
  love.window.setMode(800,600,{fullscreen=true,fullscreentype='desktop'})
  SCREEN_H = love.graphics:getHeight()
  SCREEN_W = love.graphics:getWidth()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  load_res()
  back_music:play()
  bird = BirdClass:new()
  BACKGROUND_LOOPING_POINT = SCREEN_W
  GROUND_LOOPING_POINT = SCREEN_W
  math.randomseed(os.time())
  reset()
end

function love.update(dt)
  GAME_STATES[current_state].update(dt)
end

function love.keypressed(key)
  if key == 'space' then
    if current_state == 'play' then
      bird.dy = ANTI_GRAVITY_SPEED
      love.audio.play(bird_hop_sound)
      love.audio.play(bird_fly_sound)
    elseif current_state == 'start_menu' then
      current_state = 'countdown'
    elseif current_state == 'pause' then
      current_state = 'countdown'
    end
  end
  if key == 'escape' then
    love.event.quit()
  end
  if key == 's' then
    current_state = 'play'
    reset()
  end
end

function love.draw()
  GAME_STATES[current_state].draw()
end