function love.load()
  x1=800
  g1=math.random(10,500)
  x2=800
  g2=math.random(10,500)
  x3=800
  g3=math.random(10,500)
  sieger=""
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  zeichneSabineLok(x1,0, 125,125,125)
  zeichneSabineLok(x2,200, 145,65,45)
  zeichneSabineLok(x3,400, 25,35,200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.line(10,600,10,0)
  love.graphics.print(sieger, 200, 200)
end

function  zeichneSabineLok(x, y, r, g, b)
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle("fill",x,y,100,100)
  love.graphics.rectangle("fill",x-150,y+100,250,100)
  love.graphics.rectangle("fill",x-150,y+25,25,75)
  love.graphics.setColor(200,200,200)
  love.graphics.circle("fill",x-75,y+200,25)
  love.graphics.circle("fill",x+25,y+200,25)
end

function love.update(dt)
  if x1<=160 then
    sieger="Lok 1 hat gewonnen!"
  elseif x2<=160 then
    sieger="Lok 2 hat gewonnen!"
  elseif x3<=160 then
    sieger="Lok 3 hat gewonnen!"
  end
  if x1<=160 or x2<=160  or x3<=160  then
    g1=0
    g2=0
    g3=0
  else
  x1=x1-g1 * dt
  if x1 <= 0 then
    x1=800
  end
  x2=x2-g2 * dt
  if x2 <= 0 then
    x2=800
  end
  x3=x3-g3 * dt
  if x3 <= 0 then
    x3=800
  end
  end
end