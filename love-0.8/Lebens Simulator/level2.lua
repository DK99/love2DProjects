module(..., package.seeall)
spielTabelle=require 'spielTabelle'

level2={
  leben_100=love.graphics.newImage("gfx/level2/leben_100.png");
  leben_90=love.graphics.newImage("gfx/level2/leben_90.png");
  leben_80=love.graphics.newImage("gfx/level2/leben_80.png");
  leben_70=love.graphics.newImage("gfx/level2/leben_70.png");
  leben_60=love.graphics.newImage("gfx/level2/leben_60.png");
  leben_50=love.graphics.newImage("gfx/level2/leben_50.png");
  leben_40=love.graphics.newImage("gfx/level2/leben_40.png");
  leben_30=love.graphics.newImage("gfx/level2/leben_30.png");
  leben_20=love.graphics.newImage("gfx/level2/leben_20.png");
  leben_10=love.graphics.newImage("gfx/level2/leben_10.png");
  hintergrund=love.graphics.newImage("gfx/level2/hintergrund.png");
  hexagon=love.graphics.newImage("gfx/level2/hexagon.png");
  hexagon_punkte=love.graphics.newImage("gfx/level2/hexagon_punkte.png");
  hexagon_mitte=love.graphics.newImage("gfx/level2/hexagon_mitte.png");
  hexagon_mauer=love.graphics.newImage("gfx/level2/hexagon_mauer.png");
  kanone_bild=love.graphics.newImage("gfx/level2/kanone.png");
  fadenkreuz=love.graphics.newImage("gfx/level2/fadenkreuz.png");
  maus=love.graphics.newImage("gfx/level2/maus.png");
  virus_pink=love.graphics.newImage("gfx/level2/Virus_pink.png");
  virus_gruen=love.graphics.newImage("gfx/level2/Virus_gruen.png");
  virus_rot=love.graphics.newImage("gfx/level2/Virus_rot.png");
  virus_gelb2=love.graphics.newImage("gfx/level2/Virus_gelb2.png");
  virus_gruen2=love.graphics.newImage("gfx/level2/Virus_gruen2.png");
  virus_blau=love.graphics.newImage("gfx/level2/Virus_blau.png");
  virus_gelb=love.graphics.newImage("gfx/level2/Virus_gelb.png");
  virus_rot2=love.graphics.newImage("gfx/level2/Virus_rot2.png");
  hexagon_x=250;
  hexagon_y=250;
  mouse;
  mouse_logo="maus";
  start=false;
  load1=false;
  load2=false;
  welle=0;
  welleVorher=0;
  gegnerSpawn=false;
  punkte=1000;
}

mauer={}

mauerGebaut={
  hexagon_1=false;
  hexagon_2=false;
  hexagon_3=false;
  hexagon_4=false;
  hexagon_5=false;
  hexagon_6=false;
  hexagon_7=false;
  hexagon_8=false;
  hexagon_9=false;
  hexagon_10=false;
  hexagon_11=false;
  hexagon_12=false;
  hexagon_13=false;
  hexagon_14=false;
  hexagon_15=false;
  hexagon_16=false;
  hexagon_17=false;
  hexagon_18=false;
  hexagon_19=false;
}

function mauer_new(hexagon)
  local temp={
    hexagon=hexagon;
    leben=100;
    level=1;
  }
  table.insert(mauer, temp)
end

kanone={}

kanoneGebaut={
  hexagon_1=false;
  hexagon_2=false;
  hexagon_3=false;
  hexagon_4=false;
  hexagon_5=false;
  hexagon_6=false;
  hexagon_7=false;
  hexagon_8=false;
  hexagon_9=false;
  hexagon_10=false;
  hexagon_11=false;
  hexagon_12=false;
  hexagon_13=false;
  hexagon_14=false;
  hexagon_15=false;
  hexagon_16=false;
  hexagon_17=false;
  hexagon_18=false;
  hexagon_19=false;
}

function kanone_new(hexagon, x, y)
  local temp={
    hexagon=hexagon;
    leben=100;
    level=1;
    grad=0;
    x=x;
    y=y;
    geschossen=false;
  }
  table.insert(kanone, temp)
end

