function love.load()
 x_1=100
 y_1=100
 x_2=400
 y_2=400
 disco=false
end

function love.draw()
  if disco then
    love.graphics.setColor(math.random(0,255), math.random(0,255), math.random(0,255))
  elseif not disco then
    love.graphics.setColor(0, 0, 255)
  end
  love.graphics.rectangle("fill", x_1, y_1, 100, 50)
  if disco then
    love.graphics.setColor(math.random(0,255), math.random(0,255), math.random(0,255))
  elseif not disco then
    love.graphics.setColor(0, 255, 0)
  end
  love.graphics.rectangle("fill", x_2, y_2, 45, 80)
  if kollidiert(x_1, y_1, x_2, y_2, 100, 50, 45, 80) then
    love.graphics.setBackgroundColor(255, 0, 0)
  else
    if disco then
      love.graphics.setBackgroundColor(math.random(0,255), math.random(0,255), math.random(0,255))
    elseif not disco then
      love.graphics.setBackgroundColor(0, 0, 0)
    end
  end
end

function love.update(dt)
  if love.keyboard.isDown("escape") then
    os.exit()
  end
  if love.keyboard.isDown("q") and not disco then
    disco=true
  elseif love.keyboard.isDown("q") and disco then
    disco=false
  end
  if love.keyboard.isDown("w") then
    y_1=y_1-255*dt
  end
  if love.keyboard.isDown("s") then
    y_1=y_1+255*dt
  end
  if love.keyboard.isDown("a") then
    x_1=x_1-255*dt
  end
  if love.keyboard.isDown("d") then
    x_1=x_1+255*dt
  end
  if love.keyboard.isDown("up") then
    y_2 = y_2 -dt*255
  end
  if love.keyboard.isDown("down") then
    y_2 = y_2 +dt*255
  end
  if love.keyboard.isDown("left") then
    x_2 = x_2 -dt*255
  end
  if love.keyboard.isDown("right") then
    x_2 = x_2 +dt*255
  end
end

function kollidiert(x1, y1, x2, y2, laenge1, breite1, laenge2, breite2)
  if x1<=x2+laenge2 and x1+laenge1>=x2 and y1<=y2+breite2 and y1+breite1>=y2 then
    return true
  else
    return false
  end
end