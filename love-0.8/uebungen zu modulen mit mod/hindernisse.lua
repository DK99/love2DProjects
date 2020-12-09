module(...,package.seeall)
local utility = require 'utility'
local mod = require 'mod'
local mausX = 100
local mausY = 100
local mausBewegung = false
local x1 = 100
local y1 = 100
local zeit = 0

function load()

end

function draw()
  zeichneHindernisse()
end

function update(dt)
  zeit = dt
end

function keypressed(key)

end

function hindernisse.zeichneHindernisse()
  if not mod.disco then
    love.graphics.setColor(255, 0, 0)
  else
    love.graphics.setColor(math.random(0,255),math.random(0,255),math.random(0,255))
  end
  if mausBewegung then
    x1,y1 = utility.gibBewegungVonNach(x1,y1,mausX,mausY,mod.hindernissSpeed,zeit)
    if utility.existiertKollision(x1,y1,20,20,mausX,mausY,1,1) then
      mausBewegung = false
    end
  end
  love.graphics.rectangle("fill",x1,y1,20,20)
  love.graphics.rectangle("fill",250,700,20,20)
  love.graphics.rectangle("fill",700,250,20,20)
end

function hindernisse.mousepressed()
  mausX,mausY = love.mouse.getPosition()
  mausBewegung = true
end

function hindernisse.gibX()
  return x1
end

function hindernisse.gibY()
  return y1
end