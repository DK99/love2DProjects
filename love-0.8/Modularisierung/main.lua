local grafik = require 'grafik'
local zahl = 3
local quadratX = 65
local quadratY = 566
local rechteckX = 516
local rechteckY = 55
local kreisX = 255
local kreisY = 585
local kollision = false

function love.draw()
  grafik.zeichneObjekte(quadratX,quadratY,rechteckX,rechteckY,kreisX,kreisY)
  grafik.setzeHintergrundfarbe(zahl)
  if kollision then
	love.graphics.setBackgroundColor(255,255,0)
  end
end

function love.update(dt)
  if love.keyboard.isDown("left")  then
    quadratX = quadratX - 50 * dt
    rechteckX = rechteckX - 50 * dt
    kreisX = kreisX - 50 * dt
  end
  if love.keyboard.isDown("right")  then
    quadratX = quadratX + 50 * dt
    rechteckX = rechteckX + 50 * dt
    kreisX = kreisX + 50 * dt
  end
  if love.keyboard.isDown("down")  then
    quadratY = quadratY + 50 * dt
    rechteckY = rechteckY + 50 * dt
    kreisY = kreisY + 50 * dt
  end
  if love.keyboard.isDown("up")  then
    quadratY = quadratY - 50 * dt
    rechteckY = rechteckY - 50 * dt
    kreisY = kreisY - 50 * dt
  end
  local xMaus,yMaus = love.mouse.getPosition()
  kollision = grafik.gibtKollision(xMaus,yMaus,1,1,quadratX,quadratY,123,123) 
  if not kollision then
	kollision = grafik.gibtKollision(xMaus,yMaus,1,1,rechteckX,rechteckY,147,96) 
	if not kollision then
		kollision = grafik.gibtKollision(xMaus,yMaus,1,1,kreisX-51,kreisY-51,102,102) 
	end
  end
end

function love.keypressed(key)
  if key == "1" then
    zahl = 1
  elseif key == "2" then
    zahl = 2
  elseif key == "3" then
    zahl = 3
  end
end