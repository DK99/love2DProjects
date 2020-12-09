function love.draw()
  sabineAuto(50, 50)
  sabineAuto(100, 150)
  sabineAuto(200, 210)
end

function sabineAuto(x, y)
  love.graphics.rectangle("fill", x, y, 100, 50)
  love.graphics.circle("fill", x + 30, y + 50, 15)
  love.graphics.circle("fill", x + 70, y + 50, 15)
end