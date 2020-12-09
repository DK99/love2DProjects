
function love.load()
  DK=love.graphics.newImage("Logo_DK.png")
  summe = 0
  summe2= 0
end

function love.draw()
  for i = 1,7,1 do
    love.graphics.print(i.."     Copyright Donkey Kong",100,20*i)
  end
  love.graphics.draw(DK, 300, 100)
  for i = 1,10000,1 do
    summe = summe + i
  end
  love.graphics.print(summe.."     Copyright Donkey Kong",100,400)
  summe =0
  for i = 1,10001,2 do
    summe2 = summe2 + i
  end
  love.graphics.print(summe2.."     Copyright Donkey Kong",100,500)
  summe2 =0
end