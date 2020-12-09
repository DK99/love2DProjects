module(..., package.seeall)
spielTabelle=require 'spielTabelle'
profile=require 'profile'

level1={
  sperma_blau=love.graphics.newImage("gfx/level1/sperma_blau.png");
  sperma_schwarz=love.graphics.newImage("gfx/level1/sperma_schwarz.png");
  sperma_gruen=love.graphics.newImage("gfx/level1/sperma_gruen.png");
  sperma_gelb=love.graphics.newImage("gfx/level1/sperma_gelb.png");
  sperma_pink=love.graphics.newImage("gfx/level1/sperma_pink.png");
  eizelle=love.graphics.newImage("gfx/level1/eizelle.png");
  hintergrund=love.graphics.newImage("gfx/level1/hintergrund.bmp");
  ampel_gruen=love.graphics.newImage("gfx/level1/ampel_gruen.bmp");
  ampel_gelb=love.graphics.newImage("gfx/level1/ampel_gelb.bmp");
  ampel_rot=love.graphics.newImage("gfx/level1/ampel_rot.bmp");
  ampel_timer=0;
  hintergrund_x=-800;
  start=false;
  los=false;
  start_linie=600;
  gewinn=nil;
  spieler={
    boost=100;
    booster=false;
    x=600;
  };
  gelb={
    x=600;
    geschwindigkeit=25;
  };
  blau={
    x=600;
    geschwindigkeit=50;
  };
  gruen={
    x=600;
    geschwindigkeit=40;
  };
  pink={
    x=600;
    geschwindigkeit=35;
  };
}

function level1_draw()
  love.graphics.setColorMode("replace")
  love.graphics.draw(level1.hintergrund, level1.hintergrund_x, 0)
  love.graphics.setColor(255, 255, 255)
  love.graphics.line(level1.hintergrund_x + 400, 50, level1.hintergrund_x + 400, 600)
  if level1.ampel_timer < 1 then
    love.graphics.draw(level1.ampel_rot, 50, 5, 0, 0.6, sx)
  elseif level1.ampel_timer < 2 then
    love.graphics.draw(level1.ampel_gelb, 50, 5, 0, 0.6, sx)
  else
    love.graphics.draw(level1.ampel_gruen, 50, 5, 0, 0.6, sx)
    level1.los=true
  end
  if not level1.start then
    love.graphics.print("Nun kommen wir zu dem erstem Level.", 50, 50)
    love.graphics.print("Dies ist ein Rennen du spielst das", 50, 100)
    love.graphics.print("schwarze Spermium.", 50, 150)
    love.graphics.print("Wenn die Ampel grün ist startest", 50, 200)
    love.graphics.print("du automatisch. Oben rechts wird dir", 50, 250)
    love.graphics.print("dein Boost angezeigt. Mit der Leertaste", 50, 300)
    love.graphics.print("kannst du ihn verwenden bis er leer ist.", 50, 350)
    love.graphics.print("Dein Ziel ist als erster über die", 50, 400)
    love.graphics.print("Ziellinie zu kommen und in die Eizelle", 50, 450)
    love.graphics.print("einzutreten.", 50, 500)
    love.graphics.rectangle("line", 400, 520, 200, 50)
    love.graphics.print(" Weiter", 425, 520)
  elseif level1.start then
    love.graphics.line(level1.start_linie, 50, level1.start_linie, 600)
    love.graphics.line(-800, 50, 800, 50)
    if level1.gewinn == nil or level1.gewinn then
      love.graphics.draw(level1.sperma_schwarz, level1.spieler.x, 280, 0, 5, sx)
    end
    if level1.gewinn == nil or not level1.gewinn then
      love.graphics.draw(level1.sperma_blau, level1.blau.x, 180, 0, 5, sx)
      
    end
    if level1.gewinn == nil then
      love.graphics.draw(level1.sperma_gelb, level1.gelb.x, 80, 0, 5, sx)
      love.graphics.draw(level1.sperma_gruen, level1.gruen.x, 380, 0, 5, sx)
      love.graphics.draw(level1.sperma_pink, level1.pink.x, 480, 0, 5, sx)
    end
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", 500, 10, 202, 35)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 500 + 1, 11, level1.spieler.boost * 2, 33)
  love.graphics.draw(level1.eizelle, level1.hintergrund_x + 100, 200, 0, 2, sx)
  if not level1.gewinn and level1.gewinn ~= nil then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setColorMode("modulate")
    love.graphics.print("Du hast Verloren.", 350, 200)
    love.graphics.print("Starte das Level neu", 350, 250)
    love.graphics.print("oder beende es.", 350, 300)
    love.graphics.rectangle("line", 400, 520, 250, 50)
    love.graphics.print("Neustarten", 425, 520)
    love.graphics.rectangle("line", 100, 520, 200, 50)
    love.graphics.print("Menü", 125, 520)
  end
  if level1.gewinn and level1.gewinn ~= nil then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setColorMode("modulate")
    love.graphics.print("Du hast Gewonnen.", 350, 200)
    love.graphics.rectangle("line", 400, 520, 300, 50)
    love.graphics.print("Nächstes Level", 425, 520)
    love.graphics.rectangle("line", 100, 520, 200, 50)
    love.graphics.print("Menü", 125, 520)
  end
