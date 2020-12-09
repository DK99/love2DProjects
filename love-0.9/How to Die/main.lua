local spiel = require "spiel"

local winX, winY

function love.load()
  spiel.load()
  winX, winY = love.window.getDesktopDimensions(1)
end

function love.draw()
  spiel.draw()
end

function love.update(dt)
  spiel.update(dt)
  if love.keyboard.isDown("escape") then
    os.exit()
  end
end