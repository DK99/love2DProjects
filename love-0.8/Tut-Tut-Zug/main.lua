function love.load()
  startx = 0
  boden = 400
end

function love.update(dt)
  startx = startx + 200 * dt
end

function love.draw()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setColor(105,105,105)
  zeichneLock(startx, boden)
  zeichneWaggon(startx, boden)
end

function zeichneWaggon()
  love.graphics.rectangle("fill", startx - 220, boden, 200, 50)
  love.graphics.circle("fill", startx - 60, boden + 50, 20, 255)
  love.graphics.circle("fill", startx - 195, boden + 50, 20, 255)
  love.graphics.rectangle("fill", startx - 220, boden, 200, -60)
  love.graphics.rectangle("fill", startx - 230, boden + 30, 10, 10)
  love.graphics.rectangle("fill", startx - 20, boden + 30, 10, 10)
end

function zeichneLock(starty, boden)
  love.graphics.rectangle("fill", startx, boden, 200, 50)
  love.graphics.rectangle("fill", startx + 160, boden, 20, -30)
  love.graphics.circle("fill", startx + 160, boden + 50, 20, 255)
  love.graphics.circle("fill", startx + 25, boden + 50, 20, 255)
  love.graphics.rectangle("fill", startx, boden, 90, -60)
  love.graphics.rectangle("fill", startx - 10, boden + 30, 10, 10)
end