end

function level1_update(dt)
  love.mouse.setVisible(true)
  if level1.gewinn== nil then
    if profile.profile.auswahl == "profil_1" then
      if not love.filesystem.exists("Profile/profil_1.txt") then
        love.filesystem.write("Profile/profil_1.txt", "Level 1")
      end
    end
    if profile.profile.auswahl == "profil_2" then
      if not love.filesystem.exists("Profile/profil_2.txt") then
        love.filesystem.write("Profile/profil_2.txt", "Level 1")
      end
    end
    if profile.profile.auswahl == "profil_3" then
      if not love.filesystem.exists("Profile/profil_3.txt") then
        love.filesystem.write("Profile/profil_3.txt", "Level 1")
      end
    end
  elseif level1.gewinn==true then
    if profile.profile.auswahl == "profil_1" then
      if not love.filesystem.exists("Profile/profil_1.txt") then
        love.filesystem.write("Profile/profil_1.txt", "Level 2")
      end
    end
    if profile.profile.auswahl == "profil_2" then
      if not love.filesystem.exists("Profile/profil_2.txt") then
        love.filesystem.write("Profile/profil_2.txt", "Level 2")
      end
    end
    if profile.profile.auswahl == "profil_3" then
      if not love.filesystem.exists("Profile/profil_3.txt") then
        love.filesystem.write("Profile/profil_3.txt", "Level 2")
      end
    end
  end
  if level1.hintergrund_x + 300 >= level1.spieler.x then
    level1.gewinn=true
    level1.los=false
    if level1.spieler.x >= level1.hintergrund_x + 500 then
      level1.spieler.x=level1.spieler.x-100*dt
    end
  elseif level1.hintergrund_x + 300 >= level1.blau.x then
    level1.los=false
    level1.gewinn=false
    if level1.blau.x >= 100 then
      level1.blau.x=level1.blau.x-level1.blau.geschwindigkeit*dt
    end
  end
  if level1.start then
    level1.ampel_timer=level1.ampel_timer + dt
  end
  if level1.hintergrund_x <= 0 and level1.los or level1.hintergrund_x <= 0 and level1.gewinn then
    level1.start_linie=level1.start_linie+100*dt
    level1.hintergrund_x=level1.hintergrund_x+100*dt
    level1.gruen.x=level1.gruen.x-level1.gruen.geschwindigkeit*dt
    level1.pink.x=level1.pink.x-level1.pink.geschwindigkeit*dt
    level1.gelb.x=level1.gelb.x-level1.gelb.geschwindigkeit*dt
    if not level1.gewinn then
      level1.blau.x=level1.blau.x-level1.blau.geschwindigkeit*dt
    end
    if level1.spieler.boost < 100 then
      level1.spieler.boost=level1.spieler.boost+5*dt
    end
  end
  if level1.spieler.booster == true and level1.los then
    level1.spieler.boost=level1.spieler.boost - 100 * dt
    level1.spieler.x=level1.spieler.x - 350 *dt
    level1_keypressed(key)
  end
