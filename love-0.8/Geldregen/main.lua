function love.load()
  font=love.graphics.newFont("MyScriptFont.ttf", 50)
  geld_1=love.graphics.newImage("geld_1.png")
  geld_2=love.graphics.newImage("geld_2.png")
  geld_3=love.graphics.newImage("geld_3.png")
  geld_4=love.graphics.newImage("geld_4.png")
  geld_5=love.graphics.newImage("geld_5.png")
  geld_6=love.graphics.newImage("geld_6.png")
  geld_7=love.graphics.newImage("geld_7.png")
  geld_8=love.graphics.newImage("geld_8.png")
  hintergrund=love.graphics.newImage("hintergrund.png")
  luigi_richtung="gerade"
  luigi_rechts=love.graphics.newImage("luigi_rechts.png")
  luigi_links=love.graphics.newImage("luigi_links.png")
  luigi_gerade=love.graphics.newImage("luigi_gerade.png")
  luigi_x=200
  luigi_punkte=0
  mario_richtung="gerade"
  mario_rechts=love.graphics.newImage("mario_rechts.png")
  mario_links=love.graphics.newImage("mario_links.png")
  mario_gerade=love.graphics.newImage("mario_gerade.png")
  mario_x=600
  mario_punkte=0
  gelder ={}
  math.randomseed(os.time())
  spawn_timer=0
  timer=0
  spiel_timer=50
  gelderUebrig=100
  zuende=false
  disco=false
end

function love.draw()
  love.graphics.setFont(font)
  love.graphics.draw(hintergrund, 0, 0)
  if not zuende then
    spiel_draw()
  else
    if mario_punkte > luigi_punkte then
      love.graphics.print("Mario hat gewonnen!", 150, 550)
      love.graphics.print("Starte das Spiel mit R neu!", 100, 600)
    elseif luigi_punkte > mario_punkte then
      love.graphics.print("Luigi hat gewonnen!", 150, 550)
      love.graphics.print("Starte das Spiel mit R neu!", 100, 600)
    elseif mario_punkte == luigi_punkte then
      love.graphics.print("Unentschieden!", 150, 550)
      love.graphics.print("Starte das Spiel mit R neu!", 100, 600)
    end
  end
end

function spiel_draw()
  love.graphics.line(400,0,400,800)
  for i,v in ipairs (gelder) do
    if v.typ==1 then
      love.graphics.draw(geld_1, v.x, v.y,0, 0.05, sx, geld_1:getWidth()/2, geld_1:getHeight()/2)
    elseif v.typ==2 then
      love.graphics.draw(geld_2, v.x, v.y,0, 0.02, sx, geld_2:getWidth()/2, geld_2:getHeight()/2)
    elseif v.typ==3 then
      love.graphics.draw(geld_3, v.x, v.y,0, 0.02, sx, geld_3:getWidth()/2, geld_3:getHeight()/2)
    elseif v.typ==4 then
      love.graphics.draw(geld_4, v.x, v.y,0, 0.045, sx, geld_4:getWidth()/2, geld_4:getHeight()/2)
    elseif v.typ==5 then
      love.graphics.draw(geld_5, v.x, v.y,0, 0.03, sx, geld_5:getWidth()/2, geld_5:getHeight()/2)
    elseif v.typ==6 then
      love.graphics.draw(geld_6, v.x, v.y,0, 0.08, sx, geld_6:getWidth()/2, geld_6:getHeight()/2)
    elseif v.typ==7 then
      love.graphics.draw(geld_7, v.x, v.y,0, 0.3, sx, geld_7:getWidth()/2, geld_7:getHeight()/2)
    elseif v.typ==8 then
      love.graphics.draw(geld_8, v.x, v.y,0, 0.2, sx, geld_8:getWidth()/2, geld_8:getHeight()/2)
    end
  end
  if mario_richtung=="gerade" then
    love.graphics.draw(mario_gerade, mario_x, 710, 0, 0.03, sx, mario_gerade:getWidth()/2)
  elseif mario_richtung=="links" then
    love.graphics.draw(mario_links, mario_x, 710, 0, 0.03, sx, mario_links:getWidth()/2)
  elseif mario_richtung=="rechts" then
    love.graphics.draw(mario_rechts, mario_x, 710, 0, 0.03, sx, mario_rechts:getWidth()/2)
  end
  if luigi_richtung=="gerade" then
    love.graphics.draw(luigi_gerade, luigi_x, 705, 0, 0.03, sx, luigi_gerade:getWidth()/2)
  elseif luigi_richtung=="links" then
    love.graphics.draw(luigi_links, luigi_x, 705, 0, 0.125, sx, luigi_links:getWidth()/2)
  elseif luigi_richtung=="rechts" then
    love.graphics.draw(luigi_rechts, luigi_x, 705, 0, 0.125, sx, luigi_rechts:getWidth()/2)
  end
  if not disco then
    love.graphics.setColor(0, 0, 0)
  elseif disco then
    love.graphics.setColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
  end
  love.graphics.setColorMode("modulate")
  love.graphics.print("Marios Punkte: "..mario_punkte, 410, 10)
  love.graphics.print("Luigis Punkte: "..luigi_punkte, 10, 10)
  love.graphics.print("Countdown bis", 410, 60)
  love.graphics.print("zum Spiel Ende: "..  math.floor(spiel_timer), 410, 110)
  love.graphics.print("Countdown bis", 10, 60)
  love.graphics.print("zum Spiel Ende: "..  math.floor(spiel_timer), 10, 110)
  love.graphics.print("Sachen uebrig: "..  gelderUebrig, 410, 160)
  love.graphics.print("Sachen uebrig: "..  gelderUebrig, 10, 160)
  if not disco then
    love.graphics.setColorMode("replace")
  end
