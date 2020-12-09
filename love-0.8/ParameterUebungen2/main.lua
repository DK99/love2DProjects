function love.draw()
  zeichneFenster(80, 60, 30, 30)

end

function zeichneFenster(x, y, w, h)
  love.graphics.setColor(25, 25, 25)
  love.graphics.rectangle("fill", x, y, x*(y/10) ,x*(y/10))
  love.graphics.setColor(191, 239, 255)
  love.graphics.rectangle("fill", x+10, y+10, w, h)
  love.graphics.rectangle("fill", x+60, y+10, w, h)
  love.graphics.rectangle("fill", x+10, y+60, w, h)
  love.graphics.rectangle("fill", x+60, y+60, w, h)
end