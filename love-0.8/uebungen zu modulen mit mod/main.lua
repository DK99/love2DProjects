local utility = require 'utility'
local hindernisse = require 'hindernisse'
local spieler = require 'spieler'
local mod = require 'mod'

function love.load()
	spieler.load()
  hindernisse.load()
end

function love.draw()
  if not mod.disco then
    love.graphics.setBackgroundColor(0, 0, 0)
  else
    love.graphics.setBackgroundColor(math.random(0,255),math.random(0,255),math.random(0,255))
  end
	spieler.draw()
  hindernisse.draw()
end

function love.update(dt)
	spieler.update(dt)
  hindernisse.update(dt)
end

function love.keypressed(key)
	mod.keypressed(key)
end

function love.mousepressed()
  hindernisse.mousepressed()
end