function level2_draw()
  love.graphics.setColorMode("replace")
  love.graphics.draw(level2.hintergrund, 0, 0)
  love.graphics.setColorMode("modulate")
  kugeln_draw()
  love.graphics.line(600, 0, 600, 600)
  love.graphics.setColorMode("replace")
  love.graphics.rectangle("line", 25, 475, 200, 100)
  if level2.welle == 0 then
    love.graphics.setFont(schrift)
    love.graphics.print("Welle", 50, 475)
    love.graphics.print("starten!", 50, 525)
  elseif level2.welle > 0 then
    love.graphics.print("Welle: " .. level2.welle, 50, 500)
  end
  level2_hexagon(level2.hexagon_x, level2.hexagon_y, "mitte",  1)
  level2_hexagon(level2.hexagon_x, level2.hexagon_y+87, "n", 2)
  level2_hexagon(level2.hexagon_x, level2.hexagon_y-87, "n", 3)
  level2_hexagon(level2.hexagon_x+75, level2.hexagon_y-43.5, "n", 4)
  level2_hexagon(level2.hexagon_x+75, level2.hexagon_y+43.5, "n", 5)
  level2_hexagon(level2.hexagon_x-75, level2.hexagon_y-43.5, "n", 6)
  level2_hexagon(level2.hexagon_x-75, level2.hexagon_y+43.5, "n", 7)
  level2_hexagon(level2.hexagon_x+150, level2.hexagon_y, "n", 8)
  level2_hexagon(level2.hexagon_x-150, level2.hexagon_y, "n", 9)
  level2_hexagon(level2.hexagon_x, level2.hexagon_y-174, "n", 10)
  level2_hexagon(level2.hexagon_x, level2.hexagon_y+174, "n", 11)
  level2_hexagon(level2.hexagon_x+75, level2.hexagon_y+130, "n", 12)
  level2_hexagon(level2.hexagon_x-75, level2.hexagon_y-130, "n", 13)
  level2_hexagon(level2.hexagon_x+75, level2.hexagon_y-130, "n", 14)
  level2_hexagon(level2.hexagon_x-75, level2.hexagon_y+130, "n", 15)
  level2_hexagon(level2.hexagon_x+150, level2.hexagon_y+87, "n", 16)
  level2_hexagon(level2.hexagon_x-150, level2.hexagon_y-87, "n", 17)
  level2_hexagon(level2.hexagon_x-150, level2.hexagon_y+87, "n", 18)
  level2_hexagon(level2.hexagon_x+150, level2.hexagon_y-87, "n", 19)
  mauer_draw()
  kanone_draw()
  gegner_draw()
  love.graphics.draw(level2.kanone_bild, 650, 350, 0, 0.25, sx)
  love.graphics.setFont(schrift2)
  love.graphics.print("10 Punkte", 650, 410, 0, 1, sx)
  love.graphics.draw(level2.fadenkreuz, 650, 200, 0, 0.75, sx)
  love.graphics.draw(level2.maus, 675, 100, 0, 0.15, sx)
  love.graphics.draw(level2.hexagon_mauer, 650, 450, 0, 1.25, sx)
  love.graphics.print("5 Punkte", 650, 560, 0, 1, sx)
  love.graphics.draw(level2.hexagon_punkte, 650, 10, 0, 1, sx)
  love.graphics.setFont(schrift)
  love.graphics.print(level2.punkte, 675, 25)
  if not level2.mouse then
    if level2.mouse_logo=="fadenkreuz" then
      love.graphics.draw(level2.fadenkreuz, love.mouse.getX() - 90, love.mouse.getY() - 90)
    elseif level2.mouse_logo=="kanone" then
      love.graphics.draw(level2.kanone_bild, love.mouse.getX() - 50, love.mouse.getY() - 15, 0, 0.2, sx)
    elseif level2.mouse_logo=="mauer" then
      love.graphics.draw(level2.hexagon_mauer, love.mouse.getX() - 30, love.mouse.getY() - 30, 0, 0.75, sx)
    elseif level2.mouse_logo=="maus" then
      love.graphics.draw(level2.maus, love.mouse.getX(), love.mouse.getY(), 0, 0.2, sx)
    end
  end
  love.graphics.print("X= "..love.mouse.getX().." Y= "..love.mouse.getY(), 100, 10)
  if love.mouse.getX() >= 270 and love.mouse.getX() <= 330 and love.mouse.getY() >= 270 and love.mouse.getY() <= 330 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 1 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 1 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==1 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon1=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon1 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==1 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon1=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon1 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  
  if love.mouse.getX() >= 270 and love.mouse.getX() <= 330 and love.mouse.getY() >= 350 and love.mouse.getY() <= 400 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 2 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 2 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==2 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon2=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon2 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==2 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon2=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon2 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 270 and love.mouse.getX() <= 330 and love.mouse.getY() >= 180 and love.mouse.getY() <= 240 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 3 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 3 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==3 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon3=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon3 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==3 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon3=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon3 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 340 and love.mouse.getX() <= 410 and love.mouse.getY() >= 230 and love.mouse.getY() <= 280 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 4 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 4 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==4 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon4=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon4 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==4 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon4=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon4 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 340 and love.mouse.getX() <= 410 and love.mouse.getY() >= 320 and love.mouse.getY() <= 360 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 5 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 5 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==5 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon5=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon5 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==5 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon5=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon5 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 190 and love.mouse.getX() <= 260 and love.mouse.getY() >= 230 and love.mouse.getY() <= 280 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 6 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 6 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==6 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon6=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon6 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==6 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon6=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon6 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 190 and love.mouse.getX() <= 260 and love.mouse.getY() >= 320 and love.mouse.getY() <= 360 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 7 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 7 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==7 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon7=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon7 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==7 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon7=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon7 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 420 and love.mouse.getX() <= 480 and love.mouse.getY() >= 270 and love.mouse.getY() <= 330 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 8 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 8 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==8 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon8=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon8 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==8 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon8=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon8 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 120 and love.mouse.getX() <= 180 and love.mouse.getY() >= 270 and love.mouse.getY() <= 330 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 9 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 9 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==9 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon9=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon9 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==9 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon9=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon9 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 270 and love.mouse.getX() <= 330 and love.mouse.getY() >= 100 and love.mouse.getY() <= 150 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 10 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 10 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==10 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon10=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon10 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==10 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon10=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon10 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 270 and love.mouse.getX() <= 330 and love.mouse.getY() >= 440 and love.mouse.getY() <= 500 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 11 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 11 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==11 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon11=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon11 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==11 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon11=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon11 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 340 and love.mouse.getX() <= 410 and love.mouse.getY() >= 400 and love.mouse.getY() <= 450 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 12 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 12 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==12 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon12=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon12 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==12 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon12=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon12 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 190 and love.mouse.getX() <= 260 and love.mouse.getY() >= 140 and love.mouse.getY() <= 190 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 13 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 13 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==13 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon13=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon13 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==13 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon13=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon13 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 340 and love.mouse.getX() <= 410 and love.mouse.getY() >= 140 and love.mouse.getY() <= 190 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 14 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 14 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==14 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon14=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon14 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==14 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon14=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon14 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 190 and love.mouse.getX() <= 260 and love.mouse.getY() >= 400 and love.mouse.getY() <= 450 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 15 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 15 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==15 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon15=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon15 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==15 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon15=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon15 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 420 and love.mouse.getX() <= 480 and love.mouse.getY() >= 350 and love.mouse.getY() <= 400 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 16 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 16 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==16 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon16=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon16 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==16 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon16=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon16 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 120 and love.mouse.getX() <= 180 and love.mouse.getY() >= 180 and love.mouse.getY() <= 240 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 17 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 17 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==17 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon17=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon17 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==17 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon17=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon17 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 120 and love.mouse.getX() <= 180 and love.mouse.getY() >= 350 and love.mouse.getY() <= 400 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 18 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 18 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==18 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon18=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon18 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==18 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon18=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon18 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
  if love.mouse.getX() >= 420 and love.mouse.getX() <= 480 and love.mouse.getY() >= 180 and love.mouse.getY() <= 240 and level2.mouse_logo=="maus" then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY()-120, 200, 120)
    love.graphics.setFont(schrift2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(love.mouse.getX(), love.mouse.getY()+60, love.mouse.getX(), love.mouse.getY()+60)
    for i,v in ipairs(mauer) do
      if v.hexagon == 19 then
        love.graphics.print("Mauer:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+5-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon == 19 then
        love.graphics.print("Kanone:   Level: "..v.level, love.mouse.getX()+25, love.mouse.getY()+65-120)
      end
    end
    love.graphics.setColorMode("replace")
    for i,v in ipairs(mauer) do
      if v.hexagon==19 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+30-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          mauerGebaut.hexagon19=false
          table.remove(mauer, i)
        end
      end
      if not mauerGebaut.hexagon19 then
        love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+30-120)
      end
    end
    for i,v in ipairs(kanone) do
      if v.hexagon==19 then
        if v.leben == 100 then
          love.graphics.draw(level2.leben_100, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 90 then
          love.graphics.draw(level2.leben_90, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 80 then
          love.graphics.draw(level2.leben_80, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 70 then
          love.graphics.draw(level2.leben_70, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 60 then
          love.graphics.draw(level2.leben_60, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 50 then
          love.graphics.draw(level2.leben_50, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 40 then
          love.graphics.draw(level2.leben_40, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 30 then
          love.graphics.draw(level2.leben_30, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 20 then
          love.graphics.draw(level2.leben_20, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 10 then
          love.graphics.draw(level2.leben_10, love.mouse.getX()+25, love.mouse.getY()+90-120, 0, 1.5, 1)
        elseif v.leben == 0 then
          kanoneGebaut.hexagon19=false
          table.remove(kanone, i)
        end
      end
      if not kanoneGebaut.hexagon19 then
          love.graphics.print("Nicht Gebaut", love.mouse.getX()+25, love.mouse.getY()+90-120)
      end
    end
  end
end

function level2_update(dt)
  if not level2.load1 then
    level2.load1=true
    m1=0
    m2=0
    m3=0
    m4=0
    m5=0
    m6=0
    m7=0
    m8=0
    m9=0
    m10=0
    m11=0
    m12=0
    m13=0
    m14=0
    m15=0
    m16=0
    m17=0
    m18=0
    m19=0
    m20=0
    m21=0
    m22=0
    m23=0
    m24=0
    m25=0
    m26=0
    m27=0
    m28=0
    m29=0
    m30=0
    m31=0
    m32=0
    m33=0
    m34=0
    m35=0
    m36=0
    m37=0
    m38=0
    m39=0
    m40=0
    m41=0
    m42=0
    m43=0
    m44=0
    m45=0
    m46=0
    m47=0
    m48=0
    m49=0
    m50=0
  end
  gegner_update(dt)
  if love.mouse.getX() > 600 then
    love.mouse.setVisible(true)
    level2.mouse=true
  elseif love.mouse.getX() < 600 then
    love.mouse.setVisible(false)
    level2.mouse=false
  end
end

function level2_hexagon(x, y, mode, number)
  if mode == "n" then
    love.graphics.draw(level2.hexagon, x, y)
  elseif mode == "mitte" then
    love.graphics.draw(level2.hexagon_mitte, x, y)
  end
  love.graphics.print(number, x+25, y+25)
end

function level2_mousepressed(x, y, button)
  gegner_mousepressed(x, y, button)
  if x >= 675 and x <= 732.6 and y >= 100 and y <= 189.55 and button == "l" then
    level2.mouse_logo="maus"
  end
  if x >= 650 and x <= 756 and y >= 350 and y <= 408 and button == "l" then
    level2.mouse_logo="kanone"
  end
  if x >= 650 and x <= 784 and y >= 200 and y <= 334 and button == "l" then
    level2.mouse_logo="fadenkreuz"
  end
  if x >= 650 and x <= 775 and y >= 450 and y <= 560 and button == "l" then
    level2.mouse_logo="mauer"
  end
  if x >= 270 and x <= 330 and y >= 270 and y <= 330 and button == "l" then
    if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon1 then
      mauer_new(1)
      level2.punkte=level2.punkte-5
      mauerGebaut.hexagon1=true
    else
      for i,v in ipairs(mauer) do
        if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-5
        end
      end
    end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon1 then
      kanone_new(1, 50, 40)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon1=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
  if x >= 270 and x <= 330 and y >= 350 and y <= 400 and button == "l" then
    if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon2 then
      mauer_new(2)
      level2.punkte=level2.punkte-5
      mauerGebaut.hexagon2=true
    else
      for i,v in ipairs(mauer) do
        if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-5
        end
      end
    end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon2 then
      kanone_new(2, 50, 40+87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon2=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 270 and x <= 330 and y >= 180 and y <= 240 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon3 then
      mauer_new(3)
      level2.punkte=level2.punkte-5
      mauerGebaut.hexagon3=true
    else
      for i,v in ipairs(mauer) do
        if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-5
        elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-5
        end
      end
    end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon3 then
      kanone_new(3, 50, 40-87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon3=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 340 and x <= 410 and y >= 230 and y <= 280 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon4 then
        mauer_new(4)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon4=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon4 then
      kanone_new(4, 50+75, 40-43.5)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon4=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 340 and x <= 410 and y >= 320 and y <= 360 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon5 then
        mauer_new(5)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon5=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon5 then
      kanone_new(5, 50+75, 40+43.5)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon5=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 190 and x <= 260 and y >= 230 and y <= 280 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon6 then
        mauer_new(6)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon6=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon6 then
      kanone_new(6, 50-75, 40-43.5)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon6=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 190 and x <= 260 and y >= 320 and y <= 360 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon7 then
        mauer_new(7)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon7=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon7 then
      kanone_new(7, 50-75, 40+43.5)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon7=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 420 and x <= 480 and y >= 270 and y <= 330 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon8 then
        mauer_new(8)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon8=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon8 then
      kanone_new(8, 50+150, 40)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon8=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 120 and x <= 180 and y >= 270 and y <= 330 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon9 then
        mauer_new(9)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon9=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon9 then
      kanone_new(9, 50-150, 40)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon9=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 270 and x <= 330 and y >= 100 and y <= 150 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon10 then
        mauer_new(10)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon10=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon10 then
      kanone_new(10, 50, 40-174)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon10=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 270 and x <= 330 and y >= 440 and y <= 500 and button == "l" then
        if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon11 then
        mauer_new(11)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon11=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon11 then
      kanone_new(11, 50, 40+174)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon11=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 340 and x <= 410 and y >= 400 and y <= 450 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon12 then
        mauer_new(12)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon12=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon12 then
      kanone_new(12, 50+75, 40+130)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon12=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 190 and x <= 260 and y >= 140 and y <= 190 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon13 then
        mauer_new(13)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon13=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon13 then
      kanone_new(13, 50-75, 40-130)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon13=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 340 and x <= 410 and y >= 140 and y <= 190 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon14 then
        mauer_new(14)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon14=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon14 then
      kanone_new(14, 50+75, 40-130)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon14=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 190 and x <= 260 and y >= 400 and y <= 450 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon15 then
        mauer_new(15)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon15=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon15 then
      kanone_new(15, 50-75, 40+130)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon15=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 420 and x <= 480 and y >= 350 and y <= 400 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon16 then
        mauer_new(16)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon16=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon16 then
      kanone_new(16, 50+150, 40+87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon16=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 120 and x <= 180 and y >= 180 and y <= 240 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon17 then
        mauer_new(17)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon17=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon17 then
      kanone_new(17, 50-150, 40-87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon17=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 120 and x <= 180 and y >= 350 and y <= 400 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon18 then
        mauer_new(18)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon18=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon18 then
      kanone_new(18, 50-150, 40+87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon18=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
    if x >= 420 and x <= 480 and y >= 180 and y <= 240 and button == "l" then
      if level2.mouse_logo=="mauer" and level2.punkte >= 5 and not mauerGebaut.hexagon19 then
        mauer_new(19)
        level2.punkte=level2.punkte-5
        mauerGebaut.hexagon19=true
      else
        for i,v in ipairs(mauer) do
          if level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==1 then
            v.level=2
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==2 then
            v.level=3
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==3 then
            v.level=4
            level2.punkte=level2.punkte-5
          elseif level2.mouse_logo=="mauer" and level2.punkte >= 5 and v.level==4 then
            v.level=5
            level2.punkte=level2.punkte-5
          end
        end
      end
    if level2.mouse_logo=="kanone" and level2.punkte >= 5 and not kanoneGebaut.hexagon19 then
      kanone_new(19, 50+150, 40-87)
      level2.punkte=level2.punkte-10
      kanoneGebaut.hexagon19=true
    else
      for i,v in ipairs(kanone) do
        if level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==1 then
          v.level=2
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==2 then
          v.level=3
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==3 then
          v.level=4
          level2.punkte=level2.punkte-10
        elseif level2.mouse_logo=="kanone" and level2.punkte >= 5 and v.level==4 then
          v.level=5
          level2.punkte=level2.punkte-10
        end
      end
    end
  end
end
 
gegner={}
einmal={
  gegner_timer=10;
  gegner_spawnTime=1;
  fertig_1=false;
  fertig_2=false;
  fertig_3=false;
  fertig_4=false;
  fertig_5=false;
  fertig_6=false;
  fertig_7=false;
  fertig_8=false;
  fertig_9=false;
  fertig_10=false;
  nummer=0;
}
  
function gegner_new(x, y, n, geschwindigkeit)
  local temp={
    x=x;
    y=y;
    leben=100;
    lebenZukunft=100;
    typ=math.random(1,8);
    nummer=n;
    geschwindigkeit=geschwindigkeit;
  }
  table.insert(gegner, temp)
end

function gegner_update(dt)
  kugeln_update(dt)
  if level2.welle == 1 and einmal.nummer == 5 and einmal.fertig_1 then
    level2.welle=0
    level2.welleVorher=2
    einmal.nummer=0
  elseif level2.welle == 2 and einmal.nummer == 10 and einmal.fertig_2 then
    level2.welle=0
    level2.welleVorher=3
    einmal.nummer=0
  elseif level2.welle == 3 and einmal.nummer == 15 and einmal.fertig_3 then
    level2.welle=0
    level2.welleVorher=4
    einmal.nummer=0
  elseif level2.welle == 4 and einmal.nummer == 20 and einmal.fertig_4 then
    level2.welle=0
    level2.welleVorher=5
    einmal.nummer=0
  elseif level2.welle == 5 and einmal.nummer == 25 and einmal.fertig_5 then
    level2.welle=0
    level2.welleVorher=6
    einmal.nummer=0
  elseif level2.welle == 6 and einmal.nummer == 30 and einmal.fertig_6 then
    level2.welle=0
    level2.welleVorher=7
    einmal.nummer=0
  elseif level2.welle == 7 and einmal.nummer == 35 and einmal.fertig_7 then
    level2.welle=0
    level2.welleVorher=8
    einmal.nummer=0
  elseif level2.welle == 8 and einmal.nummer == 40 and einmal.fertig_8 then
    level2.welle=0
    level2.welleVorher=9
    einmal.nummer=0
  elseif level2.welle == 9 and einmal.nummer == 45 and einmal.fertig_9 then
    level2.welle=0
    level2.welleVorher=10
    einmal.nummer=0
  elseif level2.welle == 10 and einmal.nummer == 50 and einmal.fertig_10 then
    spielTabelle.szene="Level 3"
  end
  if level2.welle == 1 then
    if einmal.nummer < 5 and not einmal.fertig_1 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_1=true
    end
  elseif level2.welle == 2 then
    if einmal.nummer < 10 and not einmal.fertig_2 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_2=true
    end
  elseif level2.welle == 3 then
    if einmal.nummer < 15 and not einmal.fertig_3 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_3=true
    end
  elseif level2.welle == 4 then
    if einmal.nummer < 20 and not einmal.fertig_4 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_4=true
    end
  elseif level2.welle == 5 then
    if einmal.nummer < 25 and not einmal.fertig_5 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_5=true
    end
  elseif level2.welle == 6 then
    if einmal.nummer < 30 and not einmal.fertig_6 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawnand and #gegner == 1 then
      einmal.fertig_6=true
    end
  elseif level2.welle == 7 then
    if einmal.nummer < 35 and not einmal.fertig_7 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_7=true
    end
  elseif level2.welle == 8 then
    if einmal.nummer < 40 and not einmal.fertig_8 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_8=true
    end
  elseif level2.welle == 9 then
    if einmal.nummer < 45 and not einmal.fertig_9 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_9=true
    end
  elseif level2.welle == 10 then
    if einmal.nummer < 50 and not einmal.fertig_10 then
      level2.gegnerSpawn=true
    else
      level2.gegnerSpawn=false
    end
    if not level2.gegnerSpawn and #gegner == 0 then
      einmal.fertig_10=true
    end
  end
  if level2.gegnerSpawn then
    einmal.gegner_timer=einmal.gegner_timer+dt
    if einmal.gegner_timer > einmal.gegner_spawnTime then
      local richtung = math.random(1,8)
      einmal.nummer=einmal.nummer+1
      if richtung == 1 then
        gegner_new(math.random(0, 375) -100, -100, einmal.nummer, 1)
      elseif richtung == 2 then
        gegner_new(math.random(400, 800) -100, -100, einmal.nummer, 1)
      elseif richtung == 3 then
        gegner_new(700, math.random(0, 375) -100, einmal.nummer, 1)
      elseif richtung == 4 then
        gegner_new(700, math.random(400, 800) -100, einmal.nummer, 1)
      elseif richtung == 5 then
        gegner_new(math.random(0, 375) -100, 700, einmal.nummer, 1)
      elseif richtung == 6 then
        gegner_new(math.random(400, 800) -100, 700, einmal.nummer, 1)
      elseif richtung == 7 then
        gegner_new(-100, math.random(0, 375) -100, einmal.nummer, 1)
      elseif richtung == 8 then
        gegner_new(-100, math.random(400, 800) -100, einmal.nummer, 1)
      end
      einmal.gegner_timer=0
    end
  end
  for i,v in ipairs(gegner) do
    local m = (290-v.y)/(300-v.x)
    x_bewegung=1/math.sqrt(1+m^2)
    y_bewegung=math.sqrt(1-(1/math.sqrt(1+m^2))^2)
    if v.x > 300 then
      x_bewegung = x_bewegung * -1
    end
    if v.y > 290 then
      y_bewegung = y_bewegung * -1
    end
    v.x=(v.x+x_bewegung*dt*50)*v.geschwindigkeit
    v.y=(v.y+y_bewegung*dt*50)*v.geschwindigkeit
    if v.leben<=0 then
      table.remove(gegner, i)
      for o,b in ipairs(kugeln) do
        if b.zielNummer==v.nummer then
          table.remove(kugeln, i)
        end
      end
    end
  end

end

function gegner_draw()
  for i,v in ipairs(gegner) do
    love.graphics.print(v.nummer, v.x, v.y)
    if v.x < 600 and v.nummer ~= 0 then
      if v.typ == 1 then
        love.graphics.draw(level2.virus_blau, v.x, v.y, 0, 1, sx, level2.virus_blau:getWidth()/ 2, level2.virus_blau:getHeight()/ 2)
      elseif v.typ == 2 then
        love.graphics.draw(level2.virus_gelb, v.x, v.y, 0, 1, sx, level2.virus_gelb:getWidth()/ 2, level2.virus_gelb:getHeight()/ 2)
      elseif v.typ == 3 then
        love.graphics.draw(level2.virus_gelb2, v.x, v.y, 0, 1, sx, level2.virus_gelb2:getWidth()/ 2, level2.virus_gelb2:getHeight()/ 2)
      elseif v.typ == 4 then
        love.graphics.draw(level2.virus_gruen, v.x, v.y, 0, 1, sx, level2.virus_gruen:getWidth()/ 2, level2.virus_gruen:getHeight()/ 2)
      elseif v.typ == 5 then
        love.graphics.draw(level2.virus_gruen2, v.x, v.y, 0, 1, sx, level2.virus_gruen2:getWidth()/ 2, level2.virus_gruen2:getHeight()/ 2)
      elseif v.typ == 6 then
        love.graphics.draw(level2.virus_pink, v.x, v.y, 0, 1, sx, level2.virus_pink:getWidth()/ 2, level2.virus_pink:getHeight()/ 2)
      elseif v.typ == 7 then
        love.graphics.draw(level2.virus_rot, v.x, v.y, 0, 1, sx, level2.virus_rot:getWidth()/ 2, level2.virus_rot:getHeight()/ 2)
      elseif v.typ == 8 then
        love.graphics.draw(level2.virus_rot2, v.x, v.y, 0, 1, sx, level2.virus_rot2:getWidth()/ 2, level2.virus_rot2:getHeight()/ 2)
      end
    end
  end
  love.graphics.print(einmal.gegner_timer, 100, 100)
  love.graphics.print(#gegner, 100, 150)
end

function gegner_mousepressed(x, y, button)
  for i,v in ipairs(gegner) do
    if x >= v.x - 22.5 and x <= v.x + 22.5 and  y >= v.y - 22.5 and y <= v.y + 22.5  and button=="l" and level2.mouse_logo=="fadenkreuz" then
      v.leben=v.leben-25
    end
  end
  if x >=  25 and x <= 225 and y >= 475 and y <= 575 and level2.welle == 0 and button == "l" then
    if level2.welleVorher == 2 then
      level2.welle=2
    elseif level2.welleVorher == 3 then
      level2.welle=3
    elseif level2.welleVorher == 4 then
      level2.welle=4
    elseif level2.welleVorher == 5 then
      level2.welle=5
    elseif level2.welleVorher == 6 then
      level2.welle=6
    elseif level2.welleVorher == 7 then
      level2.welle=7
    elseif level2.welleVorher == 8 then
      level2.welle=8
    elseif level2.welleVorher == 9 then
      level2.welle=9
    elseif level2.welleVorher == 10 then
      level2.welle=10
    else
      level2.welle=1
    end
  end
end

function mauer_draw()
  for i,v in ipairs(mauer) do
    if v.hexagon == 1 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x, level2.hexagon_y)
    elseif v.hexagon == 2 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x, level2.hexagon_y+87)
    elseif v.hexagon == 3 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x, level2.hexagon_y-87)
    elseif v.hexagon == 4 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+75, level2.hexagon_y-43.5)
    elseif v.hexagon == 5 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+75, level2.hexagon_y+43.5)
    elseif v.hexagon == 6 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-75, level2.hexagon_y-43.5)
    elseif v.hexagon == 7 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-75, level2.hexagon_y+43.5)
    elseif v.hexagon == 8 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+150, level2.hexagon_y)
    elseif v.hexagon == 9 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-150, level2.hexagon_y)
    elseif v.hexagon == 10 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x, level2.hexagon_y-174)
    elseif v.hexagon == 11 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x, level2.hexagon_y+174)
    elseif v.hexagon == 12 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+75, level2.hexagon_y+130)
    elseif v.hexagon == 13 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-75, level2.hexagon_y-130)
    elseif v.hexagon == 14 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+75, level2.hexagon_y-130)
    elseif v.hexagon == 15 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-75, level2.hexagon_y+130)
    elseif v.hexagon == 16 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+150, level2.hexagon_y+87)
    elseif v.hexagon == 17 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-150, level2.hexagon_y-87)
    elseif v.hexagon == 18 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x-150, level2.hexagon_y+87)
    elseif v.hexagon == 19 then
      love.graphics.draw(level2.hexagon_mauer, level2.hexagon_x+150, level2.hexagon_y-87)
    end
  end
