module(..., package.seeall)
spielTabelle=require 'spielTabelle'

profile={
  hintergrund=love.graphics.newImage("gfx/menu/hintergrund.png");
  mensch=love.graphics.newImage("gfx/menu/mensch.png");
  strasse=love.graphics.newImage("gfx/menu/strasse.png");
  strasse2=love.graphics.newImage("gfx/menu/strasse2.png");
  haus_1=love.graphics.newImage("gfx/menu/haus_1.png");
  haus_2=love.graphics.newImage("gfx/menu/haus_2.png");
  haus_3=love.graphics.newImage("gfx/menu/haus_3.png");
  auto_1=love.graphics.newImage("gfx/menu/auto_1.png");
  auto_2=love.graphics.newImage("gfx/menu/auto_2.png");
  auto_3=love.graphics.newImage("gfx/menu/auto_3.png");
  x=0;
  y=0;
  mouse=false;
  x_fertig=false;
  y_fertig=false;
  auto_x=-400;
  auswahl="";
  text_1=false;
  text_2=false;
  mensch_draw=true;
  bearbeiten=false;
  schreiben=true;
  name="";
  name_zeichen=0;
  text="Bearbeiten";
  text_x=300;
  }

function profile_draw()
  love.graphics.setColorMode("replace")
  love.graphics.draw(profile.hintergrund, 0, 0)
  love.graphics.draw(profile.strasse, -50, 365)
  love.graphics.draw(profile.strasse2, 200, -25, 0, 0.4, 0.5)
  love.graphics.draw(profile.strasse2, 475, -25, 0, 0.4, 0.5)
  love.graphics.draw(profile.strasse, -10, 0, 0, 0.8, 0.4)
  love.graphics.setFont(stencil)
  love.graphics.print(profile.text, profile.text_x, 0)
  love.graphics.setFont(stencil2)
  love.graphics.draw(profile.haus_1, 25, 200, 0, 0.3, sx)
  love.graphics.draw(profile.haus_2, 300, 200, 0, 0.3, sx)
  love.graphics.draw(profile.haus_3, 575, 200, 0, 0.3, sx)
  love.graphics.print(spielTabelle.profil_1, 60, 260)
  love.graphics.print(spielTabelle.profil_2, 335, 260)
  love.graphics.print(spielTabelle.profil_3, 610, 260)
  love.graphics.print(love.filesystem.read("Profile/profil_1_name.txt"), 80, 240)
  love.graphics.print(love.filesystem.read("Profile/profil_2_name.txt"), 355, 240)
  love.graphics.print(love.filesystem.read("Profile/profil_3_name.txt"), 630, 240)
  if profile.mensch_draw then
    love.graphics.draw(profile.mensch, profile.x - 10, profile.y, 0, 0.125, sx)
  end
  if profile.auswahl=="profil_1" then
    love.graphics.draw(profile.auto_1, profile.auto_x, 475, 0, 0.3, sx)
  elseif profile.auswahl=="profil_2" then
    love.graphics.draw(profile.auto_2, profile.auto_x, 475, 0, 0.3, sx)
  elseif profile.auswahl=="profil_3" then
    love.graphics.draw(profile.auto_3, profile.auto_x, 475, 0, 0.3, sx)
  end
  if profile.bearbeiten then
    love.graphics.setColorMode("replace")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(stencil)
    love.graphics.print("Bearbeiten aus", 200, 500)
    love.graphics.setColorMode("modulate")
    love.graphics.setFont(stencil2)
    if love.filesystem.exists("Profile/profil_1.txt") then
      love.graphics.rectangle("line", 25, 100, 150, 50)
      love.graphics.print("Löschen", 50, 110)
      love.graphics.rectangle("line", 25, 160, 150, 50)
      love.graphics.print("Name bearbeiten", 30, 170)
    end
    if love.filesystem.exists("Profile/profil_2.txt") then
      love.graphics.rectangle("line", 310, 100, 150, 50)
      love.graphics.print("Löschen", 335, 110)
      love.graphics.rectangle("line", 310, 160, 150, 50)
      love.graphics.print("Name bearbeiten", 315, 170)
    end
    if love.filesystem.exists("Profile/profil_3.txt") then
      love.graphics.rectangle("line", 600, 100, 150, 50)
      love.graphics.print("Löschen", 625, 110)
      love.graphics.rectangle("line", 600, 160, 150, 50)
      love.graphics.print("Name bearbeiten", 605, 170)
    end
  end
