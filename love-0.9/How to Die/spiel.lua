module(...,package.seeall)

local bilderSpiel, win, winX, winY, spielerTab, timer, hindernisse

function spiel.load()
  winX, winY = love.window.getDesktopDimensions(1)
  timer=0
  bilderSpiel={
    leiste=love.graphics.newImage("gfx/spiel/leiste.png");
    spieler_walk1=love.graphics.newImage("gfx/spieler/obj_Walk000.png");
    spieler_walk2=love.graphics.newImage("gfx/spieler/obj_Walk001.png");
    spieler_walk3=love.graphics.newImage("gfx/spieler/obj_Walk002.png");
    spieler_walk4=love.graphics.newImage("gfx/spieler/obj_Walk003.png");
    spieler_walk5=love.graphics.newImage("gfx/spieler/obj_Walk004.png");
    spieler_walk6=love.graphics.newImage("gfx/spieler/obj_Walk005.png");
    spieler_walk7=love.graphics.newImage("gfx/spieler/obj_Walk006.png");
    spieler_walk8=love.graphics.newImage("gfx/spieler/obj_Walk007.png");
    spieler_sprint1=love.graphics.newImage("gfx/spieler/obj_Run000.png");
    spieler_sprint2=love.graphics.newImage("gfx/spieler/obj_Run001.png");
    spieler_sprint3=love.graphics.newImage("gfx/spieler/obj_Run002.png");
    spieler_sprint4=love.graphics.newImage("gfx/spieler/obj_Run003.png");
    spieler_sprint5=love.graphics.newImage("gfx/spieler/obj_Run004.png");
    spieler_sprint6=love.graphics.newImage("gfx/spieler/obj_Run005.png");
    spieler_sprint7=love.graphics.newImage("gfx/spieler/obj_Run006.png");
    spieler_sprint8=love.graphics.newImage("gfx/spieler/obj_Run007.png");
    spieler_idle1=love.graphics.newImage("gfx/spieler/obj_Idle000.png");
    spieler_idle2=love.graphics.newImage("gfx/spieler/obj_Idle001.png");
    spieler_idle3=love.graphics.newImage("gfx/spieler/obj_Idle002.png");
    spieler_idle4=love.graphics.newImage("gfx/spieler/obj_Idle003.png");
    spieler_crouch=love.graphics.newImage("gfx/spieler/obj_Crouch000.png");
    spieler_jump=love.graphics.newImage("gfx/spieler/obj_JumpHigh000.png");
    spieler_jumpHigh=love.graphics.newImage("gfx/spieler/obj_JumpHigher000.png");
    spieler_push=love.graphics.newImage("gfx/spieler/obj_Push000.png");
    spieler_box1=love.graphics.newImage("gfx/spieler/obj_Box000.png");
    spieler_box2=love.graphics.newImage("gfx/spieler/obj_Box001.png");
    spieler_box3=love.graphics.newImage("gfx/spieler/obj_Box002.png");
    spieler_box4=love.graphics.newImage("gfx/spieler/obj_Box003.png");
    spieler_box5=love.graphics.newImage("gfx/spieler/obj_Box004.png");
    spieler_box6=love.graphics.newImage("gfx/spieler/obj_Box005.png");
    spieler_stab1=love.graphics.newImage("gfx/spieler/obj_Stab000.png");
    spieler_stab2=love.graphics.newImage("gfx/spieler/obj_Stab001.png");
    spieler_stab3=love.graphics.newImage("gfx/spieler/obj_Stab002.png");
    spieler_stab4=love.graphics.newImage("gfx/spieler/obj_Stab003.png");
    spieler_gun1=love.graphics.newImage("gfx/spieler/obj_FireGun000.png");
    spieler_gun2=love.graphics.newImage("gfx/spieler/obj_FireGun001.png");
    spieler_gunBig1=love.graphics.newImage("gfx/spieler/obj_FireBigGun000.png");
    spieler_gunBig2=love.graphics.newImage("gfx/spieler/obj_FireBigGun001.png");
  }
  spielerTab={
    x=1000;
    y=400;
    richtung="rechts";
    bewegung="stehen";
    animation=1;
    animationTimer=0;
    gravity=6;
    jumpBoost=0;
    jump=false;
    jumpDouble=false;
    boden=winY-25/192*winY+(25/192*winY)/2-(0.001*winX*128)/2;
    schleichen=false;
    sprint=false;
    waffe=4;
    angriff=false;
  }
  hindernisse={
    {x=0; y=0; breite=winX; hoehe=(25/192*winY)/2};
    {x=0; y=winY-25/192*winY+(25/192*winY)/2; breite=winX; hoehe=25/192*winY};
    {x=0; y=0; breite=(50/683*winX)/2; hoehe = winY};
    {x=winX-50/683*winX+(50/683*winX)/2; y=0; breite=(50/683*winX)/2; hoehe = winY};
    {x=500; y=500; breite=200; hoehe=50};
    {x=700; y=200; breite=200; hoehe=50};
    {x=400; y=100; breite=200; hoehe=50};
  }
