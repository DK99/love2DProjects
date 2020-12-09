function love.load()
  k_x=400
  k_y=400
  r_x=600
  r_y=600
  k2_y=200
  k2_x=200
  math.randomseed(os.time())
  k2_richtung=math.random(1, 4)
  k2_weg=math.random(1, 800)
  k2_farbe="gruen"
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle("fill", k_x, k_y, 25)
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", r_x, r_y, 50, 50)
  if k2_farbe=="gruen" then
    love.graphics.setColor(0, 255, 0)
    love.graphics.circle("fill", k2_x, k2_y, 15)
  elseif k2_farbe=="blau" then
    love.graphics.setColor(0, 0, 255)
    love.graphics.circle("fill", k2_x, k2_y, 15)
  elseif k2_farbe== "rot" then
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", k2_x, k2_y, 15)
  end
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    k_y=k_y-500*dt
  end
  if love.keyboard.isDown("down") then
    k_y=k_y+500*dt
  end
  if love.keyboard.isDown("left") then
    k_x=k_x-500*dt
  end
  if love.keyboard.isDown("right") then
    k_x=k_x+500*dt
  end
  if love.keyboard.isDown("w") then
    r_y=r_y-500*dt
  end
  if love.keyboard.isDown("s") then
    r_y=r_y+500*dt
  end
  if love.keyboard.isDown("a") then
    r_x=r_x-500*dt
  end
  if love.keyboard.isDown("d") then
    r_x=r_x+500*dt
  end
  if k2_richtung == 1 then
    if k2_y > k2_weg then
      k2_y=k2_y-250*dt
    else
      k2_richtung=math.random(1, 4)
      k2_weg=math.random(1, 800)
    end
  end
  if k2_richtung == 2 then
    if k2_y < k2_weg then
      k2_y=k2_y+250*dt
    else
      k2_richtung=math.random(1, 4)
      k2_weg=math.random(1, 800)
    end
  end
  if k2_richtung == 3 then
    if k2_x > k2_weg then
      k2_x=k2_x-250*dt
    else
      k2_richtung=math.random(1, 4)
      k2_weg=math.random(1, 800)
    end
  end
  if k2_richtung == 4 then
    if k2_x < k2_weg then
      k2_x=k2_x+250*dt
    else
      k2_richtung=math.random(1, 4)
      k2_weg=math.random(1, 800)
    end
  end
  if k2_x -15 <= k_x + 25 and k2_x + 15 >= k_x - 25 and k2_y - 15 <= k_y + 25 and k2_y + 15 >= k_y - 25 then
    k2_farbe="rot"
  elseif k2_x -15 <= r_x + 50 and k2_x + 15 >= r_x and k2_y - 15 <= r_y + 50 and k2_y + 15 >= r_y then
    k2_farbe="blau"
  else
    k2_farbe="gruen"
  end 
end

function love.keypressed(key)
  --[[if key=="up" then
    k_y=k_y-100
  end
  if key=="down" then
    k_y=k_y+100
  end
  if key=="left" then
    k_x=k_x-100
  end
  if key=="right" then
    k_x=k_x+100
  end]]
end