function love.load()
  zahl1=5
  zahl2=0
  wort="Hundekuchen"
end

function love.draw()
  love.graphics.setColor(0,0,0,255)
  zeichneHaus()
  
end

function zeichneHaus()
  zeichneDach()
  zeichneWand()
  zeichneFenster()
end

function zeichneDach(farbe)
  if  zahl1 ==5 then
    love.graphics.setColor(255,0,0,255)
  elseif zahl1 <=-6 then 
    love.graphics.setColor(0,0,255,255)
  elseif zahl1 + zahl2 >=10 then
    love.graphics.setColor(0,255,0,255)
  end
    love.graphics.triangle("fill",233,165,132,321,354,321)
  
end

function zeichneWand(farbe)
  if wort=="Hundekuchen" then
    love.graphics.setColor(153,153,153,255)
  elseif wort=="Super".. zahl2 then 
    love.graphics.setColor(139,69,19,255)
  end
  love.graphics.rectangle("fill",140,320,200,200)
  
end
 
function zeichneFenster(farbe)
  love.graphics.setColor(255,52,179,255)
  love.graphics.rectangle("fill",200,350,100,100)
end