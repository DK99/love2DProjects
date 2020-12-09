module(...,package.seeall)
local utility = require 'utility'
local hindernisse = require 'hindernisse'

local x=400
local y=400

function spieler.load()

end

function spieler.draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", x, y, 50, 50)
end

function spieler.update(dt)
  if love.keyboard.isDown("w") and not utility.existiertKollision(x,y-200*dt,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x,y-200*dt,50,50,250,700,20,20) and not utility.existiertKollision(x,y-200*dt,50,50,700,250,20,20) then
    y=y-200*dt
  end
  if love.keyboard.isDown("s") and not utility.existiertKollision(x,y+200*dt,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x,y+200*dt,50,50,250,700,20,20) and not utility.existiertKollision(x,y+200*dt,50,50,700,250,20,20) then
    y=y+200*dt
  end
  if love.keyboard.isDown("a") and not utility.existiertKollision(x-200*dt,y,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x-200*dt,y,50,50,250,700,20,20) and not utility.existiertKollision(x-200*dt,y,50,50,700,250,20,20) then
    x=x-200*dt
  end
  if love.keyboard.isDown("d") and not utility.existiertKollision(x+200*dt,y,50,50,hindernisse.gibX(),hindernisse.gibY(),20,20) and not utility.existiertKollision(x+200*dt,y,50,50,250,700,20,20) and not utility.existiertKollision(x+200*dt,y,50,50,700,250,20,20) then
    x=x+200*dt
  end
end

function spieler.keypressed(key)

end
spieler=0