end

function profile_update(dt)
  if not love.filesystem.exists("Profile/profil_1.txt") then
    spielTabelle.profil_1="Neues Spiel"
  else
    spielTabelle.profil_1=love.filesystem.read("Profile/profil_1.txt")
  end
  if not love.filesystem.exists("Profile/profil_2.txt") then
    spielTabelle.profil_2="Neues Spiel"
  else
    spielTabelle.profil_2=love.filesystem.read("Profile/profil_2.txt")
  end
  if not love.filesystem.exists("Profile/profil_3.txt") then
    spielTabelle.profil_3="Neues Spiel"
  else
    spielTabelle.profil_3=love.filesystem.read("Profile/profil_3.txt")
  end
  love.mouse.setVisible(false)
  if not profile.mouse then
    profile.x, profile.y = love.mouse.getPosition()
  end
  if love.mouse.isDown("l") or profile.mouse then
    profile.mouse = true
    if profile.x < 240 and profile.y > 95 then  
      if profile.x >= 134 and profile.x <= 136 and profile.y >= 299 and profile.y <= 301 then
        profile.text_1=true
        profile.text_2=true
        profile.y_fertig=true
        profile.auswahl="profil_1"
      elseif profile.auto_x < 0 then
        berechneBewegung(profile.x, profile.y, 135, 300)
        profile.x = profile.x + x_bewegung*dt*200
        profile.y = profile.y + y_bewegung*dt*200
      end
    elseif profile.x >= 241 and profile.x <= 520 and profile.y > 95 then      
      if profile.x >= 409 and profile.x <= 411 and profile.y >= 299 and profile.y <= 301 then
        profile.text_1=true
        profile.text_2=true
        profile.y_fertig=true
        profile.auswahl="profil_2"
      elseif profile.auto_x < 0 then
        berechneBewegung(profile.x, profile.y, 410, 300)
        profile.x = profile.x + x_bewegung*dt*200
        profile.y = profile.y + y_bewegung*dt*200
      end
    elseif profile.x >= 521 and profile.y > 95 then      
      if profile.x >= 684 and profile.x <= 686 and profile.y >= 299 and profile.y <= 301 then
        profile.text_1=true
        profile.text_2=true
        profile.y_fertig=true
        profile.auswahl="profil_3"
      elseif profile.auto_x < 0 then
        berechneBewegung(profile.x, profile.y, 685, 300)
        profile.x = profile.x + x_bewegung*dt*200
        profile.y = profile.y + y_bewegung*dt*200
      end
    else
      love.mouse.setVisible(true)
      profile.bearbeiten=true
      profile.mensch_draw=false
    end
  end
  if profile.x_fertig and profile.y_fertig then
    spielTabelle.szene=profile.auswahl
    profile.x=0
    profile.y=0
    profile.mouse=false
    profile.x_fertig=false
    profile.y_fertig=false
    profile.auto_x=-400
    profile.auswahl=""
    profile.text_1=false
    profile.text_2=false
    profile.mensch_draw=true
    profile.bearbeiten=false
    profile.schreiben=true
    profile.name=""
    profile.name_zeichen=0
    profile.text="Bearbeiten"
    profile.text_x=300
  end
  if profile.auto_x <= 850 then
    if profile.auswahl=="profil_1" then
      if love.filesystem.exists("Profile/profil_1.txt") then
        profile.schreiben=false
      end
      if not profile.schreiben then
        if profile.auto_x <= 50 then
          profile.auto_x=profile.auto_x+300*dt
        elseif profile.y >= 475 then
          profile.mensch_draw=false
          profile.auto_x=profile.auto_x+300*dt
        else
          profile.y=profile.y+100*dt
        end
      else
        profile.text="    Name eingeben: Enter bestätigen(8 Buchstaben)"
        profile.text_x=25
        love.filesystem.write("Profile/profil_1_name.txt", profile.name)
      end
    elseif profile.auswahl=="profil_2" then
      if love.filesystem.exists("Profile/profil_2.txt") then
        profile.schreiben=false
      end
      if not profile.schreiben then
        if profile.auto_x <= 325 then
          profile.auto_x=profile.auto_x+300*dt
        elseif profile.y >= 475 then
          profile.mensch_draw=false
          profile.auto_x=profile.auto_x+300*dt
        else
          profile.y=profile.y+100*dt
        end
      else
        profile.text="    Name eingeben: Enter bestätigen(8 Buchstaben)"
        profile.text_x=25
        love.filesystem.write("Profile/profil_2_name.txt", profile.name)
      end
    elseif profile.auswahl=="profil_3" then
      if love.filesystem.exists("Profile/profil_3.txt") then
        profile.schreiben=false
      end
      if not profile.schreiben then
        if profile.auto_x <= 600 then
          profile.auto_x=profile.auto_x+300*dt
        elseif profile.y >= 475 then
          profile.mensch_draw=false
          profile.auto_x=profile.auto_x+300*dt
        else
          profile.y=profile.y+100*dt
        end
      else
        profile.text="    Name eingeben: Enter bestätigen(8 Buchstaben)"
        profile.text_x=25
        love.filesystem.write("Profile/profil_3_name.txt", profile.name)
      end
    end
  else
    profile.x_fertig=true
  end