end

kugeln={}

function kugeln_spawn(x, y, zielNummer, geschwindigkeit)
  for i,v in ipairs(gegner) do
    if v.nummer == zielNummer then
      v.lebenZukunft=v.lebenZukunft-10
    end
    local temp={
      x=x;
      y=y;
      zielNummer=zielNummer;
      geschwindigkeit=geschwindigkeit;
      lebenGegnerNachSchuss=v.lebenZukunft
    }
    table.insert(kugeln, temp)
  end
end

function kugeln_update(dt)
  for i,v in ipairs(kugeln) do
    for o,b in ipairs(gegner) do
      if v.zielNummer==b.nummer then
        if b.leben <= v.lebenGegnerNachSchuss then
          table.remove(kugeln, i)
          for p,n in ipairs(kanone) do
            local hexagonNummer
            hexagonNummer=n.hexagon
            kugeln_pruefen(n.hexagon)
          end
        end
      end
    end
    local m = (y_ziel-v.y)/(x_ziel-v.x)
    local x_bewegung=1/math.sqrt(1+m^2)
    local y_bewegung=math.sqrt(1-(1/math.sqrt(1+m^2))^2)
    if v.x > x_ziel then
      x_bewegung = x_bewegung*-1
    end
    if v.y > y_ziel then
      y_bewegung = y_bewegung*-1
    end
    if x_ziel >= 0 and x_ziel <= 600 and y_ziel >= 0 and y_ziel <= 600 then
      v.x=(v.x+x_bewegung)*v.geschwindigkeit
      v.y=(v.y+y_bewegung)*v.geschwindigkeit
    end
  end
  for zahl = 1, 19, 1 do
    kugeln_pruefen(zahl)
  end
end

