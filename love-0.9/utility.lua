module(...,package.seeall)

--[[
  Autor:    M. Kneblewski
  Version:  1.0
  Dieses Modul enthaelt nuetzliche Methoden, die einzeln aufgerufen werden koennen. Jede Methode ist
  in ihrem Kommentar detaillierter erklaert.
]]--

--[[ 
  Bestimmt, ob zwei Rechtecke an den Koordinaten x1|y1 und x2|y2 mit den Breiten
  b1 und b2, sowie den Höhen h1 und h2 kollidieren.
]]--
function utility.existiertKollision(x1,y1,b1,h1,x2,y2,b2,h2)
  if  x1 + b1   >=  x2      and
      x1        <   x2 + b2 and
      y1 + h1   >=  y2      and
      y1        <   y2 + h2
  then
      return true
  else
      return false
  end
end

--[[
  Bestimmt den Abstand zwischen zwei Punkten x1|y1 und x2|y2.
]]--
function utility.gibAbstand(x1,y1,x2,y2)
  return math.sqrt((x2-x1)^2+(y2-y1)^2)
end

--[[
  Bestimmt die neuen x- und y-Koordinaten für einen Punkt x1|y1, um sich einem bestimmten
  Zielpunkt x2|y2 um 1 Pixel auf dem kuerzesten Weg anzunaehern.
  Dabei muss die Geschwindigkeit speed und die Framzeit dt mit angegeben werden.
]]--
function utility.gibBewegungVonNach(x1,y1,x2,y2,speed,dt)
	local xBewegung = 0
	local yBewegung = 1
  if x2-x1 ~= 0 then
    local m = (y1 - y2)/(x2 - x1)
    xBewegung = 1 / math.sqrt(1+m^2)
    yBewegung = math.sqrt(1 - xBewegung^2)
  end
  if x1 > x2 then
    xBewegung = xBewegung * -1
  end
  if y1 > y2 then
    yBewegung = yBewegung * -1
  end
  return x1+xBewegung*speed*dt, y1+yBewegung*speed*dt
end