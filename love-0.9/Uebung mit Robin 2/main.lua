module (...,package.seeall)
grafik = require "grafikModul"
utility = require  "utility"

function love.load()
  grafik.load()
  
end

function love.draw()
  grafik.draw()

end

function love.keypressed(key)
  grafik.keypressed(key)
  
end

function love.update(dt)
  grafik.update(dt)
end