function kugeln_draw()
  for i,v in ipairs(kugeln) do
    if v.zielNummer ~= 0 then
      love.graphics.circle("fill", v.x, v.y, 5)
      love.graphics.print(v.zielNummer, v.x, v.y)
    end
  end
  love.graphics.print(#kugeln.."  "..#kanone.."  "..#gegner, 400, 500)
  for i,v in ipairs(kanone) do
    local q
    if v.geschossen then
      q="true"
    else
      q="false"
    end
    love.graphics.print(q, 400, 550)
  end
end

function kugeln_pruefen(ziel_kanone)
  for i,v in ipairs(kanone) do
    if v.hexagon==ziel_kanone then
      for o,b in ipairs(gegner) do
        if v.geschossen==false then
          if b.nummer==1 then
            m1 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m1 < 0 then
              m1=m1*-1
            end
            if b.lebenZukunft == 0 then
              m1=0
            end
          elseif b.nummer==2 then
            m2 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m2 < 0 then
              m2=m2*-1
            end
            if b.lebenZukunft == 0 then
              m2=0
            end
          elseif b.nummer==3 then
            m3 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m3 < 0 then
              m3=m3*-1
            end
            if b.lebenZukunft == 0 then
              m3=0
            end
          elseif b.nummer==4 then
            m4 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m4 < 0 then
              m4=m4*-1
            end
            if b.lebenZukunft == 0 then
              m4=0
            end
          elseif b.nummer==5 then
            m5 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m5 < 0 then
              m5=m5*-1
            end
            if b.lebenZukunft == 0 then
              m5=0
            end
          elseif b.nummer==6 then
            m6 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m6 < 0 then
              m6=m6*-1
            end
            if b.lebenZukunft == 0 then
              m6=0
            end
          elseif b.nummer==7 then
            m7 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m7 < 0 then
              m7=m7*-1
            end
            if b.lebenZukunft == 0 then
              m7=0
            end
          elseif b.nummer==8 then
            m8 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m8 < 0 then
              m8=m8*-1
            end
            if b.lebenZukunft == 0 then
              m8=0
            end
          elseif b.nummer==9 then
            m9 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m9 < 0 then
              m9=m9*-1
            end
            if b.lebenZukunft == 0 then
              m9=0
            end
          elseif b.nummer==10 then
            m10 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m10 < 0 then
              m10=m10*-1
            end
            if b.lebenZukunft == 0 then
              m10=0
            end
          elseif b.nummer==11 then
            m11 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m11 < 0 then
              m11=m11*-1
            end
            if b.lebenZukunft == 0 then
              m11=0
            end
          elseif b.nummer==12 then
            m12 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m12 < 0 then
              m12=m12*-1
            end
            if b.lebenZukunft == 0 then
              m12=0
            end
          elseif b.nummer==13 then
            m13 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m13 < 0 then
              m13=m13*-1
            end
            if b.lebenZukunft == 0 then
              m13=0
            end
          elseif b.nummer==14 then
            m14 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m14 < 0 then
              m14=m14*-1
            end
            if b.lebenZukunft == 0 then
              m14=0
            end
          elseif b.nummer==15 then
            m15 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m15 < 0 then
              m15=m15*-1
            end
            if b.lebenZukunft == 0 then
              m15=0
            end
          elseif b.nummer==16 then
            m16 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m16 < 0 then
              m16=m16*-1
            end
            if b.lebenZukunft == 0 then
              m16=0
            end
          elseif b.nummer==17 then
            m17 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m17 < 0 then
              m17=m17*-1
            end
            if b.lebenZukunft == 0 then
              m17=0
            end
          elseif b.nummer==18 then
            m18 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m18 < 0 then
              m18=m18*-1
            end
            if b.lebenZukunft == 0 then
              m18=0
            end
          elseif b.nummer==19 then
            m19 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m19 < 0 then
              m19=m19*-1
            end
            if b.lebenZukunft == 0 then
              m19=0
            end
          elseif b.nummer==20 then
            m20 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m20 < 0 then
              m20=m20*-1
            end
            if b.lebenZukunft == 0 then
              m20=0
            end
          elseif b.nummer==21 then
            m21 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m21 < 0 then
              m21=m21*-1
            end
            if b.lebenZukunft == 0 then
              m21=0
            end
          elseif b.nummer==22 then
            m22 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m22 < 0 then
              m22=m22*-1
            end
            if b.lebenZukunft == 0 then
              m22=0
            end
          elseif b.nummer==23 then
            m23 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m23 < 0 then
              m23=m23*-1
            end
            if b.lebenZukunft == 0 then
              m23=0
            end
          elseif b.nummer==24 then
            m24 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m24 < 0 then
              m24=m24*-1
            end
            if b.lebenZukunft == 0 then
              m24=0
            end
          elseif b.nummer==25 then
            m25 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m25 < 0 then
              m25=m25*-1
            end
            if b.lebenZukunft == 0 then
              m25=0
            end
          elseif b.nummer==26 then
            m26 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m26 < 0 then
              m26=m26*-1
            end
            if b.lebenZukunft == 0 then
              m26=0
            end
          elseif b.nummer==27 then
            m27 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m27 < 0 then
              m27=m27*-1
            end
            if b.lebenZukunft == 0 then
              m27=0
            end
          elseif b.nummer==28 then
            m28 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m28 < 0 then
              m28=m28*-1
            end
            if b.lebenZukunft == 0 then
              m28=0
            end
          elseif b.nummer==29 then
            m29 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m29 < 0 then
              m29=m29*-1
            end
            if b.lebenZukunft == 0 then
              m29=0
            end
          elseif b.nummer==30 then
            m30 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m30 < 0 then
              m30=m30*-1
            end
            if b.lebenZukunft == 0 then
              m30=0
            end
          elseif b.nummer==31 then
            m31 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m31 < 0 then
              m31=m31*-1
            end
            if b.lebenZukunft == 0 then
              m31=0
            end
          elseif b.nummer==32 then
            m32 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m32 < 0 then
              m32=m32*-1
            end
            if b.lebenZukunft == 0 then
              m32=0
            end
          elseif b.nummer==33 then
            m33 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m33 < 0 then
              m33=m33*-1
            end
            if b.lebenZukunft == 0 then
              m33=0
            end
          elseif b.nummer==34 then
            m34 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m34 < 0 then
              m34=m34*-1
            end
            if b.lebenZukunft == 0 then
              m34=0
            end
          elseif b.nummer==35 then
            m35 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m35 < 0 then
              m35=m35*-1
            end
            if b.lebenZukunft == 0 then
              m35=0
            end
          elseif b.nummer==36 then
            m36 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m36 < 0 then
              m36=m36*-1
            end
            if b.lebenZukunft == 0 then
              m36=0
            end
          elseif b.nummer==37 then
            m37 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m37 < 0 then
              m37=m37*-1
            end
            if b.lebenZukunft == 0 then
              m37=0
            end
          elseif b.nummer==38 then
            m38 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m38 < 0 then
              m38=m38*-1
            end
            if b.lebenZukunft == 0 then
              m38=0
            end
          elseif b.nummer==39 then
            m39 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m39 < 0 then
              m39=m39*-1
            end
            if b.lebenZukunft == 0 then
              m39=0
            end
          elseif b.nummer==40 then
            m40 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m40 < 0 then
              m40=m40*-1
            end
            if b.lebenZukunft == 0 then
              m40=0
            end
          elseif b.nummer==41 then
            m41 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m41 < 0 then
              m41=m41*-1
            end
            if b.lebenZukunft == 0 then
              m41=0
            end
          elseif b.nummer==42 then
            m42 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m42 < 0 then
              m42=m42*-1
            end
            if b.lebenZukunft == 0 then
              m42=0
            end
          elseif b.nummer==43 then
            m43 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m43 < 0 then
              m43=m43*-1
            end
            if b.lebenZukunft == 0 then
              m43=0
            end
          elseif b.nummer==44 then
            m44 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m44 < 0 then
              m44=m44*-1
            end
            if b.lebenZukunft == 0 then
              m44=0
            end
          elseif b.nummer==45 then
            m45 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m45 < 0 then
              m45=m45*-1
            end
            if b.lebenZukunft == 0 then
              m45=0
            end
          elseif b.nummer==46 then
            m46 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m46 < 0 then
              m46=m46*-1
            end
            if b.lebenZukunft == 0 then
              m46=0
            end
          elseif b.nummer==47 then
            m47 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m47 < 0 then
              m47=m47*-1
            end
            if b.lebenZukunft == 0 then
              m47=0
            end
          elseif b.nummer==48 then
            m48 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m48 < 0 then
              m48=m48*-1
            end
            if b.lebenZukunft == 0 then
              m48=0
            end
          elseif b.nummer==49 then
            m49 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m49 < 0 then
              m49=m49*-1
            end
            if b.lebenZukunft == 0 then
              m49=0
            end
          elseif b.nummer==50 then
            m50 = (b.y-level2.hexagon_y + v.y)/(b.x-level2.hexagon_x  + v.x)
            if m50 < 0 then
              m50=m50*-1
            end
            if b.lebenZukunft == 0 then
              m50=0
            end
          end
          if m1 > m2 and m1 > m3 and m1 > m4 and m1 > m5 and m1 > m6 and m1 > m7 and m1 > m8 and m1 > m9 and m1 > m10 and  m1 > m11 and m1 > m12 and m1 > m13 and m1 > m14 and m1 > m15 and m1 > m16 and m1 > m17 and m1 > m18 and m1 > m19 and m1 > m20 and m1 > m21 and m1 > m22 and m1 > m23 and m1 > m24 and m1 > m25 and m1 > m26 and m1 > m27 and m1 > m28 and m1 > m29 and m1 > m30 and m1 > m31 and m1 > m32 and m1 > m33 and m1 > m34 and m1 > m35 and m1 > m36 and m1 > m37 and m1 > m38 and m1 > m39 and m1 > m40 and m1 > m41 and m1 > m42 and m1 > m43 and m1 > m44 and m1 > m45 and m1 > m46 and m1 > m47 and m1 > m48 and m1 > m49 and m1 > m50 and level2.welle >= 1 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 1, 1)
            v.geschossen=true
          elseif m2 > m1 and m2 > m3 and m2 > m4 and m2 > m5 and m2 > m6 and m2 > m7 and m2 > m8 and m2 > m9 and m2 > m10 and  m2 > m11 and m2 > m12 and m2 > m13 and m2 > m14 and m2 > m15 and m2 > m16 and m2 > m17 and m2 > m18 and m2 > m19 and m2 > m20 and m2 > m21 and m2 > m22 and m2 > m23 and m2 > m24 and m2 > m25 and m2 > m26 and m2 > m27 and m2 > m28 and m2 > m29 and m2 > m30 and m2 > m31 and m2 > m32 and m2 > m33 and m2 > m34 and m2 > m35 and m2 > m36 and m2 > m37 and m2 > m38 and m2 > m39 and m2 > m40 and m2 > m41 and m2 > m42 and m2 > m43 and m2 > m44 and m2 > m45 and m2 > m46 and m2 > m47 and m2 > m48 and m2 > m49 and m2 > m50 and level2.welle >= 1 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 2, 1)
            v.geschossen=true
          elseif m3 > m1 and m3 > m2 and m3 > m4 and m3 > m5 and m3 > m6 and m3 > m7 and m3 > m8 and m3 > m9 and m3 > m10 and  m3 > m11 and m3 > m12 and m3 > m13 and m3 > m14 and m3 > m15 and m3 > m16 and m3 > m17 and m3 > m18 and m3 > m19 and m3 > m20 and m3 > m21 and m3 > m22 and m3 > m23 and m3 > m24 and m3 > m25 and m3 > m26 and m3 > m27 and m3 > m28 and m3 > m29 and m3 > m30 and m3 > m31 and m3 > m32 and m3 > m33 and m3 > m34 and m3 > m35 and m3 > m36 and m3 > m37 and m3 > m38 and m3 > m39 and m3 > m40 and m3 > m41 and m3 > m42 and m3 > m43 and m3 > m44 and m3 > m45 and m3 > m46 and m3 > m47 and m3 > m48 and m3 > m49 and m3 > m50 and level2.welle >= 1 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 3, 1)
            v.geschossen=true
          elseif m4 > m1 and m4 > m2 and m4 > m3 and m4 > m5 and m4 > m6 and m4 > m7 and m4 > m8 and m4 > m9 and m4 > m10 and  m4 > m11 and m4 > m12 and m4 > m13 and m4 > m14 and m4 > m15 and m4 > m16 and m4 > m17 and m4 > m18 and m4 > m19 and m4 > m20 and m4 > m21 and m4 > m22 and m4 > m23 and m4 > m24 and m4 > m25 and m4 > m26 and m4 > m27 and m4 > m28 and m4 > m29 and m4 > m30 and m4 > m31 and m4 > m32 and m4 > m33 and m4 > m34 and m4 > m35 and m4 > m36 and m4 > m37 and m4 > m38 and m4 > m39 and m4 > m40 and m4 > m41 and m4 > m42 and m4 > m43 and m4 > m44 and m4 > m45 and m4 > m46 and m4 > m47 and m4 > m48 and m4 > m49 and m4 > m50 and level2.welle >= 1 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 4, 1)
            v.geschossen=true
          elseif m5 > m2 and m5 > m3 and m5 > m4 and m5 > m1 and m5 > m6 and m5 > m7 and m5 > m8 and m5 > m9 and m5 > m10 and  m5 > m11 and m5 > m12 and m5 > m13 and m5 > m14 and m5 > m15 and m5 > m16 and m5 > m17 and m5 > m18 and m5 > m19 and m5 > m20 and m5 > m21 and m5 > m22 and m5 > m23 and m5 > m24 and m5 > m25 and m5 > m26 and m5 > m27 and m5 > m28 and m5 > m29 and m5 > m30 and m5 > m31 and m5 > m32 and m5 > m33 and m5 > m34 and m5 > m35 and m5 > m36 and m5 > m37 and m5 > m38 and m5 > m39 and m5 > m40 and m5 > m41 and m5 > m42 and m5 > m43 and m5 > m44 and m5 > m45 and m5 > m46 and m5 > m47 and m5 > m48 and m5 > m49 and m5 > m50 and level2.welle >= 1 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 5, 1)
            v.geschossen=true
          elseif m6 > m2 and m6 > m3 and m6 > m4 and m6 > m5 and m6 > m1 and m6 > m7 and m6 > m8 and m6 > m9 and m6 > m10 and  m6 > m11 and m6 > m12 and m6 > m13 and m6 > m14 and m6 > m15 and m6 > m16 and m6 > m17 and m6 > m18 and m6 > m19 and m6 > m20 and m6 > m21 and m6 > m22 and m6 > m23 and m6 > m24 and m6 > m25 and m6 > m26 and m6 > m27 and m6 > m28 and m6 > m29 and m6 > m30 and m6 > m31 and m6 > m32 and m6 > m33 and m6 > m34 and m6 > m35 and m6 > m36 and m6 > m37 and m6 > m38 and m6 > m39 and m6 > m40 and m6 > m41 and m6 > m42 and m6 > m43 and m6 > m44 and m6 > m45 and m6 > m46 and m6 > m47 and m6 > m48 and m6 > m49 and m6 > m50 and level2.welle >= 2 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 6, 1)
            v.geschossen=true
          elseif m7 > m2 and m7 > m3 and m7 > m4 and m7 > m5 and m7 > m6 and m7 > m1 and m7 > m8 and m7 > m9 and m7 > m10 and  m7 > m11 and m7 > m12 and m7 > m13 and m7 > m14 and m7 > m15 and m7 > m16 and m7 > m17 and m7 > m18 and m7 > m19 and m7 > m20 and m7 > m21 and m7 > m22 and m7 > m23 and m7 > m24 and m7 > m25 and m7 > m26 and m7 > m27 and m7 > m28 and m7 > m29 and m7 > m30 and m7 > m31 and m7 > m32 and m7 > m33 and m7 > m34 and m7 > m35 and m7 > m36 and m7 > m37 and m7 > m38 and m7 > m39 and m7 > m40 and m7 > m41 and m7 > m42 and m7 > m43 and m7 > m44 and m7 > m45 and m7 > m46 and m7 > m47 and m7 > m48 and m7 > m49 and m7 > m50 and level2.welle >= 2 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 7, 1)
            v.geschossen=true
          elseif m8 > m2 and m8 > m3 and m8 > m4 and m8 > m5 and m8 > m6 and m8 > m7 and m8 > m1 and m8 > m9 and m8 > m10 and  m8 > m11 and m8 > m12 and m8 > m13 and m8 > m14 and m8 > m15 and m8 > m16 and m8 > m17 and m8 > m18 and m8 > m19 and m8 > m20 and m8 > m21 and m8 > m22 and m8 > m23 and m8 > m24 and m8 > m25 and m8 > m26 and m8 > m27 and m8 > m28 and m8 > m29 and m8 > m30 and m8 > m31 and m8 > m32 and m8 > m33 and m8 > m34 and m8 > m35 and m8 > m36 and m8 > m37 and m8 > m38 and m8 > m39 and m8 > m40 and m8 > m41 and m8 > m42 and m8 > m43 and m8 > m44 and m8 > m45 and m8 > m46 and m8 > m47 and m8 > m48 and m8 > m49 and m8 > m50 and level2.welle >= 2 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 8, 1)
            v.geschossen=true
          elseif m9 > m2 and m9 > m3 and m9 > m4 and m9 > m5 and m9 > m6 and m9 > m7 and m9 > m8 and m9 > m1 and m9 > m10 and  m9 > m11 and m9 > m12 and m9 > m13 and m9 > m14 and m9 > m15 and m9 > m16 and m9 > m17 and m9 > m18 and m9 > m19 and m9 > m20 and m9 > m21 and m9 > m22 and m9 > m23 and m9 > m24 and m9 > m25 and m9 > m26 and m9 > m27 and m9 > m28 and m9 > m29 and m9 > m30 and m9 > m31 and m9 > m32 and m9 > m33 and m9 > m34 and m9 > m35 and m9 > m36 and m9 > m37 and m9 > m38 and m9 > m39 and m9 > m40 and m9 > m41 and m9 > m42 and m9 > m43 and m9 > m44 and m9 > m45 and m9 > m46 and m9 > m47 and m9 > m48 and m9 > m49 and m9 > m50 and level2.welle >= 2 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 9, 1)
            v.geschossen=true
          elseif m10 > m2 and m10 > m3 and m10 > m4 and m10 > m5 and m10 > m6 and m10 > m7 and m10 > m8 and m10 > m9 and m10 > m1 and  m10 > m11 and m10 > m12 and m10 > m13 and m10 > m14 and m10 > m15 and m10 > m16 and m10 > m17 and m10 > m18 and m10 > m19 and m10 > m20 and m10 > m21 and m10 > m22 and m10 > m23 and m10 > m24 and m10 > m25 and m10 > m26 and m10 > m27 and m10 > m28 and m10 > m29 and m10 > m30 and m10 > m31 and m10 > m32 and m10 > m33 and m10 > m34 and m10 > m35 and m10 > m36 and m10 > m37 and m10 > m38 and m10 > m39 and m10 > m40 and m10 > m41 and m10 > m42 and m10 > m43 and m10 > m44 and m10 > m45 and m10 > m46 and m10 > m47 and m10 > m48 and m10 > m49 and m10 > m50 and level2.welle >= 2 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 10, 1)
            v.geschossen=true
          elseif m11 > m2 and m11 > m3 and m11 > m4 and m11 > m5 and m11 > m6 and m11 > m7 and m11 > m8 and m11 > m9 and m11 > m10 and  m11 > m1 and m11 > m12 and m11 > m13 and m11 > m14 and m11 > m15 and m11 > m16 and m11 > m17 and m11 > m18 and m11 > m19 and m11 > m20 and m11 > m21 and m11 > m22 and m11 > m23 and m11 > m24 and m11 > m25 and m11 > m26 and m11 > m27 and m11 > m28 and m11 > m29 and m11 > m30 and m11 > m31 and m11 > m32 and m11 > m33 and m11 > m34 and m11 > m35 and m11 > m36 and m11 > m37 and m11 > m38 and m11 > m39 and m11 > m40 and m11 > m41 and m11 > m42 and m11 > m43 and m11 > m44 and m11 > m45 and m11 > m46 and m11 > m47 and m11 > m48 and m11 > m49 and m11 > m50 and level2.welle >= 3 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 11, 1)
            v.geschossen=true
          elseif m12 > m2 and m12 > m3 and m12 > m4 and m12 > m5 and m12 > m6 and m12 > m7 and m12 > m8 and m12 > m9 and m12 > m10 and  m12 > m11 and m12 > m1 and m12 > m13 and m12 > m14 and m12 > m15 and m12 > m16 and m12 > m17 and m12 > m18 and m12 > m19 and m12 > m20 and m12 > m21 and m12 > m22 and m12 > m23 and m12 > m24 and m12 > m25 and m12 > m26 and m12 > m27 and m12 > m28 and m12 > m29 and m12 > m30 and m12 > m31 and m12 > m32 and m12 > m33 and m12 > m34 and m12 > m35 and m12 > m36 and m12 > m37 and m12 > m38 and m12 > m39 and m12 > m40 and m12 > m41 and m12 > m42 and m12 > m43 and m12 > m44 and m12 > m45 and m12 > m46 and m12 > m47 and m12 > m48 and m12 > m49 and m12 > m50 and level2.welle >= 3 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 12, 1)
            v.geschossen=true
          elseif m13 > m2 and m13 > m3 and m13 > m4 and m13 > m5 and m13 > m6 and m13 > m7 and m13 > m8 and m13 > m9 and m13 > m10 and  m13 > m11 and m13 > m12 and m13 > m1 and m13 > m14 and m13 > m15 and m13 > m16 and m13 > m17 and m13 > m18 and m13 > m19 and m13 > m20 and m13 > m21 and m13 > m22 and m13 > m23 and m13 > m24 and m13 > m25 and m13 > m26 and m13 > m27 and m13 > m28 and m13 > m29 and m13 > m30 and m13 > m31 and m13 > m32 and m13 > m33 and m13 > m34 and m13 > m35 and m13 > m36 and m13 > m37 and m13 > m38 and m13 > m39 and m13 > m40 and m13 > m41 and m13 > m42 and m13 > m43 and m13 > m44 and m13 > m45 and m13 > m46 and m13 > m47 and m13 > m48 and m13 > m49 and m13 > m50 and level2.welle >= 3 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 13, 1)
            v.geschossen=true
          elseif m14 > m2 and m14 > m3 and m14 > m4 and m14 > m5 and m14 > m6 and m14 > m7 and m14 > m8 and m14 > m9 and m14 > m10 and  m14 > m11 and m14 > m12 and m14 > m13 and m14 > m1 and m14 > m15 and m14 > m16 and m14 > m17 and m14 > m18 and m14 > m19 and m14 > m20 and m14 > m21 and m14 > m22 and m14 > m23 and m14 > m24 and m14 > m25 and m14 > m26 and m14 > m27 and m14 > m28 and m14 > m29 and m14 > m30 and m14 > m31 and m14 > m32 and m14 > m33 and m14 > m34 and m14 > m35 and m14 > m36 and m14 > m37 and m14 > m38 and m14 > m39 and m14 > m40 and m14 > m41 and m14 > m42 and m14 > m43 and m14 > m44 and m14 > m45 and m14 > m46 and m14 > m47 and m14 > m48 and m14 > m49 and m14 > m50 and level2.welle >= 3 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 14, 1)
            v.geschossen=true
          elseif m15 > m2 and m15 > m3 and m15 > m4 and m15 > m5 and m15 > m6 and m15 > m7 and m15 > m8 and m15 > m9 and m15 > m10 and  m15 > m11 and m15 > m12 and m15 > m13 and m15 > m14 and m15 > m1 and m15 > m16 and m15 > m17 and m15 > m18 and m15 > m19 and m15 > m20 and m15 > m21 and m15 > m22 and m15 > m23 and m15 > m24 and m15 > m25 and m15 > m26 and m15 > m27 and m15 > m28 and m15 > m29 and m15 > m30 and m15 > m31 and m15 > m32 and m15 > m33 and m15 > m34 and m15 > m35 and m15 > m36 and m15 > m37 and m15 > m38 and m15 > m39 and m15 > m40 and m15 > m41 and m15 > m42 and m15 > m43 and m15 > m44 and m15 > m45 and m15 > m46 and m15 > m47 and m15 > m48 and m15 > m49 and m15 > m50 and level2.welle >= 3 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 15, 1)
            v.geschossen=true
          elseif m16 > m2 and m16 > m3 and m16 > m4 and m16 > m5 and m16 > m6 and m16 > m7 and m16 > m8 and m16 > m9 and m16 > m10 and  m16 > m11 and m16 > m12 and m16 > m13 and m16 > m14 and m16 > m15 and m16 > m1 and m16 > m17 and m16 > m18 and m16 > m19 and m16 > m20 and m16 > m21 and m16 > m22 and m16 > m23 and m16 > m24 and m16 > m25 and m16 > m26 and m16 > m27 and m16 > m28 and m16 > m29 and m16 > m30 and m16 > m31 and m16 > m32 and m16 > m33 and m16 > m34 and m16 > m35 and m16 > m36 and m16 > m37 and m16 > m38 and m16 > m39 and m16 > m40 and m16 > m41 and m16 > m42 and m16 > m43 and m16 > m44 and m16 > m45 and m16 > m46 and m16 > m47 and m16 > m48 and m16 > m49 and m16 > m50 and level2.welle >= 4 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 16, 1)
            v.geschossen=true
          elseif m17 > m2 and m17 > m3 and m17 > m4 and m17 > m5 and m17 > m6 and m17 > m7 and m17 > m8 and m17 > m9 and m17 > m10 and  m17 > m11 and m17 > m12 and m17 > m13 and m17 > m14 and m17 > m15 and m17 > m16 and m17 > m1 and m17 > m18 and m17 > m19 and m17 > m20 and m17 > m21 and m17 > m22 and m17 > m23 and m17 > m24 and m17 > m25 and m17 > m26 and m17 > m27 and m17 > m28 and m17 > m29 and m17 > m30 and m17 > m31 and m17 > m32 and m17 > m33 and m17 > m34 and m17 > m35 and m17 > m36 and m17 > m37 and m17 > m38 and m17 > m39 and m17 > m40 and m17 > m41 and m17 > m42 and m17 > m43 and m17 > m44 and m17 > m45 and m17 > m46 and m17 > m47 and m17 > m48 and m17 > m49 and m17 > m50 and level2.welle >= 4 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 17, 1)
            v.geschossen=true
          elseif m18 > m2 and m18 > m3 and m18 > m4 and m18 > m5 and m18 > m6 and m18 > m7 and m18 > m8 and m18 > m9 and m18 > m10 and  m18 > m11 and m18 > m12 and m18 > m13 and m18 > m14 and m18 > m15 and m18 > m16 and m18 > m17 and m18 > m1 and m18 > m19 and m18 > m20 and m18 > m21 and m18 > m22 and m18 > m23 and m18 > m24 and m18 > m25 and m18 > m26 and m18 > m27 and m18 > m28 and m18 > m29 and m18 > m30 and m18 > m31 and m18 > m32 and m18 > m33 and m18 > m34 and m18 > m35 and m18 > m36 and m18 > m37 and m18 > m38 and m18 > m39 and m18 > m40 and m18 > m41 and m18 > m42 and m18 > m43 and m18 > m44 and m18 > m45 and m18 > m46 and m18 > m47 and m18 > m48 and m18 > m49 and m18 > m50 and level2.welle >= 4 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 18, 1)
            v.geschossen=true
          elseif m19 > m2 and m19 > m3 and m19 > m4 and m19 > m5 and m19 > m6 and m19 > m7 and m19 > m8 and m19 > m9 and m19 > m10 and  m19 > m11 and m19 > m12 and m19 > m13 and m19 > m14 and m19 > m15 and m19 > m16 and m19 > m17 and m19 > m18 and m19 > m1 and m19 > m20 and m19 > m21 and m19 > m22 and m19 > m23 and m19 > m24 and m19 > m25 and m19 > m26 and m19 > m27 and m19 > m28 and m19 > m29 and m19 > m30 and m19 > m31 and m19 > m32 and m19 > m33 and m19 > m34 and m19 > m35 and m19 > m36 and m19 > m37 and m19 > m38 and m19 > m39 and m19 > m40 and m19 > m41 and m19 > m42 and m19 > m43 and m19 > m44 and m19 > m45 and m19 > m46 and m19 > m47 and m19 > m48 and m19 > m49 and m19 > m50 and level2.welle >= 4 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 19, 1)
            v.geschossen=true
          elseif m20 > m2 and m20 > m3 and m20 > m4 and m20 > m5 and m20 > m6 and m20 > m7 and m20 > m8 and m20 > m9 and m20 > m10 and  m20 > m11 and m20 > m12 and m20 > m13 and m20 > m14 and m20 > m15 and m20 > m16 and m20 > m17 and m20 > m18 and m20 > m19 and m20 > m1 and m20 > m21 and m20 > m22 and m20 > m23 and m20 > m24 and m20 > m25 and m20 > m26 and m20 > m27 and m20 > m28 and m20 > m29 and m20 > m30 and m20 > m31 and m20 > m32 and m20 > m33 and m20 > m34 and m20 > m35 and m20 > m36 and m20 > m37 and m20 > m38 and m20 > m39 and m20 > m40 and m20 > m41 and m20 > m42 and m20 > m43 and m20 > m44 and m20 > m45 and m20 > m46 and m20 > m47 and m20 > m48 and m20 > m49 and m20 > m50 and level2.welle >= 4 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 20, 1)
            v.geschossen=true
          elseif m21 > m2 and m21 > m3 and m21 > m4 and m21 > m5 and m21 > m6 and m21 > m7 and m21 > m8 and m21 > m9 and m21 > m10 and  m21 > m11 and m21 > m12 and m21 > m13 and m21 > m14 and m21 > m15 and m21 > m16 and m21 > m17 and m21 > m18 and m21 > m19 and m21 > m20 and m21 > m1 and m21 > m22 and m21 > m23 and m21 > m24 and m21 > m25 and m21 > m26 and m21 > m27 and m21 > m28 and m21 > m29 and m21 > m30 and m21 > m31 and m21 > m32 and m21 > m33 and m21 > m34 and m21 > m35 and m21 > m36 and m21 > m37 and m21 > m38 and m21 > m39 and m21 > m40 and m21 > m41 and m21 > m42 and m21 > m43 and m21 > m44 and m21 > m45 and m21 > m46 and m21 > m47 and m21 > m48 and m21 > m49 and m21 > m50 and level2.welle >= 5 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 21, 1)
            v.geschossen=true
          elseif m22 > m2 and m22 > m3 and m22 > m4 and m22 > m5 and m22 > m6 and m22 > m7 and m22 > m8 and m22 > m9 and m22 > m10 and  m22 > m11 and m22 > m12 and m22 > m13 and m22 > m14 and m22 > m15 and m22 > m16 and m22 > m17 and m22 > m18 and m22 > m19 and m22 > m20 and m22 > m21 and m22 > m1 and m22 > m23 and m22 > m24 and m22 > m25 and m22 > m26 and m22 > m27 and m22 > m28 and m22 > m29 and m22 > m30 and m22 > m31 and m22 > m32 and m22 > m33 and m22 > m34 and m22 > m35 and m22 > m36 and m22 > m37 and m22 > m38 and m22 > m39 and m22 > m40 and m22 > m41 and m22 > m42 and m22 > m43 and m22 > m44 and m22 > m45 and m22 > m46 and m22 > m47 and m22 > m48 and m22 > m49 and m22 > m50 and level2.welle >= 5 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 22, 1)
            v.geschossen=true
          elseif m23 > m2 and m23 > m3 and m23 > m4 and m23 > m5 and m23 > m6 and m23 > m7 and m23 > m8 and m23 > m9 and m23 > m10 and  m23 > m11 and m23 > m12 and m23 > m13 and m23 > m14 and m23 > m15 and m23 > m16 and m23 > m17 and m23 > m18 and m23 > m19 and m23 > m20 and m23 > m21 and m23 > m22 and m23 > m1 and m23 > m24 and m23 > m25 and m23 > m26 and m23 > m27 and m23 > m28 and m23 > m29 and m23 > m30 and m23 > m31 and m23 > m32 and m23 > m33 and m23 > m34 and m23 > m35 and m23 > m36 and m23 > m37 and m23 > m38 and m23 > m39 and m23 > m40 and m23 > m41 and m23 > m42 and m23 > m43 and m23 > m44 and m23 > m45 and m23 > m46 and m23 > m47 and m23 > m48 and m23 > m49 and m23 > m50 and level2.welle >= 5 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 23, 1)
            v.geschossen=true
          elseif m24 > m2 and m24 > m3 and m24 > m4 and m24 > m5 and m24 > m6 and m24 > m7 and m24 > m8 and m24 > m9 and m24 > m10 and  m24 > m11 and m24 > m12 and m24 > m13 and m24 > m14 and m24 > m15 and m24 > m16 and m24 > m17 and m24 > m18 and m24 > m19 and m24 > m20 and m24 > m21 and m24 > m22 and m24 > m23 and m24 > m1 and m24 > m25 and m24 > m26 and m24 > m27 and m24 > m28 and m24 > m29 and m24 > m30 and m24 > m31 and m24 > m32 and m24 > m33 and m24 > m34 and m24 > m35 and m24 > m36 and m24 > m37 and m24 > m38 and m24 > m39 and m24 > m40 and m24 > m41 and m24 > m42 and m24 > m43 and m24 > m44 and m24 > m45 and m24 > m46 and m24 > m47 and m24 > m48 and m24 > m49 and m24 > m50 and level2.welle >= 5 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 24, 1)
            v.geschossen=true
          elseif m25 > m2 and m25 > m3 and m25 > m4 and m25 > m5 and m25 > m6 and m25 > m7 and m25 > m8 and m25 > m9 and m25 > m10 and  m25 > m11 and m25 > m12 and m25 > m13 and m25 > m14 and m25 > m15 and m25 > m16 and m25 > m17 and m25 > m18 and m25 > m19 and m25 > m20 and m25 > m21 and m25 > m22 and m25 > m23 and m25 > m24 and m25 > m1 and m25 > m26 and m25 > m27 and m25 > m28 and m25 > m29 and m25 > m30 and m25 > m31 and m25 > m32 and m25 > m33 and m25 > m34 and m25 > m35 and m25 > m36 and m25 > m37 and m25 > m38 and m25 > m39 and m25 > m40 and m25 > m41 and m25 > m42 and m25 > m43 and m25 > m44 and m25 > m45 and m25 > m46 and m25 > m47 and m25 > m48 and m25 > m49 and m25 > m50 and level2.welle >= 5 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 25, 1)
            v.geschossen=true
          elseif m26 > m2 and m26 > m3 and m26 > m4 and m26 > m5 and m26 > m6 and m26 > m7 and m26 > m8 and m26 > m9 and m26 > m10 and  m26 > m11 and m26 > m12 and m26 > m13 and m26 > m14 and m26 > m15 and m26 > m16 and m26 > m17 and m26 > m18 and m26 > m19 and m26 > m20 and m26 > m21 and m26 > m22 and m26 > m23 and m26 > m24 and m26 > m25 and m26 > m1 and m26 > m27 and m26 > m28 and m26 > m29 and m26 > m30 and m26 > m31 and m26 > m32 and m26 > m33 and m26 > m34 and m26 > m35 and m26 > m36 and m26 > m37 and m26 > m38 and m26 > m39 and m26 > m40 and m26 > m41 and m26 > m42 and m26 > m43 and m26 > m44 and m26 > m45 and m26 > m46 and m26 > m47 and m26 > m48 and m26 > m49 and m26 > m50 and level2.welle >= 6 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 26, 1)
            v.geschossen=true
          elseif m27 > m2 and m27 > m3 and m27 > m4 and m27 > m5 and m27 > m6 and m27 > m7 and m27 > m8 and m27 > m9 and m27 > m10 and  m27 > m11 and m27 > m12 and m27 > m13 and m27 > m14 and m27 > m15 and m27 > m16 and m27 > m17 and m27 > m18 and m27 > m19 and m27 > m20 and m27 > m21 and m27 > m22 and m27 > m23 and m27 > m24 and m27 > m25 and m27 > m26 and m27 > m1 and m27 > m28 and m27 > m29 and m27 > m30 and m27 > m31 and m27 > m32 and m27 > m33 and m27 > m34 and m27 > m35 and m27 > m36 and m27 > m37 and m27 > m38 and m27 > m39 and m27 > m40 and m27 > m41 and m27 > m42 and m27 > m43 and m27 > m44 and m27 > m45 and m27 > m46 and m27 > m47 and m27 > m48 and m27 > m49 and m27 > m50 and level2.welle >= 6 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 27, 1)
            v.geschossen=true
          elseif m28 > m2 and m28 > m3 and m28 > m4 and m28 > m5 and m28 > m6 and m28 > m7 and m28 > m8 and m28 > m9 and m28 > m10 and  m28 > m11 and m28 > m12 and m28 > m13 and m28 > m14 and m28 > m15 and m28 > m16 and m28 > m17 and m28 > m18 and m28 > m19 and m28 > m20 and m28 > m21 and m28 > m22 and m28 > m23 and m28 > m24 and m28 > m25 and m28 > m26 and m28 > m27 and m28 > m1 and m28 > m29 and m28 > m30 and m28 > m31 and m28 > m32 and m28 > m33 and m28 > m34 and m28 > m35 and m28 > m36 and m28 > m37 and m28 > m38 and m28 > m39 and m28 > m40 and m28 > m41 and m28 > m42 and m28 > m43 and m28 > m44 and m28 > m45 and m28 > m46 and m28 > m47 and m28 > m48 and m28 > m49 and m28 > m50 and level2.welle >= 6 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 28, 1)
            v.geschossen=true
          elseif m29 > m2 and m29 > m3 and m29 > m4 and m29 > m5 and m29 > m6 and m29 > m7 and m29 > m8 and m29 > m9 and m29 > m10 and  m29 > m11 and m29 > m12 and m29 > m13 and m29 > m14 and m29 > m15 and m29 > m16 and m29 > m17 and m29 > m18 and m29 > m19 and m29 > m20 and m29 > m21 and m29 > m22 and m29 > m23 and m29 > m24 and m29 > m25 and m29 > m26 and m29 > m27 and m29 > m28 and m29 > m1 and m29 > m30 and m29 > m31 and m29 > m32 and m29 > m33 and m29 > m34 and m29 > m35 and m29 > m36 and m29 > m37 and m29 > m38 and m29 > m39 and m29 > m40 and m29 > m41 and m29 > m42 and m29 > m43 and m29 > m44 and m29 > m45 and m29 > m46 and m29 > m47 and m29 > m48 and m29 > m49 and m29 > m50 and level2.welle >= 6 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 29, 1)
            v.geschossen=true
          elseif m30 > m2 and m30 > m3 and m30 > m4 and m30 > m5 and m30 > m6 and m30 > m7 and m30 > m8 and m30 > m9 and m30 > m10 and  m30 > m11 and m30 > m12 and m30 > m13 and m30 > m14 and m30 > m15 and m30 > m16 and m30 > m17 and m30 > m18 and m30 > m19 and m30 > m20 and m30 > m21 and m30 > m22 and m30 > m23 and m30 > m24 and m30 > m25 and m30 > m26 and m30 > m27 and m30 > m28 and m30 > m29 and m30 > m1 and m30 > m31 and m30 > m32 and m30 > m33 and m30 > m34 and m30 > m35 and m30 > m36 and m30 > m37 and m30 > m38 and m30 > m39 and m30 > m40 and m30 > m41 and m30 > m42 and m30 > m43 and m30 > m44 and m30 > m45 and m30 > m46 and m30 > m47 and m30 > m48 and m30 > m49 and m30 > m50 and level2.welle >= 6 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 30, 1)
            v.geschossen=true
          elseif m31 > m2 and m31 > m3 and m31 > m4 and m31 > m5 and m31 > m6 and m31 > m7 and m31 > m8 and m31 > m9 and m31 > m10 and  m31 > m11 and m31 > m12 and m31 > m13 and m31 > m14 and m31 > m15 and m31 > m16 and m31 > m17 and m31 > m18 and m31 > m19 and m31 > m20 and m31 > m21 and m31 > m22 and m31 > m23 and m31 > m24 and m31 > m25 and m31 > m26 and m31 > m27 and m31 > m28 and m31 > m29 and m31 > m30 and m31 > m1 and m31 > m32 and m31 > m33 and m31 > m34 and m31 > m35 and m31 > m36 and m31 > m37 and m31 > m38 and m31 > m39 and m31 > m40 and m31 > m41 and m31 > m42 and m31 > m43 and m31 > m44 and m31 > m45 and m31 > m46 and m31 > m47 and m31 > m48 and m31 > m49 and m31 > m50 and level2.welle >= 7 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 31, 1)
            v.geschossen=true
          elseif m32 > m2 and m32 > m3 and m32 > m4 and m32 > m5 and m32 > m6 and m32 > m7 and m32 > m8 and m32 > m9 and m32 > m10 and  m32 > m11 and m32 > m12 and m32 > m13 and m32 > m14 and m32 > m15 and m32 > m16 and m32 > m17 and m32 > m18 and m32 > m19 and m32 > m20 and m32 > m21 and m32 > m22 and m32 > m23 and m32 > m24 and m32 > m25 and m32 > m26 and m32 > m27 and m32 > m28 and m32 > m29 and m32 > m30 and m32 > m31 and m32 > m1 and m32 > m33 and m32 > m34 and m32 > m35 and m32 > m36 and m32 > m37 and m32 > m38 and m32 > m39 and m32 > m40 and m32 > m41 and m32 > m42 and m32 > m43 and m32 > m44 and m32 > m45 and m32 > m46 and m32 > m47 and m32 > m48 and m32 > m49 and m32 > m50 and level2.welle >= 7 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 32, 1)
            v.geschossen=true
          elseif m33 > m2 and m33 > m3 and m33 > m4 and m33 > m5 and m33 > m6 and m33 > m7 and m33 > m8 and m33 > m9 and m33 > m10 and  m33 > m11 and m33 > m12 and m33 > m13 and m33 > m14 and m33 > m15 and m33 > m16 and m33 > m17 and m33 > m18 and m33 > m19 and m33 > m20 and m33 > m21 and m33 > m22 and m33 > m23 and m33 > m24 and m33 > m25 and m33 > m26 and m33 > m27 and m33 > m28 and m33 > m29 and m33 > m30 and m33 > m31 and m33 > m32 and m33 > m1 and m33 > m34 and m33 > m35 and m33 > m36 and m33 > m37 and m33 > m38 and m33 > m39 and m33 > m40 and m33 > m41 and m33 > m42 and m33 > m43 and m33 > m44 and m33 > m45 and m33 > m46 and m33 > m47 and m33 > m48 and m33 > m49 and m33 > m50 and level2.welle >= 7 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 33, 1)
            v.geschossen=true
          elseif m34 > m2 and m34 > m3 and m34 > m4 and m34 > m5 and m34 > m6 and m34 > m7 and m34 > m8 and m34 > m9 and m34 > m10 and  m34 > m11 and m34 > m12 and m34 > m13 and m34 > m14 and m34 > m15 and m34 > m16 and m34 > m17 and m34 > m18 and m34 > m19 and m34 > m20 and m34 > m21 and m34 > m22 and m34 > m23 and m34 > m24 and m34 > m25 and m34 > m26 and m34 > m27 and m34 > m28 and m34 > m29 and m34 > m30 and m34 > m31 and m34 > m32 and m34 > m33 and m34 > m1 and m34 > m35 and m34 > m36 and m34 > m37 and m34 > m38 and m34 > m39 and m34 > m40 and m34 > m41 and m34 > m42 and m34 > m43 and m34 > m44 and m34 > m45 and m34 > m46 and m34 > m47 and m34 > m48 and m34 > m49 and m34 > m50 and level2.welle >= 7 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 34, 1)
            v.geschossen=true
          elseif m35 > m2 and m35 > m3 and m35 > m4 and m35 > m5 and m35 > m6 and m35 > m7 and m35 > m8 and m35 > m9 and m35 > m10 and  m35 > m11 and m35 > m12 and m35 > m13 and m35 > m14 and m35 > m15 and m35 > m16 and m35 > m17 and m35 > m18 and m35 > m19 and m35 > m20 and m35 > m21 and m35 > m22 and m35 > m23 and m35 > m24 and m35 > m25 and m35 > m26 and m35 > m27 and m35 > m28 and m35 > m29 and m35 > m30 and m35 > m31 and m35 > m32 and m35 > m33 and m35 > m34 and m35 > m1 and m35 > m36 and m35 > m37 and m35 > m38 and m35 > m39 and m35 > m40 and m35 > m41 and m35 > m42 and m35 > m43 and m35 > m44 and m35 > m45 and m35 > m46 and m35 > m47 and m35 > m48 and m35 > m49 and m35 > m50 and level2.welle >= 7 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 35, 1)
            v.geschossen=true
          elseif m36 > m2 and m36 > m3 and m36 > m4 and m36 > m5 and m36 > m6 and m36 > m7 and m36 > m8 and m36 > m9 and m36 > m10 and  m36 > m11 and m36 > m12 and m36 > m13 and m36 > m14 and m36 > m15 and m36 > m16 and m36 > m17 and m36 > m18 and m36 > m19 and m36 > m20 and m36 > m21 and m36 > m22 and m36 > m23 and m36 > m24 and m36 > m25 and m36 > m26 and m36 > m27 and m36 > m28 and m36 > m29 and m36 > m30 and m36 > m31 and m36 > m32 and m36 > m33 and m36 > m34 and m36 > m35 and m36 > m1 and m36 > m37 and m36 > m38 and m36 > m39 and m36 > m40 and m36 > m41 and m36 > m42 and m36 > m43 and m36 > m44 and m36 > m45 and m36 > m46 and m36 > m47 and m36 > m48 and m36 > m49 and m36 > m50 and level2.welle >= 8 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 36, 1)
            v.geschossen=true
          elseif m37 > m2 and m37 > m3 and m37 > m4 and m37 > m5 and m37 > m6 and m37 > m7 and m37 > m8 and m37 > m9 and m37 > m10 and  m37 > m11 and m37 > m12 and m37 > m13 and m37 > m14 and m37 > m15 and m37 > m16 and m37 > m17 and m37 > m18 and m37 > m19 and m37 > m20 and m37 > m21 and m37 > m22 and m37 > m23 and m37 > m24 and m37 > m25 and m37 > m26 and m37 > m27 and m37 > m28 and m37 > m29 and m37 > m30 and m37 > m31 and m37 > m32 and m37 > m33 and m37 > m34 and m37 > m35 and m37 > m36 and m37 > m1 and m37 > m38 and m37 > m39 and m37 > m40 and m37 > m41 and m37 > m42 and m37 > m43 and m37 > m44 and m37 > m45 and m37 > m46 and m37 > m47 and m37 > m48 and m37 > m49 and m37 > m50 and level2.welle >= 8 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 37, 1)
            v.geschossen=true
          elseif m38 > m2 and m38 > m3 and m38 > m4 and m38 > m5 and m38 > m6 and m38 > m7 and m38 > m8 and m38 > m9 and m38 > m10 and  m38 > m11 and m38 > m12 and m38 > m13 and m38 > m14 and m38 > m15 and m38 > m16 and m38 > m17 and m38 > m18 and m38 > m19 and m38 > m20 and m38 > m21 and m38 > m22 and m38 > m23 and m38 > m24 and m38 > m25 and m38 > m26 and m38 > m27 and m38 > m28 and m38 > m29 and m38 > m30 and m38 > m31 and m38 > m32 and m38 > m33 and m38 > m34 and m38 > m35 and m38 > m36 and m38 > m37 and m38 > m1 and m38 > m39 and m38 > m40 and m38 > m41 and m38 > m42 and m38 > m43 and m38 > m44 and m38 > m45 and m38 > m46 and m38 > m47 and m38 > m48 and m38 > m49 and m38 > m50 and level2.welle >= 8 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 38, 1)
            v.geschossen=true
          elseif m39 > m2 and m39 > m3 and m39 > m4 and m39 > m5 and m39 > m6 and m39 > m7 and m39 > m8 and m39 > m9 and m39 > m10 and  m39 > m11 and m39 > m12 and m39 > m13 and m39 > m14 and m39 > m15 and m39 > m16 and m39 > m17 and m39 > m18 and m39 > m19 and m39 > m20 and m39 > m21 and m39 > m22 and m39 > m23 and m39 > m24 and m39 > m25 and m39 > m26 and m39 > m27 and m39 > m28 and m39 > m29 and m39 > m30 and m39 > m31 and m39 > m32 and m39 > m33 and m39 > m34 and m39 > m35 and m39 > m36 and m39 > m37 and m39 > m38 and m39 > m1 and m39 > m40 and m39 > m41 and m39 > m42 and m39 > m43 and m39 > m44 and m39 > m45 and m39 > m46 and m39 > m47 and m39 > m48 and m39 > m49 and m39 > m50 and level2.welle >= 8 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 39, 1)
            v.geschossen=true
          elseif m40 > m2 and m40 > m3 and m40 > m4 and m40 > m5 and m40 > m6 and m40 > m7 and m40 > m8 and m40 > m9 and m40 > m10 and  m40 > m11 and m40 > m12 and m40 > m13 and m40 > m14 and m40 > m15 and m40 > m16 and m40 > m17 and m40 > m18 and m40 > m19 and m40 > m20 and m40 > m21 and m40 > m22 and m40 > m23 and m40 > m24 and m40 > m25 and m40 > m26 and m40 > m27 and m40 > m28 and m40 > m29 and m40 > m30 and m40 > m31 and m40 > m32 and m40 > m33 and m40 > m34 and m40 > m35 and m40 > m36 and m40 > m37 and m40 > m38 and m40 > m39 and m40 > m1 and m40 > m41 and m40 > m42 and m40 > m43 and m40 > m44 and m40 > m45 and m40 > m46 and m40 > m47 and m40 > m48 and m40 > m49 and m40 > m50 and level2.welle >= 8 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 40, 1)
            v.geschossen=true
          elseif m41 > m2 and m41 > m3 and m41 > m4 and m41 > m5 and m41 > m6 and m41 > m7 and m41 > m8 and m41 > m9 and m41 > m10 and  m41 > m11 and m41 > m12 and m41 > m13 and m41 > m14 and m41 > m15 and m41 > m16 and m41 > m17 and m41 > m18 and m41 > m19 and m41 > m20 and m41 > m21 and m41 > m22 and m41 > m23 and m41 > m24 and m41 > m25 and m41 > m26 and m41 > m27 and m41 > m28 and m41 > m29 and m41 > m30 and m41 > m31 and m41 > m32 and m41 > m33 and m41 > m34 and m41 > m35 and m41 > m36 and m41 > m37 and m41 > m38 and m41 > m39 and m41 > m40 and m41 > m1 and m41 > m42 and m41 > m43 and m41 > m44 and m41 > m45 and m41 > m46 and m41 > m47 and m41 > m48 and m41 > m49 and m41 > m50 and level2.welle >= 9 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 41, 1)
            v.geschossen=true
          elseif m42 > m2 and m42 > m3 and m42 > m4 and m42 > m5 and m42 > m6 and m42 > m7 and m42 > m8 and m42 > m9 and m42 > m10 and  m42 > m11 and m42 > m12 and m42 > m13 and m42 > m14 and m42 > m15 and m42 > m16 and m42 > m17 and m42 > m18 and m42 > m19 and m42 > m20 and m42 > m21 and m42 > m22 and m42 > m23 and m42 > m24 and m42 > m25 and m42 > m26 and m42 > m27 and m42 > m28 and m42 > m29 and m42 > m30 and m42 > m31 and m42 > m32 and m42 > m33 and m42 > m34 and m42 > m35 and m42 > m36 and m42 > m37 and m42 > m38 and m42 > m39 and m42 > m40 and m42 > m41 and m42 > m1 and m42 > m43 and m42 > m44 and m42 > m45 and m42 > m46 and m42 > m47 and m42 > m48 and m42 > m49 and m42 > m50 and level2.welle >= 9 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 42, 1)
            v.geschossen=true
          elseif m43 > m2 and m43 > m3 and m43 > m4 and m43 > m5 and m43 > m6 and m43 > m7 and m43 > m8 and m43 > m9 and m43 > m10 and  m43 > m11 and m43 > m12 and m43 > m13 and m43 > m14 and m43 > m15 and m43 > m16 and m43 > m17 and m43 > m18 and m43 > m19 and m43 > m20 and m43 > m21 and m43 > m22 and m43 > m23 and m43 > m24 and m43 > m25 and m43 > m26 and m43 > m27 and m43 > m28 and m43 > m29 and m43 > m30 and m43 > m31 and m43 > m32 and m43 > m33 and m43 > m34 and m43 > m35 and m43 > m36 and m43 > m37 and m43 > m38 and m43 > m39 and m43 > m40 and m43 > m41 and m43 > m42 and m43 > m1 and m43 > m44 and m43 > m45 and m43 > m46 and m43 > m47 and m43 > m48 and m43 > m49 and m43 > m50 and level2.welle >= 9 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 43, 1)
            v.geschossen=true
          elseif m44 > m2 and m44 > m3 and m44 > m4 and m44 > m5 and m44 > m6 and m44 > m7 and m44 > m8 and m44 > m9 and m44 > m10 and  m44 > m11 and m44 > m12 and m44 > m13 and m44 > m14 and m44 > m15 and m44 > m16 and m44 > m17 and m44 > m18 and m44 > m19 and m44 > m20 and m44 > m21 and m44 > m22 and m44 > m23 and m44 > m24 and m44 > m25 and m44 > m26 and m44 > m27 and m44 > m28 and m44 > m29 and m44 > m30 and m44 > m31 and m44 > m32 and m44 > m33 and m44 > m34 and m44 > m35 and m44 > m36 and m44 > m37 and m44 > m38 and m44 > m39 and m44 > m40 and m44 > m41 and m44 > m42 and m44 > m43 and m44 > m1 and m44 > m45 and m44 > m46 and m44 > m47 and m44 > m48 and m44 > m49 and m44 > m50 and level2.welle >= 9 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 44, 1)
            v.geschossen=true
          elseif m45 > m2 and m45 > m3 and m45 > m4 and m45 > m5 and m45 > m6 and m45 > m7 and m45 > m8 and m45 > m9 and m45 > m10 and  m45 > m11 and m45 > m12 and m45 > m13 and m45 > m14 and m45 > m15 and m45 > m16 and m45 > m17 and m45 > m18 and m45 > m19 and m45 > m20 and m45 > m21 and m45 > m22 and m45 > m23 and m45 > m24 and m45 > m25 and m45 > m26 and m45 > m27 and m45 > m28 and m45 > m29 and m45 > m30 and m45 > m31 and m45 > m32 and m45 > m33 and m45 > m34 and m45 > m35 and m45 > m36 and m45 > m37 and m45 > m38 and m45 > m39 and m45 > m40 and m45 > m41 and m45 > m42 and m45 > m43 and m45 > m44 and m45 > m1 and m45 > m46 and m45 > m47 and m45 > m48 and m45 > m49 and m45 > m50 and level2.welle >= 9 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 45, 1)
            v.geschossen=true
          elseif m46 > m2 and m46 > m3 and m46 > m4 and m46 > m5 and m46 > m6 and m46 > m7 and m46 > m8 and m46 > m9 and m46 > m10 and  m46 > m11 and m46 > m12 and m46 > m13 and m46 > m14 and m46 > m15 and m46 > m16 and m46 > m17 and m46 > m18 and m46 > m19 and m46 > m20 and m46 > m21 and m46 > m22 and m46 > m23 and m46 > m24 and m46 > m25 and m46 > m26 and m46 > m27 and m46 > m28 and m46 > m29 and m46 > m30 and m46 > m31 and m46 > m32 and m46 > m33 and m46 > m34 and m46 > m35 and m46 > m36 and m46 > m37 and m46 > m38 and m46 > m39 and m46 > m40 and m46 > m41 and m46 > m42 and m46 > m43 and m46 > m44 and m46 > m45 and m46 > m1 and m46 > m47 and m46 > m48 and m46 > m49 and m46 > m50 and level2.welle >= 10 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 46, 1)
            v.geschossen=true
          elseif m47 > m2 and m47 > m3 and m47 > m4 and m47 > m5 and m47 > m6 and m47 > m7 and m47 > m8 and m47 > m9 and m47 > m10 and  m47 > m11 and m47 > m12 and m47 > m13 and m47 > m14 and m47 > m15 and m47 > m16 and m47 > m17 and m47 > m18 and m47 > m19 and m47 > m20 and m47 > m21 and m47 > m22 and m47 > m23 and m47 > m24 and m47 > m25 and m47 > m26 and m47 > m27 and m47 > m28 and m47 > m29 and m47 > m30 and m47 > m31 and m47 > m32 and m47 > m33 and m47 > m34 and m47 > m35 and m47 > m36 and m47 > m37 and m47 > m38 and m47 > m39 and m47 > m40 and m47 > m41 and m47 > m42 and m47 > m43 and m47 > m44 and m47 > m45 and m47 > m46 and m47 > m1 and m47 > m48 and m47 > m49 and m47 > m50 and level2.welle >= 10 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 47, 1)
            v.geschossen=true
          elseif m48 > m2 and m48 > m3 and m48 > m4 and m48 > m5 and m48 > m6 and m48 > m7 and m48 > m8 and m48 > m9 and m48 > m10 and  m48 > m11 and m48 > m12 and m48 > m13 and m48 > m14 and m48 > m15 and m48 > m16 and m48 > m17 and m48 > m18 and m48 > m19 and m48 > m20 and m48 > m21 and m48 > m22 and m48 > m23 and m48 > m24 and m48 > m25 and m48 > m26 and m48 > m27 and m48 > m28 and m48 > m29 and m48 > m30 and m48 > m31 and m48 > m32 and m48 > m33 and m48 > m34 and m48 > m35 and m48 > m36 and m48 > m37 and m48 > m38 and m48 > m39 and m48 > m40 and m48 > m41 and m48 > m42 and m48 > m43 and m48 > m44 and m48 > m45 and m48 > m46 and m48 > m47 and m48 > m1 and m48 > m49 and m48 > m50 and level2.welle >= 10 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 48, 1)
            v.geschossen=true
          elseif m49 > m2 and m49 > m3 and m49 > m4 and m49 > m5 and m49 > m6 and m49 > m7 and m49 > m8 and m49 > m9 and m49 > m10 and  m49 > m11 and m49 > m12 and m49 > m13 and m49 > m14 and m49 > m15 and m49 > m16 and m49 > m17 and m49 > m18 and m49 > m19 and m49 > m20 and m49 > m21 and m49 > m22 and m49 > m23 and m49 > m24 and m49 > m25 and m49 > m26 and m49 > m27 and m49 > m28 and m49 > m29 and m49 > m30 and m49 > m31 and m49 > m32 and m49 > m33 and m49 > m34 and m49 > m35 and m49 > m36 and m49 > m37 and m49 > m38 and m49 > m39 and m49 > m40 and m49 > m41 and m49 > m42 and m49 > m43 and m49 > m44 and m49 > m45 and m49 > m46 and m49 > m47 and m49 > m48 and m49 > m1 and m49 > m50 and level2.welle >= 10 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 49, 1)
            v.geschossen=true
          elseif m50 > m2 and m50 > m3 and m50 > m4 and m50 > m5 and m50 > m6 and m50 > m7 and m50 > m8 and m50 > m9 and m50 > m10 and  m50 > m11 and m50 > m12 and m50 > m13 and m50 > m14 and m50 > m15 and m50 > m16 and m50 > m17 and m50 > m18 and m50 > m19 and m50 > m20 and m50 > m21 and m50 > m22 and m50 > m23 and m50 > m24 and m50 > m25 and m50 > m26 and m50 > m27 and m50 > m28 and m50 > m29 and m50 > m30 and m50 > m31 and m50 > m32 and m50 > m33 and m50 > m34 and m50 > m35 and m50 > m36 and m50 > m37 and m50 > m38 and m50 > m39 and m50 > m40 and m50 > m41 and m50 > m42 and m50 > m43 and m50 > m44 and m50 > m45 and m50 > m46 and m50 > m47 and m50 > m48 and m50 > m49 and m50 > m1 and level2.welle >= 10 then
            kugeln_spawn(level2.hexagon_x + v.x, level2.hexagon_y + v.y, 50, 1)
            v.geschossen=true
          end
        end
      end
    end
  end
  for i,v in ipairs(kugeln) do
    for o,b in ipairs(gegner) do
      if b.nummer==v.zielNummer then
        x_ziel=b.x
        y_ziel=b.y
        if v.x >= x_ziel - 22.5 and v.x <= x_ziel + 22.5 and  v.y >= y_ziel - 22.5 and v.y <= y_ziel + 22.5 then
          for p,n in ipairs(kanone) do
            if  not n.geschossen then
              b.leben=b.leben-10
            end
            n.geschossen=false
          end
          m1=0
          m2=0
          m3=0
          m4=0
          m5=0
          m6=0
          m7=0
          m8=0
          m9=0
          m10=0
          m11=0
          m12=0
          m13=0
          m14=0
          m15=0
          m16=0
          m17=0
          m18=0
          m19=0
          m20=0
          m21=0
          m22=0
          m23=0
          m24=0
          m25=0
          m26=0
          m27=0
          m28=0
          m29=0
          m30=0
          m31=0
          m32=0
          m33=0
          m34=0
          m35=0
          m36=0
          m37=0
          m38=0
          m39=0
          m40=0
          m41=0
          m42=0
          m43=0
          m44=0
          m45=0
          m46=0
          m47=0
          m48=0
          m49=0
          m50=0
        end
      end
    end
  end