end
function gelder_spawn()
  geld={
    x=0;
    y=-100;
    seite=math.random(1,2);
    typ=math.random(1,8);
  }
  table.insert(gelder,geld)
end

function love.update(dt)
  if not zuende then
    spiel_update(dt)
  end
end

function spiel_update(dt)
  spiel_timer=spiel_timer-dt
  if spiel_timer <= 0 or gelderUebrig==0 then
    zuende=true
  end
  if love.keyboard.isDown("left") and mario_x >= 400 + 35 then
    mario_richtung="links"
    mario_x=mario_x-250*dt
  end
  if love.keyboard.isDown("right") and mario_x <= 800 - 35 then
    mario_richtung="rechts"
    mario_x=mario_x+250*dt
  end
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") or  love.keyboard.isDown("right") and love.keyboard.isDown("left") then
    mario_richtung="gerade"
  end
  if love.keyboard.isDown("a") and luigi_x >= 0 + 35 then
    luigi_richtung="links"
    luigi_x=luigi_x-250*dt
  end
  if love.keyboard.isDown("d") and luigi_x <= 400 - 35 then
    luigi_richtung="rechts"
    luigi_x=luigi_x+250*dt
  end
  if not love.keyboard.isDown("d") and not love.keyboard.isDown("a") or  love.keyboard.isDown("d") and love.keyboard.isDown("a") then
    luigi_richtung="gerade"
  end
  spawn_timer=spawn_timer+dt
  if  gelderUebrig > 0 and spawn_timer >= 0.5 then
    gelder_spawn()
    spawn_timer=0
  end
  for i,v in ipairs (gelder) do
    if v.seite==1 then
      v.x=math.random(25, 375)
    elseif v.seite==2 then
      v.x=math.random(425, 775)
    end
    v.seite=0
    v.y=v.y+100*dt
    timer=timer+dt
    if v.y>= 850 and timer >= 5 then
      v.y=-100
      v.seite=math.random(1,2)
      timer=0
    end
    if mario_x -45<= v.x + 10 and mario_x + 45 >= v.x - 10 and 710 <= v.y then
      if v.typ == 1 then
          mario_punkte=mario_punkte+30
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 2 then
          mario_punkte=mario_punkte+40
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 3 then
          mario_punkte=mario_punkte+20
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 4 then
          mario_punkte=mario_punkte+15
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 5 then
          mario_punkte=mario_punkte+10
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 6 then
          mario_punkte=mario_punkte+5
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 7 then
          mario_punkte=mario_punkte+25
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 8 then
          mario_punkte=mario_punkte+35
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      end
    end
    if luigi_x -45<= v.x + 10 and luigi_x + 45 >= v.x - 10 and 710 <= v.y then
      if v.typ == 1 then
          luigi_punkte=luigi_punkte+30
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 2 then
          luigi_punkte=luigi_punkte+40
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 3 then
          luigi_punkte=luigi_punkte+20
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 4 then
          luigi_punkte=luigi_punkte+15
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 5 then
          luigi_punkte=luigi_punkte+10
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 6 then
          luigi_punkte=luigi_punkte+5
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 7 then
          luigi_punkte=luigi_punkte+25
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      elseif v.typ == 8 then
          luigi_punkte=luigi_punkte+35
          table.remove(gelder, i)
          gelderUebrig=gelderUebrig-1
      end
    end
  end
end

function love.keypressed(key)
  if key=="r" and zuende then
    luigi_richtung="gerade"
    luigi_x=200
    luigi_punkte=0
    mario_richtung="gerade"
    mario_x=600
    mario_punkte=0
    spawn_timer=0
    timer=0
    spiel_timer=50
    gelderUebrig=100
    zuende=false
  end
  if key == " " and not disco then
    disco=true
  elseif key == " " and disco then
    disco=false
  end
end