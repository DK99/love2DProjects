function love.load()
  x_ziel=100
  y_ziel=100
  x=500
  y=500
  x_bewegung=0
  y_bewegung=0
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle("fill", x, y, 20)
  love.graphics.setColor(0, 0, 255)
  love.graphics.circle("fill", x_ziel, y_ziel, 20)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("x_bewegung= ".. x_bewegung.. "   y_bewegung= " ..y_bewegung, 10, 50)
end

function love.update(dt)
  berechneBewegung()
  if love.keyboard.isDown("escape") then
    os.exit()
  end
  if love.keyboard.isDown("a") then
    x_ziel=x_ziel-500*dt
  elseif love.keyboard.isDown("d") then
    x_ziel=x_ziel+500*dt
  end
  if love.keyboard.isDown("w") then
    y_ziel=y_ziel-500*dt
  elseif love.keyboard.isDown("s") then
    y_ziel=y_ziel+500*dt
  end
  x = x + x_bewegung*dt*400
	y = y + y_bewegung*dt*400
  love.mouse.setVisible(false)
  x_ziel, y_ziel = love.mouse.getPosition()
end

function berechneBewegung()
  local m = (y_ziel-y)/(x_ziel-x)
  x_bewegung=1/math.sqrt(1+m^2)
  y_bewegung=math.sqrt(1-(1/math.sqrt(1+m^2))^2)
  if x > x_ziel then
		x_bewegung = x_bewegung*-1
	end
	if y > y_ziel then
		y_bewegung = y_bewegung*-1
	end
end