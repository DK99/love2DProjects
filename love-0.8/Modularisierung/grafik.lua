module(...,package.seeall)

function setzeHintergrundfarbe(farbe)
  if farbe == 1 then
    love.graphics.setBackgroundColor(0,0,255)
  elseif farbe == 2 then
    love.graphics.setBackgroundColor(255,0,0)
  elseif farbe == 3 then
    love.graphics.setBackgroundColor(math.random(0,255),math.random(0,255),math.random(0,255))
  end
end

function zeichneObjekte(quadratX,quadratY,rechteckX,rechteckY,kreisX,kreisY)
  love.graphics.circle("fill",kreisX,kreisY,51)
  love.graphics.rectangle("fill",quadratX,quadratY,123,123)
  love.graphics.rectangle("fill",rechteckX,rechteckY,147,96)
end

function gibtKollision(x1,y1,laenge1,breite1,x2,y2,laenge2,breite2)
  if x1<=x2+laenge2 and x1+laenge1>=x2 and y1<=y2+breite2 and y1+breite1>=y2 then
    return true
  else
    return false
  end
end