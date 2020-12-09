function love.draw()
  love.graphics.setBackgroundColor(0, 0, 200)
  zeichneWasserSpirale(math.random(1,800), math.random(1,600), math.random(1,100))
  zeichneWasserSpirale(math.random(1,800), math.random(1,600), math.random(1,100))
  zeichneWasserSpirale(math.random(1,800), math.random(1,600), math.random(1,100))
  zeichneWasserSpirale(math.random(1,800), math.random(1,600), math.random(1,100))
  zeichneWasserSpirale(math.random(1,800), math.random(1,600), math.random(1,100))
end

function zeichneWasserSpirale(x, y, r)
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line", x, y, r, math.random(1,15))
  love.graphics.circle("line", x, y, r*1.5, math.random(1,15))
  love.graphics.circle("line", x, y, r*2, math.random(1,15))
  love.graphics.circle("line", x, y, r*2.5, math.random(1,15))
end