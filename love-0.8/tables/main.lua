local raumschiff = {
  x=0;
  y=0;
  speed=100;
}
local raumschiff2 = {
  x=0;
  y=0;
  speed=100;
}
local raumschiff3 = {
  x=0;
  y=0;
  speed=100;
}

function love.load()
  
end

function love.draw()
  love.graphics.setColor(math.random(1,255), 0, 0)
  love.graphics.rectangle("fill", raumschiff.x, raumschiff.y, 50, 50)
  love.graphics.setColor(0,math.random(1,255), 0)
  love.graphics.rectangle("fill", raumschiff2.x, raumschiff2.y, 50, 50)
  love.graphics.setColor(0,0,math.random(1,255))
  love.graphics.rectangle("fill", raumschiff3.x, raumschiff3.y, 50, 50)
end

function love.update(dt)
  if love.keyboard.isDown("w") then
    raumschiff.y=raumschiff.y-raumschiff.speed*dt
  end
  if love.keyboard.isDown("s") then
    raumschiff.y=raumschiff.y+raumschiff.speed*dt
  end
  if love.keyboard.isDown("a") then
    raumschiff.x=raumschiff.x-raumschiff.speed*dt
  end
  if love.keyboard.isDown("d") then
    raumschiff.x=raumschiff.x+raumschiff.speed*dt
  end
  if love.keyboard.isDown("up") then
    raumschiff2.y=raumschiff2.y-raumschiff2.speed*dt
  end
  if love.keyboard.isDown("down") then
    raumschiff2.y=raumschiff2.y+raumschiff2.speed*dt
  end
  if love.keyboard.isDown("left") then
    raumschiff2.x=raumschiff2.x-raumschiff2.speed*dt
  end
  if love.keyboard.isDown("right") then
    raumschiff2.x=raumschiff2.x+raumschiff2.speed*dt
  end
  if love.keyboard.isDown("kp8") then
    raumschiff3.y=raumschiff3.y-raumschiff3.speed*dt
  end
  if love.keyboard.isDown("kp2") then
    raumschiff3.y=raumschiff3.y+raumschiff3.speed*dt
  end
  if love.keyboard.isDown("kp4") then
    raumschiff3.x=raumschiff3.x-raumschiff3.speed*dt
  end
  if love.keyboard.isDown("kp6") then
    raumschiff3.x=raumschiff3.x+raumschiff3.speed*dt
  end
end