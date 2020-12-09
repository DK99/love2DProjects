module(...,package.seeall)
local utility = require 'utility'
local hindernisse = require 'hindernisse'
local mod = require 'mod'

local x=400
local y=400

function spieler.load()

end

function spieler.draw()
  if not mod.disco then
    love.graphics.setColor(0, 0, 255)
  else
    love.graphics.setColor(math.random(0,255),math.random(0,255),math.random(0,255))
  end
  love.graphics.rectangle("fill", x, y, 50, 50)
end

function spieler.update(dt)
  if love.keyboard.isDown("w") and not utility.existiertKollision(x,y-mod.spielerSpeed*dt,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x,y-mod.spielerSpeed*dt,50,50,250,700,20,20) and not utility.existiertKollision(x,y-mod.spielerSpeed*dt,50,50,700,250,20,20) then
    y=y-mod.spielerSpeed*dt
  end
  if love.keyboard.isDown("s") and not utility.existiertKollision(x,y+mod.spielerSpeed*dt,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x,y+mod.spielerSpeed*dt,50,50,250,700,20,20) and not utility.existiertKollision(x,y+mod.spielerSpeed*dt,50,50,700,250,20,20) then
    y=y+mod.spielerSpeed*dt
  end
  if love.keyboard.isDown("a") and not utility.existiertKollision(x-mod.spielerSpeed*dt,y,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x-mod.spielerSpeed*dt,y,50,50,250,700,20,20) and not utility.existiertKollision(x-mod.spielerSpeed*dt,y,50,50,700,250,20,20) then
    x=x-mod.spielerSpeed*dt
  end
  if love.keyboard.isDown("d") and not utility.existiertKollision(x+mod.spielerSpeed*dt,y,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x+mod.spielerSpeed*dt,y,50,50,250,700,20,20) and not utility.existiertKollision(x+mod.spielerSpeed*dt,y,50,50,700,250,20,20) then
    x=x+mod.spielerSpeed*dt
  end
end

function spieler.keypressed(key)

end