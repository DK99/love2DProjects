function love.draw()
  zeichneHaus(100)
  zeichneHaus(200)
  zeichneHaus(300)
end

function zeichneHaus(x)
  love.graphics.setColor(120,120,120)
  love.graphics.rectangle("fill", x, 100, 80, 400)
  zeichneFensterEtage(120,x)
  zeichneFensterEtage(170,x)
  zeichneFensterEtage(220,x)
  zeichneFensterEtage(270,x)
  zeichneFensterEtage(320,x)
  love.graphics.setColor(139,69,19)
  love.graphics.rectangle("fill", x+20, 460, 20, 40) 
end

function zeichneFensterEtage(y,x)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", x+10, y, 20, 20)
  love.graphics.rectangle("fill", x+50, y, 20, 20)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", x+10, y, 20, 20)
  love.graphics.rectangle("line", x+50, y, 20, 20)
end