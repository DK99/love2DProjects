function love.load()
  zahl1 = 85397938
  zahl2 = 545484545
end

function love.draw()
  love.graphics.print(zahl1, 100, 100)
  love.graphics.print(zahl2, 200, 200)
end