end

function profile_keypressed(key)
  if profile.auto_x <= 850 then
    if profile.auswahl=="profil_1" or profile.auswahl=="profil_2" or profile.auswahl=="profil_3" or profile.auswahl== "profil_1_b" or profile.auswahl=="profil_2_b" or profile.auswahl=="profil_3_b" then
      if profile.schreiben then
        if profile.auswahl=="profil_1" or profile.auswahl=="profil_1_b" then
          love.filesystem.write("Profile/profil_1_name.txt", profile.name)
        elseif profile.auswahl=="profil_2" or profile.auswahl=="profil_2_b" then
          love.filesystem.write("Profile/profil_2_name.txt", profile.name)
        elseif profile.auswahl=="profil_3" or profile.auswahl=="profil_3_b" then
          love.filesystem.write("Profile/profil_3_name.txt", profile.name)
        end
        if key == ("a") and profile.name_zeichen < 8 then
          profile.name=profile.name.."A"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("b") and profile.name_zeichen < 8 then
          profile.name=profile.name.."B"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("c") and profile.name_zeichen < 8 then
          profile.name=profile.name.."C"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("d") and profile.name_zeichen < 8 then
          profile.name=profile.name.."D"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("e") and profile.name_zeichen < 8 then
          profile.name=profile.name.."E"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("f") and profile.name_zeichen < 8 then
          profile.name=profile.name.."F"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("g") and profile.name_zeichen < 8 then
          profile.name=profile.name.."G"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("h") and profile.name_zeichen < 8 then
          profile.name=profile.name.."H"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("i") and profile.name_zeichen < 8 then
          profile.name=profile.name.."I"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("j") and profile.name_zeichen < 8 then
          profile.name=profile.name.."J"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("k") and profile.name_zeichen < 8 then
          profile.name=profile.name.."K"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("l") and profile.name_zeichen < 8 then
          profile.name=profile.name.."L"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("m") and profile.name_zeichen < 8 then
          profile.name=profile.name.."M"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("n") and profile.name_zeichen < 8 then
          profile.name=profile.name.."N"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("o") and profile.name_zeichen < 8 then
          profile.name=profile.name.."O"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("p") and profile.name_zeichen < 8 then
          profile.name=profile.name.."P"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("q") and profile.name_zeichen < 8 then
          profile.name=profile.name.."Q"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("r") and profile.name_zeichen < 8 then
          profile.name=profile.name.."R"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("s") and profile.name_zeichen < 8 then
          profile.name=profile.name.."S"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("t") and profile.name_zeichen < 8 then
          profile.name=profile.name.."T"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("u") and profile.name_zeichen < 8 then
          profile.name=profile.name.."U"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("v") and profile.name_zeichen < 8 then
          profile.name=profile.name.."V"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("w") and profile.name_zeichen < 8 then
          profile.name=profile.name.."W"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("x") and profile.name_zeichen < 8 then
          profile.name=profile.name.."X"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("z") and profile.name_zeichen < 8 then
          profile.name=profile.name.."Y"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("y") and profile.name_zeichen < 8 then
          profile.name=profile.name.."Z"
          profile.name_zeichen=profile.name_zeichen+1
        elseif key == ("backspace") then
          profile.name=""
          profile.name_zeichen=0
        elseif key == ("return") then
          if profile.auswahl=="profil_1_b" or profile.auswahl=="profil_2_b" or profile.auswahl=="profil_3_b" then
            profile.auswahl=""
          end
          profile.schreiben=false
        end
      end
    end
  end
