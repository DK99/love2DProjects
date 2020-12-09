function love.draw()
  aufgabe1b(50, 50, 200, 50, 100, 20)
  aufgabe1b(300, 100, 300, 20, 400, 10)
  aufgabe1b(500, 50, 200, 70, 300, 90)
end

function aufgabe1b(x, y, h1, w1, h2, w2)
  love.graphics.setColor(122, 139, 139)
  love.graphics.rectangle("fill", x, y, h1, w1)
  love.graphics.rectangle("line", x+50, y+40, h2, w2)
  end