end

function kanone_draw()
  for i,v in ipairs(kanone) do
    if v.hexagon == 1 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50, level2.hexagon_y + 40, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 2 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50, level2.hexagon_y + 40 +87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 3 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50, level2.hexagon_y + 40 -87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 4 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +75, level2.hexagon_y + 40 -43.5, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 5 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +75, level2.hexagon_y + 40 +43.5, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 6 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -75, level2.hexagon_y + 40 -43.5, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 7 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -75, level2.hexagon_y+43.5 + 40, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 8 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +150, level2.hexagon_y + 40, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 9 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -150, level2.hexagon_y + 40 , v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 10 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50, level2.hexagon_y + 40 -174, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 11 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50, level2.hexagon_y + 40 +174, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 12 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +75, level2.hexagon_y + 40 +130, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 13 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -75, level2.hexagon_y + 40 -130, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 14 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +75, level2.hexagon_y + 40 -130, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 15 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -75, level2.hexagon_y + 40 +130, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 16 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +150, level2.hexagon_y + 40 +87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 17 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -150, level2.hexagon_y + 40 -87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 18 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 -150, level2.hexagon_y + 40 +87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    elseif v.hexagon == 19 then
      love.graphics.draw(level2.kanone_bild, level2.hexagon_x + 50 +150, level2.hexagon_y + 40 -87, v.radius, 0.2, sx, level2.kanone_bild:getWidth() / 2, level2.kanone_bild:getHeight() / 2)
    end
  end
end