end

function spiel.draw()
  love.graphics.draw(bilderSpiel.leiste, 0, 0, 0, 1/2732*winX, 1/1536*winY)
  if spielerTab.bewegung == "gehen" and not spielerTab.schleichen and not spielerTab.jump and not spielerTab.angriff then
    if spielerTab.richtung == "rechts" then
      if spielerTab.sprint then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_sprint1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_sprint2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_sprint3, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_sprint4, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_sprint5, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_sprint6, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 7 then
          love.graphics.draw(bilderSpiel.spieler_sprint7, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 8 then
          love.graphics.draw(bilderSpiel.spieler_sprint8, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        end
      elseif not spielerTab.sprint then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_walk1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_walk2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_walk3, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_walk4, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_walk5, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_walk6, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 7 then
          love.graphics.draw(bilderSpiel.spieler_walk7, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 8 then
          love.graphics.draw(bilderSpiel.spieler_walk8, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        end
      end
    elseif spielerTab.richtung == "links" then
      if spielerTab.sprint then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_sprint1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_sprint2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_sprint3, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_sprint4, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_sprint5, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_sprint6, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 7 then
          love.graphics.draw(bilderSpiel.spieler_sprint7, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        elseif spielerTab.animation == 8 then
          love.graphics.draw(bilderSpiel.spieler_sprint8, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_sprint1:getWidth()/2, bilderSpiel.spieler_sprint1:getHeight()/2)
        end
      elseif not spielerTab.sprint then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_walk1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_walk2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_walk3, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_walk4, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_walk5, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_walk6, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 7 then
          love.graphics.draw(bilderSpiel.spieler_walk7, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        elseif spielerTab.animation == 8 then
          love.graphics.draw(bilderSpiel.spieler_walk8, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_walk1:getWidth()/2, bilderSpiel.spieler_walk1:getHeight()/2)
        end
      end
    end
  elseif spielerTab.bewegung == "stehen" and not spielerTab.schleichen and not spielerTab.jump and not spielerTab.angriff then
    if spielerTab.richtung == "rechts" then
      if spielerTab.animation == 1 then
        love.graphics.draw(bilderSpiel.spieler_idle1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 2 then
        love.graphics.draw(bilderSpiel.spieler_idle2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 3 then
        love.graphics.draw(bilderSpiel.spieler_idle3, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 4 then
        love.graphics.draw(bilderSpiel.spieler_idle4, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      end
    elseif spielerTab.richtung == "links" then
      if spielerTab.animation == 1 then
        love.graphics.draw(bilderSpiel.spieler_idle1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 2 then
        love.graphics.draw(bilderSpiel.spieler_idle2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 3 then
        love.graphics.draw(bilderSpiel.spieler_idle3, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      elseif spielerTab.animation == 4 then
        love.graphics.draw(bilderSpiel.spieler_idle4, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_idle1:getWidth()/2, bilderSpiel.spieler_idle1:getHeight()/2)
      end
    end
  elseif spielerTab.schleichen then
    if spielerTab.richtung == "rechts" then
      love.graphics.draw(bilderSpiel.spieler_crouch, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_crouch:getWidth()/2, bilderSpiel.spieler_crouch:getHeight()/2)
    elseif spielerTab.richtung == "links" then
      love.graphics.draw(bilderSpiel.spieler_crouch, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_crouch:getWidth()/2, bilderSpiel.spieler_crouch:getHeight()/2)
    end
  elseif spielerTab.jump then
    if spielerTab.richtung == "rechts" then
      if spielerTab.jumpDouble then
        love.graphics.draw(bilderSpiel.spieler_jumpHigh, spielerTab.x, spielerTab.y, 0, 0.001*winX, 0.001*winX, bilderSpiel.spieler_jumpHigh:getWidth()/2, bilderSpiel.spieler_jumpHigh:getHeight()/2)
      else
        love.graphics.draw(bilderSpiel.spieler_jump, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_jump:getWidth()/2, bilderSpiel.spieler_jump:getHeight()/2)
      end
    elseif spielerTab.richtung == "links" then
      if spielerTab.jumpDouble then
        love.graphics.draw(bilderSpiel.spieler_jumpHigh, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_jumpHigh:getWidth()/2, bilderSpiel.spieler_jumpHigh:getHeight()/2)
      else
        love.graphics.draw(bilderSpiel.spieler_jump, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_jump:getWidth()/2, bilderSpiel.spieler_jump:getHeight()/2)
      end
    end
    elseif spielerTab.angriff then
      if spielerTab.waffe == 0 then
        if spielerTab.richtung == "rechts" then
          love.graphics.draw(bilderSpiel.spieler_push, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_push:getWidth()/2, bilderSpiel.spieler_push:getHeight()/2)
        elseif spielerTab.richtung == "links" then
          love.graphics.draw(bilderSpiel.spieler_push, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_push:getWidth()/2, bilderSpiel.spieler_push:getHeight()/2)
      end
    elseif spielerTab.waffe == 1 then
      if spielerTab.richtung == "rechts" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_box1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_box2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_box3, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_box4, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_box5, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_box6, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        end
      elseif spielerTab.richtung == "links" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_box1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_box2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_box3, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_box4, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 5 then
          love.graphics.draw(bilderSpiel.spieler_box5, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        elseif spielerTab.animation == 6 then
          love.graphics.draw(bilderSpiel.spieler_box6, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_box1:getWidth()/2, bilderSpiel.spieler_box1:getHeight()/2)
        end
      end
    elseif spielerTab.waffe == 2 then
      if spielerTab.richtung == "rechts" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_stab1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_stab2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_stab3, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_stab4, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        end
      elseif spielerTab.richtung == "links" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_stab1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_stab2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 3 then
          love.graphics.draw(bilderSpiel.spieler_stab3, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        elseif spielerTab.animation == 4 then
          love.graphics.draw(bilderSpiel.spieler_stab4, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_stab1:getWidth()/2, bilderSpiel.spieler_stab1:getHeight()/2)
        end
      end
    elseif spielerTab.waffe == 3 then
      if spielerTab.richtung == "rechts" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_gun1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_gun1:getWidth()/2, bilderSpiel.spieler_gun1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_gun2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_gun1:getWidth()/2, bilderSpiel.spieler_gun1:getHeight()/2)
        end
      elseif spielerTab.richtung == "links" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_gun1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_gun1:getWidth()/2, bilderSpiel.spieler_gun1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_gun2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_gun1:getWidth()/2, bilderSpiel.spieler_gun1:getHeight()/2)
        end
      end
    elseif spielerTab.waffe == 4 then
      if spielerTab.richtung == "rechts" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_gunBig1, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_gunBig1:getWidth()/2, bilderSpiel.spieler_gunBig1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_gunBig2, spielerTab.x, spielerTab.y, 0, 0.001*winX, sx, bilderSpiel.spieler_gunBig1:getWidth()/2, bilderSpiel.spieler_gunBig1:getHeight()/2)
        end
      elseif spielerTab.richtung == "links" then
        if spielerTab.animation == 1 then
          love.graphics.draw(bilderSpiel.spieler_gunBig1, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_gunBig1:getWidth()/2, bilderSpiel.spieler_gunBig1:getHeight()/2)
        elseif spielerTab.animation == 2 then
          love.graphics.draw(bilderSpiel.spieler_gunBig2, spielerTab.x, spielerTab.y, 0, (0.001*winX)/-1, 0.001*winX, bilderSpiel.spieler_gunBig1:getWidth()/2, bilderSpiel.spieler_gunBig1:getHeight()/2)
        end
      end
    end
  end
  for i,v in ipairs(hindernisse) do
    love.graphics.rectangle("line", v.x, v.y, v.breite, v.hoehe)
  end
end

function spiel.update(dt)
  timer=timer+dt
  local frame = dt * 30
  local anzahlGut=0
  for i, v in ipairs (hindernisse) do
    if not kollisionserkennung(spielerTab.x-(30/1366)*winX, spielerTab.y-(25/1366)*winX+(spielerTab.jumpBoost * frame), (60/1366)*winX, (110/1366)*winX+2, v.x, v.y, v.breite, v.hoehe) then
      anzahlGut=anzahlGut+1
    else
      if spielerTab.jumpBoost >= 0 then
        spielerTab.jump = false
        spielerTab.jumpDouble = false
        spielerTab.gravity=(6/786)*winY
      end
      spielerTab.jumpBoost=0
      break
    end
    if anzahlGut == #hindernisse then
      spielerTab.jumpBoost = spielerTab.jumpBoost + (spielerTab.gravity * frame)
      spielerTab.y = spielerTab.y + (spielerTab.jumpBoost * frame)
    end
  end
  if timer >= spielerTab.animationTimer+0.1 then
    spielerTab.animationTimer=timer
    if spielerTab.angriff then
      if spielerTab.waffe == 1 then
        if spielerTab.animation < 6 then
          spielerTab.animation=spielerTab.animation+1
        else
          spielerTab.animation=1
        end
      elseif spielerTab.waffe == 2 then
        if spielerTab.animation < 4 then
          spielerTab.animation=spielerTab.animation+1
        else
          spielerTab.animation=1
        end
      elseif spielerTab.waffe == 3 then
        if spielerTab.animation < 2 then
          spielerTab.animation=spielerTab.animation+1
        else
          spielerTab.animation=1
        end
      elseif spielerTab.waffe == 4 then
        if spielerTab.animation < 2 then
          spielerTab.animation=spielerTab.animation+1
        else
          spielerTab.animation=1
        end
      end
    elseif spielerTab.bewegung == "gehen" then
      if spielerTab.animation < 8 then
        spielerTab.animation=spielerTab.animation+1
      else
        spielerTab.animation=1
      end
    elseif spielerTab.bewegung == "stehen" then
      if spielerTab.animation < 4 then
        spielerTab.animation=spielerTab.animation+1
      else
        spielerTab.animation=1
      end
    end
  end
  local anzahl=0
  if love.keyboard.isDown("a") then
    spielerTab.richtung = "links"
    for i=1, #hindernisse, 1 do
      if spielerTab.sprint and not spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX-0.2*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("d") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x-0.2*winX*dt
        end
      elseif not spielerTab.sprint and not spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX-0.1*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("d") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x-0.1*winX*dt
        end
      elseif spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX-0.025*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("d") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x-0.025*winX*dt
        end
      end
    end
  end
  if love.keyboard.isDown("d") then
    spielerTab.richtung = "rechts"
    for i=1, #hindernisse, 1 do
      if spielerTab.sprint and not spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX+0.2*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("4") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x+0.2*winX*dt
        end
      elseif not spielerTab.sprint and not spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX+0.1*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("a") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x+0.1*winX*dt
        end
      elseif spielerTab.angriff then
        if kollisionserkennung(spielerTab.x-(30/1366)*winX+0.025*winX*dt, spielerTab.y-(25/1366)*winX, (60/1366)*winX, (110/1366)*winX, hindernisse[i].x, hindernisse[i].y, hindernisse[i].breite, hindernisse[i].hoehe) then
          break
        else
          anzahl=anzahl+1
        end
        if anzahl == #hindernisse and not spielerTab.schleichen and not love.keyboard.isDown("a") then
          spielerTab.bewegung = "gehen"
          spielerTab.x=spielerTab.x+0.025*winX*dt
        end
      end
    end
  end
  if not love.keyboard.isDown("a") and not love.keyboard.isDown("d") and not spielerTab.schleichen or love.keyboard.isDown("a") and love.keyboard.isDown("d") and not spielerTab.schleichen then
    spielerTab.bewegung = "stehen"
  end
  if love.keyboard.isDown(" ") and love.keyboard.isDown("lctrl") and not spielerTab.jump and not spielerTab.schleichen then
    spielerTab.gravity=(4/786)*winY
    spielerTab.jumpBoost = -(50/768)*winY
    spielerTab.jump = true
    spielerTab.jumpDouble = true
  elseif love.keyboard.isDown(" ") and not love.keyboard.isDown("lctrl") and not spielerTab.jump and not spielerTab.schleichen then
    spielerTab.gravity=(6/786)*winY
    spielerTab.jumpBoost = -(50/768)*winY
    spielerTab.jump = true
  end
  if love.keyboard.isDown("lshift") then
    spielerTab.schleichen = true
  elseif not love.keyboard.isDown("lshift") then
    spielerTab.schleichen = false
  end
  if love.keyboard.isDown("lctrl") then
    spielerTab.sprint=true
  elseif not love.keyboard.isDown("lctrl") then
    spielerTab.sprint=false
  end
  if love.mouse.isDown("l") then
    spielerTab.angriff=true
  elseif not love.mouse.isDown("l") then
    spielerTab.angriff=false
  end
end

function spiel.kollisionserkennung(x1,y1,b1,h1,x2,y2,b2,h2)
  if x1 + b1 >= x2 and x1 < x2 + b2 and y1 + h1 >= y2 and y1 < y2 + h2 then
    return true
  else
    return false
  end
end