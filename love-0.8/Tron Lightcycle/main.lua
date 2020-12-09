function love.load()
  links_x=0
  links_y=487.5
  links_richtung="rechts"
  rechts_x=975
  rechts_y=487.5
  rechts_richtung="links"
  speed=250
  spur={}
  timer=0
  links_punkte=0
  rechts_punkte=0
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.print("Punkte Rot: "..links_punkte, 100, 100)
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("Punkte Grün: "..rechts_punkte, 600, 100)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", links_x, links_y, 25, 25)
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", rechts_x, rechts_y, 25, 25)
  for i,v in ipairs (spur) do
    if v.farbe== "rot" then
      love.graphics.setColor(255, 0, 0)
      love.graphics.rectangle("fill", v.x, v.y, 12.5, 12.5)
    elseif v.farbe== "gruen" then
      love.graphics.setColor(0, 255, 0)
      love.graphics.rectangle("fill", v.x, v.y, 12.5, 12.5)
    end
  end
end

function love.update(dt)
  timer=timer+dt
  if links_richtung == "rechts" and links_x <= 975 then
    spur_spawn("rot", links_x-12.5, links_y+6.25)
    links_x=links_x+speed*dt
  elseif links_richtung == "links" and links_x >= 0 then
    spur_spawn("rot", links_x+25, links_y+6.25)
    links_x=links_x-speed*dt
  elseif links_richtung == "oben" and links_y >= 0 then
    spur_spawn("rot", links_x+6.25, links_y+25)
    links_y=links_y-speed*dt
  elseif links_richtung == "unten" and links_y <= 975 then
    spur_spawn("rot", links_x+6.25, links_y-12.5)
    links_y=links_y+speed*dt
  else
    rechts_punkte=rechts_punkte+1
    links_x=0
    links_y=487.5
    links_richtung="rechts"
    rechts_x=975
    rechts_y=487.5
    rechts_richtung="links"
    timer=timer+10
  end
  if rechts_richtung == "links" and rechts_x >= 0 then
    spur_spawn("gruen", rechts_x+25, rechts_y+6.25)
    rechts_x=rechts_x-speed*dt
  elseif rechts_richtung == "rechts" and rechts_x <= 975 then
    spur_spawn("gruen", rechts_x-12.5, rechts_y+6.25)
    rechts_x=rechts_x+speed*dt
  elseif rechts_richtung == "oben" and rechts_y >= 0 then
    spur_spawn("gruen", rechts_x+6.25, rechts_y+25)
    rechts_y=rechts_y-speed*dt
  elseif rechts_richtung == "unten" and rechts_y <= 975 then
    spur_spawn("gruen", rechts_x+6.25, rechts_y-12.5)
    rechts_y=rechts_y+speed*dt
  else
    links_punkte=links_punkte+1
    links_x=0
    links_y=487.5
    links_richtung="rechts"
    rechts_x=975
    rechts_y=487.5
    rechts_richtung="links"
    timer=timer+10
  end
  for i,v in ipairs (spur) do
    if v.zeitSpawn+v.zeitDa<=timer then
      table.remove(spur, i)
    end
    if v.x + 12.5 >= rechts_x and v.x < rechts_x + 25 and v.y + 12.5 >= rechts_y and v.y < rechts_y + 25 then
      links_punkte=links_punkte+1
      links_x=0
      links_y=487.5
      links_richtung="rechts"
      rechts_x=975
      rechts_y=487.5
      rechts_richtung="links"
      timer=timer+10
    end
    if v.x + 12.5 >= links_x and v.x < links_x + 25 and v.y + 12.5 >= links_y and v.y < links_y + 25 then
      rechts_punkte=rechts_punkte+1
      links_x=0
      links_y=487.5
      links_richtung="rechts"
      rechts_x=975
      rechts_y=487.5
      rechts_richtung="links"
      timer=timer+10
    end
  end
end

function spur_spawn(farbe, x, y)
  local temp={
    x=x;
    y=y;
    farbe=farbe;
    zeitSpawn=timer;
    zeitDa=math.random()*2;
  }
  table.insert(spur, temp)
end

function love.keypressed(key)
  if links_richtung == "rechts" and key=="a" then
    links_richtung="oben"
  elseif links_richtung == "rechts" and key=="d" then
    links_richtung="unten"
  elseif links_richtung == "oben" and key=="a" then
    links_richtung="links"
  elseif links_richtung == "oben" and key=="d" then
    links_richtung="rechts"
  elseif links_richtung == "links" and key=="a" then
    links_richtung="unten"
  elseif links_richtung == "links" and key=="d" then
    links_richtung="oben"
  elseif links_richtung == "unten" and key=="a" then
    links_richtung="links"
  elseif links_richtung == "unten" and key=="d" then
    links_richtung="rechts"
  end
  if rechts_richtung == "rechts" and key=="left" then
    rechts_richtung="oben"
  elseif rechts_richtung == "rechts" and key=="right" then
    rechts_richtung="unten"
  elseif rechts_richtung == "oben" and key=="left" then
    rechts_richtung="links"
  elseif rechts_richtung == "oben" and key=="right" then
    rechts_richtung="rechts"
  elseif rechts_richtung == "links" and key=="left" then
    rechts_richtung="unten"
  elseif rechts_richtung == "links" and key=="right" then
    rechts_richtung="oben"
  elseif rechts_richtung == "unten" and key=="left" then
    rechts_richtung="links"
  elseif rechts_richtung == "unten" and key=="right" then
    rechts_richtung="rechts"
  end
end
