local utility = require 'utility'
local hindernisse = require 'hindernisse'
local spieler = require 'spieler'

function love.load()
	spieler.load()
  hindernisse.load()
end

function love.draw()
	spieler.draw()
  hindernisse.draw()
end

function love.update(dt)
	spieler.update(dt)
  hindernisse.update(dt)
end

function love.keypressed(key)
	spieler.keypressed(key)
  hindernisse.keypressed(key)
end

function love.mousepressed()
  hindernisse.mousepressed()
end