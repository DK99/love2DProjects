function love.draw()
  love.graphics.setBackgroundColor(0, 0, 200)
  zeichneWasserSpirale(200, 400, 70)
  zeichneWasserSpirale(260, 100, 30)
  zeichneWasserSpirale(290, 600, 50)
  zeichneWasserSpirale(490, 600, 70)
  zeichneWasserSpirale(290, 200, 10)
end

function zeichneWasserSpirale(x, y, r)
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line", x, y, r, 3)
  love.graphics.circle("line", x, y, r*1.5, 3)
  love.graphics.circle("line", x, y, r*2, 3)
  love.graphics.circle("line", x, y, r*2.5, 3)
end