end

function level1_mousepressed(x, y, button)
  if x >= 400 and x <= 600 and y >= 520 and y <= 570 and button == "l" and not level1.start then
    level1.start=true
  end
  if x >= 400 and x <= 650 and y >= 520 and y <= 570 and button == "l" and not level1.gewinn and level1.gewinn ~= nil then
    level1.ampel_timer=0
    level1.hintergrund_x=-800
    level1.start=false
    level1.los=false
    level1.start_linie=600;
    level1.gewinn=nil
    level1.spieler.boost=100
    level1.spieler.booster=false
    level1.spieler.x=600
    level1.gelb.x=600
    level1.gelb.geschwindigkeit=25
    level1.blau.x=600
    level1.blau.geschwindigkeit=50
    level1.gruen.x=600
    level1.gruen.geschwindigkeit=40
    level1.pink.x=600
    level1.pink.geschwindigkeit=35
  end
end

function level1_mousereleased(x, y, button)
  if x >= 100 and x <= 300 and y >= 520 and y <= 570 and button == "l" and not level1.gewinn and level1.gewinn ~= nil then
    spielTabelle.szene="menu"
    spielTabelle.profil_1=""
    spielTabelle.profil_2=""
    spielTabelle.profil_3=""
    level1.ampel_timer=0
    level1.hintergrund_x=-800
    level1.start=false
    level1.los=false
    level1.start_linie=600;
    level1.gewinn=nil
    level1.spieler.boost=100
    level1.spieler.booster=false
    level1.spieler.x=600
    level1.gelb.x=600
    level1.gelb.geschwindigkeit=25
    level1.blau.x=600
    level1.blau.geschwindigkeit=50
    level1.gruen.x=600
    level1.gruen.geschwindigkeit=40
    level1.pink.x=600
    level1.pink.geschwindigkeit=35
  end
  if x >= 100 and x <= 300 and y >= 520 and y <= 570 and button == "l" and level1.gewinn and level1.gewinn ~= nil then
    spielTabelle.szene="menu"
    spielTabelle.profil_1=""
    spielTabelle.profil_2=""
    spielTabelle.profil_3=""
    level1.ampel_timer=0
    level1.hintergrund_x=-800
    level1.start=false
    level1.los=false
    level1.start_linie=600;
    level1.gewinn=nil
    level1.spieler.boost=100
    level1.spieler.booster=false
    level1.spieler.x=600
    level1.gelb.x=600
    level1.gelb.geschwindigkeit=25
    level1.blau.x=600
    level1.blau.geschwindigkeit=50
    level1.gruen.x=600
    level1.gruen.geschwindigkeit=40
    level1.pink.x=600
    level1.pink.geschwindigkeit=35
  end
  if x >= 400 and x <= 700 and y >= 520 and y <= 570 and button == "l" and level1.gewinn and level1.gewinn ~= nil then
    spielTabelle.szene="Level 2"
    level1.ampel_timer=0
    level1.hintergrund_x=-800
    level1.start=false
    level1.los=false
    level1.start_linie=600;
    level1.gewinn=nil
    level1.spieler.boost=100
    level1.spieler.booster=false
    level1.spieler.x=600
    level1.gelb.x=600
    level1.gelb.geschwindigkeit=25
    level1.blau.x=600
    level1.blau.geschwindigkeit=50
    level1.gruen.x=600
    level1.gruen.geschwindigkeit=40
    level1.pink.x=600
    level1.pink.geschwindigkeit=35
  end
end
function level1_keypressed(key)
  if level1.spieler.boost > 0 then
    if level1.los and key == " " then
      level1.spieler.booster=true
    end
  else
    level1.spieler.booster=false
  end
  if key=="p" then
    level1.start=true
  end
end

function level1_keyreleased(key)
  if level1.los and key == " " then
    level1.spieler.booster=false
  end
end