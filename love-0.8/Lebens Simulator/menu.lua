module(..., package.seeall)
spielTabelle=require 'spielTabelle'

menu={
  hintergrund=love.graphics.newImage("gfx/menu/hintergrund.png");
  mensch=love.graphics.newImage("gfx/menu/mensch.png");
  strasse=love.graphics.newImage("gfx/menu/strasse.png");
  strasse2=love.graphics.newImage("gfx/menu/strasse2.png");
  haus_1=love.graphics.newImage("gfx/menu/haus_1.png");
  haus_2=love.graphics.newImage("gfx/menu/haus_2.png");
  auto_1=love.graphics.newImage("gfx/menu/auto_1.png");
  auto_2=love.graphics.newImage("gfx/menu/auto_2.png");
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
  }

function menu_draw()
  love.graphics.setColorMode("replace")
  love.graphics.draw(menu.hintergrund, 0, 0)
  love.graphics.draw(menu.strasse, -50, 365)
  love.graphics.draw(menu.strasse2, 330, -25, 0, 0.5, sx)
  love.graphics.draw(menu.haus_1, 50, 150, 0, 0.5, sx)
  love.graphics.draw(menu.haus_2, 450, 150, 0, 0.5, sx)
  love.graphics.print("Profile", 125, 235)
  love.graphics.print("Optionen", 510, 235)
  if menu.mensch_draw then
    love.graphics.draw(menu.mensch, menu.x - 29, menu.y, 0, 0.2, sx)
  end
  if menu.auswahl=="profile" then
    love.graphics.draw(menu.auto_1, menu.auto_x, 475, 0, 0.5, sx)
  elseif menu.auswahl=="optionen" then
    love.graphics.draw(menu.auto_2, menu.auto_x, 475, 0, 0.5, sx)
  end
end

function menu_update(dt)
  love.mouse.setVisible(false)
  if not menu.mouse then
    menu.x, menu.y = love.mouse.getPosition()
  end
  if love.mouse.isDown("l") or menu.mouse then
    menu.mouse = true
    if menu.x < 400 then
      if menu.x >= 244 and menu.x <= 246 and menu.y >= 324 and menu.y <= 326 then
        menu.text_1=true
        menu.text_2=true
        menu.y_fertig=true
        menu.auswahl="profile"
      elseif menu.auto_x < 0 then
        berechneBewegung(menu.x, menu.y, 245, 325)
        menu.x = menu.x + x_bewegung*dt*200
        menu.y = menu.y + y_bewegung*dt*200
      end
    elseif menu.x >= 400 then      
      if menu.x >= 644 and menu.x <= 646 and menu.y >= 324 and menu.y <= 326 then
        menu.text_1=true
        menu.text_2=true
        menu.y_fertig=true
        menu.auswahl="optionen"
      elseif menu.auto_x < 0 then
        berechneBewegung(menu.x, menu.y, 645, 325)
        menu.x = menu.x + x_bewegung*dt*200
        menu.y = menu.y + y_bewegung*dt*200
      end
    end
  end
  if menu.x_fertig and menu.y_fertig then
    spielTabelle.szene=menu.auswahl
    menu.x=0
    menu.y=0
    menu.mouse=false
    menu.x_fertig=false
    menu.y_fertig=false
    menu.auto_x=-400
    menu.auswahl=""
    menu.text_1=false
    menu.text_2=false
    menu.mensch_draw=true
  end
  if menu.auto_x <= 850 then
    if menu.auswahl=="profile" then
      if menu.auto_x <= 100 then
        menu.auto_x=menu.auto_x+500*dt
      elseif menu.y >= 475 then
        menu.mensch_draw=false
        menu.auto_x=menu.auto_x+500*dt
      else
        menu.y=menu.y+200*dt
      end
    elseif menu.auswahl=="optionen" then
       if menu.auto_x <= 500 then
        menu.auto_x=menu.auto_x+500*dt
      elseif menu.y >= 475 then
        menu.mensch_draw=false
        menu.auto_x=menu.auto_x+500*dt
      else
        menu.y=menu.y+200*dt
      end
    end
  else
    menu.x_fertig=true
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