end

function profile_mousereleased(x, y, button)
  if button==("l") and y > 400 and profile.bearbeiten then
    love.mouse.setVisible(false)
    profile.bearbeiten=false
    profile.mensch_draw=true
    profile.mouse = false
    profile.schreiben=false
  end
  if profile.bearbeiten and button==("l") and x >= 25 and x <= 175 and y >= 100 and y <= 150 and love.filesystem.exists("Profile/profil_1.txt") then
    love.filesystem.remove("Profile/profil_1.txt")
    love.filesystem.write("Profile/profil_1_name.txt", "Profil 1")
  end
  if profile.bearbeiten and button==("l") and x >= 310 and x <= 460 and y >= 100 and y <= 150 and love.filesystem.exists("Profile/profil_2.txt") then
    love.filesystem.remove("Profile/profil_2.txt")
    love.filesystem.write("Profile/profil_2_name.txt", "Profil 2")
  end
  if profile.bearbeiten and button==("l") and x >= 600 and x <= 750 and y >= 100 and y <= 150 and love.filesystem.exists("Profile/profil_3.txt") then
    love.filesystem.remove("Profile/profil_3.txt")
    love.filesystem.write("Profile/profil_3_name.txt", "Profil 3")
  end
  if profile.bearbeiten and button=="l" and x >= 25 and x <= 175 and y >= 160 and y <= 210 then
    profile.schreiben=true
    profile.auswahl="profil_1_b"
  end
  if profile.bearbeiten and button=="l" and x >= 310 and x <= 460 and y >= 160 and y <= 210 then
    profile.schreiben=true
    profile.auswahl="profil_2_b"
  end
  if profile.bearbeiten and button=="l" and x >= 600 and x <= 750 and y >= 160 and y <= 210 then
    profile.schreiben=true
    profile.auswahl="profil_3_b"
  end
end

function berechneBewegung(x_1, y_1, x_2, y_2)
  local m = (y_2-y_1)/(x_2-x_1)
  x_bewegung=1/math.sqrt(1+m^2)
  y_bewegung=math.sqrt(1-(1/math.sqrt(1+m^2))^2)
  if x_1 > x_2 then
		x_bewegung = x_bewegung*-1
	end
	if y_1 > y_2 then
		y_bewegung = y_bewegung*-1
	end
end