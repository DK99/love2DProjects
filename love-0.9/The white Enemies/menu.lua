--Autor D.K.

module(..., package.seeall)

local charackterZeichnung = require "charackterZeichnung"

local menuTab

function menu.load()
  menuTab={
    zeile=0;
    auswahl=1;
    dkFont=love.graphics.newFont("DKFont.ttf", 100);
    schildzuruecksx=0.2;
    modus="";
    profil=0;
    laden=0;
    auswahl0={
      schwertx=100;
      schildoptionensx=0.5;
      pause=false;
      reset=false;
      hauptmenue=false;
    };
    auswahl1={
      schwertx=100;
      schildoptionensx=0.5;
    };
    auswahl2={
      screen="Fenster";
      sound=100;
      loeschenprofil=0;
      loeschen=false;
    };
    auswahl3={
      schwert1x=100;
      schwert2x=100;
    };
    auswahl4={
      schwert3x=100;
      schwert4x=100;
      schwert5x=100;
    };
    auswahl5={
      schwertBx=100;
      dkFontSchild=love.graphics.newFont("DKFont.ttf", 50);
    };
  }
end

function menu.draw()
  if menuTab.auswahl == 0 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw0()
  elseif menuTab.auswahl == 1 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw1()
  elseif menuTab.auswahl == 2 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw2()
  elseif menuTab.auswahl == 3 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw3()
  elseif menuTab.auswahl == 4 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw4()
  elseif menuTab.auswahl == 5 then
    love.graphics.setFont(menuTab.dkFont)
    menu.draw5()
  end
end
 
function menu.update(dt)
  if menuTab.auswahl == 0 then
    menu.update0(dt)
  elseif menuTab.auswahl == 1 then
    menu.update1(dt)
  elseif menuTab.auswahl == 2 then
    menu.update2(dt)
  elseif menuTab.auswahl == 3 then
    menu.update3(dt)
  elseif menuTab.auswahl == 4 then
    menu.update4(dt)
  elseif menuTab.auswahl == 5 then
    menu.update5(dt)
    charackterZeichnung.setzeVariable(1, menuTab.profil)
    charackterZeichnung.setzeVariable(2, "V")
    charackterZeichnung.charackterZeichnung.ini()
    charackterZeichnung.charackterZeichnung.update(dt)
  end
end

function menu.mousereleased(x, y, button)
  if menuTab.auswahl == 0 then
    menu.mousereleased0(x, y, button)
  elseif menuTab.auswahl == 1 then
    menu.mousereleased1(x, y, button)
  elseif menuTab.auswahl == 2 then
    menu.mousereleased2(x, y, button)
  elseif menuTab.auswahl == 3 then
    menu.mousereleased3(x, y, button)
  elseif menuTab.auswahl == 4 then
    menu.mousereleased4(x, y, button)
  elseif menuTab.auswahl == 5 then
    menu.mousereleased5(x, y, button)
  end
end

function menu.bilderIni(nummer, bild)
  if nummer == 1 then
    menuTab.schildzurueck=bild
  elseif nummer == 2 then
    menuTab.auswahl1.schwert=bild
  elseif nummer == 3 then
    menuTab.auswahl1.schildoptionen=bild
  elseif nummer == 4 then
    menuTab.auswahl2.sound100=bild
  elseif nummer == 5 then
    menuTab.auswahl2.sound90=bild
  elseif nummer == 6 then
    menuTab.auswahl2.sound80=bild
  elseif nummer == 7 then
    menuTab.auswahl2.sound70=bild
  elseif nummer == 8 then
    menuTab.auswahl2.sound60=bild
  elseif nummer == 9 then
    menuTab.auswahl2.sound50=bild
  elseif nummer == 10 then
    menuTab.auswahl2.sound40=bild
  elseif nummer == 11 then
    menuTab.auswahl2.sound30=bild
  elseif nummer == 12 then
    menuTab.auswahl2.sound20=bild
  elseif nummer == 13 then
    menuTab.auswahl2.sound10=bild
  elseif nummer == 14 then
    menuTab.auswahl2.sound0=bild
  elseif nummer == 15 then
    menuTab.auswahl2.vollbild=bild
  elseif nummer == 16 then
    menuTab.auswahl2.fenster=bild
  elseif nummer == 17 then
    menuTab.auswahl2.ja=bild
  elseif nummer == 18 then
    menuTab.auswahl2.nein=bild
  elseif nummer == 19 then
    menuTab.auswahl2.profil1loeschen=bild
  elseif nummer == 20 then
    menuTab.auswahl2.profil2loeschen=bild
  elseif nummer == 21 then
    menuTab.auswahl2.profil3loeschen=bild
  elseif nummer == 22 then
    menuTab.auswahl2.frageprofil1=bild
  elseif nummer == 23 then
    menuTab.auswahl2.frageprofil2=bild
  elseif nummer == 24 then
    menuTab.auswahl2.frageprofil3=bild
  elseif nummer == 25 then
    menuTab.auswahl3.schwert1=bild
  elseif nummer == 26 then
    menuTab.auswahl3.schwert2=bild
  elseif nummer == 27 then
    menuTab.auswahl4.schwert3=bild
  elseif nummer == 28 then
    menuTab.auswahl4.schwert4=bild
  elseif nummer == 29 then
    menuTab.auswahl4.schwert5=bild
  elseif nummer == 30 then
    menuTab.auswahl5.schwertB=bild
  elseif nummer == 31 then
    menuTab.auswahl5.schildR=bild
  elseif nummer == 32 then
    menuTab.auswahl5.schildL=bild
  elseif nummer == 33 then
    menuTab.auswahl5.schildM=bild
  elseif nummer == 34 then
    menuTab.auswahl5.schildW=bild
  elseif nummer == 35 then
    menuTab.auswahl5.schildH=bild
  elseif nummer == 36 then
    menuTab.auswahl5.schildH2=bild
  elseif nummer == 37 then
    menuTab.auswahl5.schildFarben=bild
  elseif nummer == 38 then
    menuTab.auswahl5.schildO=bild
  elseif nummer == 39 then
    menuTab.auswahl5.schildHS=bild
  elseif nummer == 40 then
    menuTab.hintergrund=bild
  elseif nummer == 41 then
    menuTab.auswahl0.schwertH=bild
  elseif nummer == 42 then
    menuTab.titel=bild
  end
end

function menu.setzeVariable(nummer, wert)
  if nummer == 1 then
    menuTab.auswahl0.pause=wert
  elseif nummer == 2 then
    menuTab.auswahl=wert
  elseif nummer == 3 then
    menuTab.auswahl0.hauptmenue=wert
  elseif nummer == 4 then
    menuTab.auswahl4.menuFertig = wert
  elseif nummer == 5 then
    menuTab.auswahl0.reset = wert
  end
end

function menu.gibVariable(nummer)
  if nummer == 1 then
    return menuTab.auswahl0.pause
  elseif nummer == 2 then
    return menuTab.auswahl0.hauptmenue
  elseif nummer == 3 then
    return menuTab.auswahl4.menuFertig
  elseif nummer == 4 then
    return menuTab.profil
  elseif nummer == 5 then
    return menuTab.auswahl0.reset
  end
end

function menu.existiertKollision(x1,y1,b1,h1,x2,y2,b2,h2)
  if x1 + b1 >= x2 and x1 < x2 + b2 and y1 + h1 >= y2 and y1 < y2 + h2  then
    return true
  else
    return false
  end
end

function menu.draw0()
  love.graphics.reset()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.auswahl0.schwertH, menuTab.auswahl0.schwertx, 50, 0, 0.75, sx)
  love.graphics.draw(menuTab.auswahl1.schildoptionen, 505 , 575, 0, menuTab.auswahl0.schildoptionensx, menuTab.auswahl0.schildoptionensx, menuTab.auswahl1.schildoptionen:getWidth()/2, menuTab.auswahl1.schildoptionen:getHeight()/2)
  love.graphics.draw(menuTab.schildzurueck, 75, 700, 0, menuTab.schildzuruecksx, menuTab.schildzuruecksx, menuTab.schildzurueck:getWidth()/2, menuTab.schildzurueck:getHeight()/2)
  love.graphics.setColor(0, 0, 0)
  love.graphics.reset()
end

function menu.update0(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,175,675,200) then
    menuTab.auswahl0.schwertx=200
  else
    menuTab.auswahl0.schwertx=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,360,390,290,375) then
    menuTab.auswahl0.schildoptionensx=0.6
  else
    menuTab.auswahl0.schildoptionensx=0.5
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,17.5, 625, 115, 150) then
    menuTab.schildzuruecksx=0.25
  else
    menuTab.schildzuruecksx=0.2
  end
  love.graphics.reset()
end

function menu.mousereleased0(x, y, button)
  if menu.existiertKollision(x,y,2,2,140,175,675,200) and button == "l" then
    menuTab.auswahl=1
    menuTab.auswahl0.pause=false
    menuTab.auswahl0.hauptmenue=true
    menuTab.auswahl0.reset=true
    menuTab.profil=0
  end
  if menu.existiertKollision(x,y,5,5,360,390,290,375) and button == "l" then
    menuTab.auswahl=2
  end
  if menu.existiertKollision(x,y,2,2,17.5, 625, 115, 150) and button == "l" then
    menuTab.auswahl0.pause=false
    menuTab.auswahl=1
  end
end

function menu.draw1()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.auswahl1.schwert, menuTab.auswahl1.schwertx, 50, 0, 0.75, sx)
  love.graphics.draw(menuTab.auswahl1.schildoptionen, 505 , 575, 0, menuTab.auswahl1.schildoptionensx, menuTab.auswahl1.schildoptionensx, menuTab.auswahl1.schildoptionen:getWidth()/2, menuTab.auswahl1.schildoptionen:getHeight()/2)
  love.graphics.setColor(0, 0, 0)
end

function menu.update1(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,175,675,200) then
    menuTab.auswahl1.schwertx=200
  else
    menuTab.auswahl1.schwertx=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,360,390,290,375) then
    menuTab.auswahl1.schildoptionensx=0.6
  else
    menuTab.auswahl1.schildoptionensx=0.5
  end
  love.graphics.reset()
end

function menu.mousereleased1(x, y, button)
  if menu.existiertKollision(x,y,2,2,140,175,675,200) and button == "l" then
    menuTab.auswahl=4
  end
  if menu.existiertKollision(x,y,5,5,360,390,290,375) and button == "l" then
    menuTab.auswahl=2
  end
end

function menu.draw2()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.schildzurueck, 75, 700, 0, menuTab.schildzuruecksx, menuTab.schildzuruecksx, menuTab.schildzurueck:getWidth()/2, menuTab.schildzurueck:getHeight()/2)
  love.graphics.draw(menuTab.auswahl5.schildL, 100, 350, 0, 0.2, sx)
  love.graphics.draw(menuTab.auswahl5.schildR, 750, 350, 0, 0.2, sx)
  if menuTab.auswahl2.sound==100 then
    love.graphics.draw(menuTab.auswahl2.sound100, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==90 then
    love.graphics.draw(menuTab.auswahl2.sound90, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==80 then
    love.graphics.draw(menuTab.auswahl2.sound80, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==70 then
    love.graphics.draw(menuTab.auswahl2.sound70, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==60 then
    love.graphics.draw(menuTab.auswahl2.sound60, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==50 then
    love.graphics.draw(menuTab.auswahl2.sound50, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==40 then
    love.graphics.draw(menuTab.auswahl2.sound40, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==30 then
    love.graphics.draw(menuTab.auswahl2.sound30, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==20 then
    love.graphics.draw(menuTab.auswahl2.sound20, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==10 then
    love.graphics.draw(menuTab.auswahl2.sound10, 250, 350, 0, 0.2, sx)
  elseif menuTab.auswahl2.sound==0 then
    love.graphics.draw(menuTab.auswahl2.sound0, 250, 350, 0, 0.2, sx)
  end
  if menuTab.auswahl2.screen == "Vollbild" then
    love.graphics.draw(menuTab.auswahl2.vollbild, 100, 200, 0, 0.2, sx)
  elseif menuTab.auswahl2.screen == "Fenster" then
    love.graphics.draw(menuTab.auswahl2.fenster, 100, 200, 0, 0.2, sx)
  end
  if not menuTab.auswahl0.pause then
    if not menuTab.auswahl2.loeschen then
      if love.filesystem.exists("profile/profil_1.txt") then
        love.graphics.draw(menuTab.auswahl2.profil1loeschen, 100, 500, 0, 0.2, sx)
      end
      if love.filesystem.exists("profile/profil_2.txt") then
        love.graphics.draw(menuTab.auswahl2.profil2loeschen, 355, 500, 0, 0.2, sx)
      end
      if love.filesystem.exists("profile/profil_3.txt") then
        love.graphics.draw(menuTab.auswahl2.profil3loeschen, 610, 500, 0, 0.2, sx)
      end
    else
      if menuTab.auswahl2.loeschenprofil == 1 then
        love.graphics.draw(menuTab.auswahl2.frageprofil1, 100, 500, 0, 0.2, sx)
      elseif menuTab.auswahl2.loeschenprofil == 2 then
        love.graphics.draw(menuTab.auswahl2.frageprofil2, 100, 500, 0, 0.2, sx)
      elseif menuTab.auswahl2.loeschenprofil == 3 then
        love.graphics.draw(menuTab.auswahl2.frageprofil3, 100, 500, 0, 0.2, sx)
      end
    love.graphics.draw(menuTab.auswahl2.ja, 200, 650, 0, 0.2, sx)
    love.graphics.draw(menuTab.auswahl2.nein, 550, 650, 0, 0.2, sx)
    end
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.reset()
end

function menu.update2(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,17.5, 625, 115, 150) then
    menuTab.schildzuruecksx=0.25
  else
    menuTab.schildzuruecksx=0.2
  end
  local zeile=1
  if love.filesystem.exists("optionen.txt") then
    for line in love.filesystem.lines("optionen.txt") do
      if zeile==1 then
        menuTab.auswahl2.sound=tonumber(line)
        love.audio.setVolume(menuTab.auswahl2.sound/100)
      elseif zeile==2 then
        menuTab.auswahl2.screen=line
        if menuTab.auswahl2.screen=="Fenster" then
          love.window.setFullscreen(false, "desktop")
        elseif menuTab.auswahl2.screen == "Vollbild" then
          love.window.setFullscreen(true, "desktop")
        end
      end
      zeile=zeile+1
    end
  end
end

function menu.mousereleased2(x, y, button)
  if menu.existiertKollision(x,y,2,2,200, 650, 240, 100) and button == "l" and menuTab.auswahl2.loeschen and not menuTab.auswahl0.pause then
    if menuTab.auswahl2.loeschenprofil == 1 then
      love.filesystem.remove("profile/profil_1.txt")
      love.filesystem.remove("profile/profil_1_schwerter.txt")
      love.filesystem.remove("profile/profil_1_coinsUndAuswahl.txt")
    elseif menuTab.auswahl2.loeschenprofil == 2 then
      love.filesystem.remove("profile/profil_2.txt")
      love.filesystem.remove("profile/profil_2_schwerter.txt")
      love.filesystem.remove("profile/profil_2_coinsUndAuswahl.txt")
    elseif menuTab.auswahl2.loeschenprofil == 3 then
      love.filesystem.remove("profile/profil_3.txt")
      love.filesystem.remove("profile/profil_3_schwerter.txt")
      love.filesystem.remove("profile/profil_3_coinsUndAuswahl.txt")
    end
    menuTab.auswahl2.loeschen=false
    menuTab.auswahl2.loeschenprofil=0
  end
  if menu.existiertKollision(x,y,2,2,550, 650, 240, 100) and button == "l" and menuTab.auswahl2.loeschen and not menuTab.auswahl0.pause then
    menuTab.auswahl2.loeschen=false
    menuTab.auswahl2.loeschenprofil=0
  end
  if menu.existiertKollision(x,y,2,2,100, 500, 240, 100) and button == "l" and not menuTab.auswahl2.loeschen and love.filesystem.exists("profile/profil_1.txt") and not menuTab.auswahl0.pause then
    menuTab.auswahl2.loeschen=true
    menuTab.auswahl2.loeschenprofil=1
  end
  if menu.existiertKollision(x,y,2,2,355, 500, 240, 100) and button == "l" and not menuTab.auswahl2.loeschen and love.filesystem.exists("profile/profil_2.txt") and not menuTab.auswahl0.pause then
    menuTab.auswahl2.loeschen=true
    menuTab.auswahl2.loeschenprofil=2
  end
  if menu.existiertKollision(x,y,2,2,610, 500, 240, 100) and button == "l" and not menuTab.auswahl2.loeschen and love.filesystem.exists("profile/profil_3.txt") and not menuTab.auswahl0.pause then
    menuTab.auswahl2.loeschen=true
    menuTab.auswahl2.loeschenprofil=3
  end
  if menu.existiertKollision(x,y,2,2,17.5, 625, 115, 150) and button == "l" then
    if not menuTab.auswahl0.pause then
      menuTab.auswahl=1
    else
      menuTab.auswahl=0
    end
  end
  if menu.existiertKollision(x,y,2,2,100, 200, 750, 100) and button == "l" then
    if menuTab.auswahl2.screen=="Fenster" then
      menuTab.auswahl2.screen="Vollbild"
      love.window.setFullscreen(true, "desktop")
    elseif menuTab.auswahl2.screen == "Vollbild" then
      menuTab.auswahl2.screen="Fenster"
      love.window.setFullscreen(false, "desktop")
    end
  end
  if menu.existiertKollision(x,y,2,2, 100, 350, 100, 100) and button == "l" and menuTab.auswahl2.sound > 0 then
    menuTab.auswahl2.sound=menuTab.auswahl2.sound-10
    love.audio.setVolume(menuTab.auswahl2.sound/100)
  end
  if menu.existiertKollision(x,y,2,2, 750, 350, 100, 100) and button == "l" and menuTab.auswahl2.sound < 100 then
    menuTab.auswahl2.sound=menuTab.auswahl2.sound+10
    love.audio.setVolume(menuTab.auswahl2.sound/100)
  end
  love.filesystem.write("optionen.txt",menuTab.auswahl2.sound .. "\n" .. menuTab.auswahl2.screen)
end

function menu.draw3()
  love.graphics.reset()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.auswahl3.schwert1, menuTab.auswahl3.schwert1x, 50, 0, 0.75, sx)
  love.graphics.draw(menuTab.auswahl3.schwert2, menuTab.auswahl3.schwert2x, 300, 0, 0.75, sx)
  love.graphics.draw(menuTab.schildzurueck, 75, 700, 0, menuTab.schildzuruecksx, menuTab.schildzuruecksx, menuTab.schildzurueck:getWidth()/2, menuTab.schildzurueck:getHeight()/2)
  love.graphics.setColor(0, 0, 0)
  love.graphics.reset()
end

function menu.update3(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,175,675,200) then
    menuTab.auswahl3.schwert1x=200
  else
    menuTab.auswahl3.schwert1x=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,425,675,200) then
    menuTab.auswahl3.schwert2x=200
  else
    menuTab.auswahl3.schwert2x=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,17.5, 625, 115, 150) then
    menuTab.schildzuruecksx=0.25
  else
    menuTab.schildzuruecksx=0.2
  end
end

function menu.mousereleased3(x, y, button)
  if menu.existiertKollision(x,y,2,2,140,175,675,200) and button == "l" then
    menuTab.auswahl=4
    menuTab.modus="Einzelspieler"
  end
  if menu.existiertKollision(x,y,2,2,140,425,675,200) and button == "l" then
    menuTab.auswahl=4
    menuTab.modus="Mehrspieler"
  end
  if menu.existiertKollision(x,y,2,2,17.5, 625, 115, 150) and button == "l" then
    menuTab.auswahl=1
  end
end

function menu.draw4()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.auswahl4.schwert3, menuTab.auswahl4.schwert3x, 0, 0, 0.75, sx)
  love.graphics.draw(menuTab.auswahl4.schwert4, menuTab.auswahl4.schwert4x, 225, 0, 0.75, sx)
  love.graphics.draw(menuTab.auswahl4.schwert5, menuTab.auswahl4.schwert5x, 450, 0, 0.75, sx)
  love.graphics.draw(menuTab.schildzurueck, 75, 700, 0, menuTab.schildzuruecksx, menuTab.schildzuruecksx, menuTab.schildzurueck:getWidth()/2, menuTab.schildzurueck:getHeight()/2)
  love.graphics.setColor(0, 0, 0)
  love.graphics.reset()
end
  
function menu.update4(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,125,675,200) then
    menuTab.auswahl4.schwert3x=200
  else
    menuTab.auswahl4.schwert3x=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,350,675,200) then
    menuTab.auswahl4.schwert4x=200
  else
    menuTab.auswahl4.schwert4x=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,575,675,200) then
    menuTab.auswahl4.schwert5x=200
  else
    menuTab.auswahl4.schwert5x=100
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,17.5, 625, 115, 150) then
    menuTab.schildzuruecksx=0.25
  else
    menuTab.schildzuruecksx=0.2
  end
end

function menu.mousereleased4(x, y, button)
  if menu.existiertKollision(x,y,2,2,17.5, 625, 115, 150) and button == "l" then
    menuTab.auswahl=1
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,125,675,200) and button == "l" then
    if not love.filesystem.exists("profile/profil_1.txt") then
      menuTab.auswahl=5
      menuTab.profil=1
    else
      menuTab.auswahl4.menuFertig=true
      menuTab.profil=1
    end
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,350,675,200) and button == "l" then
    if not love.filesystem.exists("profile/profil_2.txt") then
      menuTab.auswahl=5
      menuTab.profil=2
    else
      menuTab.auswahl4.menuFertig=true
      menuTab.profil=2
    end
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,140,575,675,200) and button == "l" then
    if not love.filesystem.exists("profile/profil_3.txt") then
      menuTab.auswahl=5
      menuTab.profil=3
    else
      menuTab.auswahl4.menuFertig=true
      menuTab.profil=3
    end
  end
end

function menu.draw5()
  love.graphics.draw(menuTab.hintergrund, 0, 0)
  love.graphics.draw(menuTab.titel, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(menuTab.schildzurueck, 75, 700, 0, menuTab.schildzuruecksx, menuTab.schildzuruecksx, menuTab.schildzurueck:getWidth()/2, menuTab.schildzurueck:getHeight()/2)
  love.graphics.draw(menuTab.auswahl5.schildL, 25, 230, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildR, 325, 230, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildL, 25, 330, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildR, 325, 330, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildL, 25, 430, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildR, 325, 430, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildL, 25, 530, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildR, 325, 530, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildM, 125, 125, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildW, 225, 125, 0, 0.15, sx)
  love.graphics.draw(menuTab.auswahl5.schildH, 110, 226.5, 0, 0.25, 0.2)
  love.graphics.draw(menuTab.auswahl5.schildH2, 110, 326.5, 0, 0.25, 0.2)
  love.graphics.draw(menuTab.auswahl5.schildFarben, 410, 326.5, 0, 0.2, sx)
  love.graphics.draw(menuTab.auswahl5.schildFarben, 410, 426.5, 0, 0.2, sx)
  love.graphics.draw(menuTab.auswahl5.schildFarben, 410, 526.5, 0, 0.2, sx)
  love.graphics.draw(menuTab.auswahl5.schildO, 110, 426.5, 0, 0.25, 0.2)
  love.graphics.draw(menuTab.auswahl5.schildHS, 110, 526.5, 0, 0.25, 0.2)
  love.graphics.draw(menuTab.auswahl5.schwertB, menuTab.auswahl5.schwertBx + 12.5, 550, 0, 0.5, sx)
  charackterZeichnung.draw(750, 450)
  love.graphics.setColor(0, 0, 0)
  love.graphics.reset()
end

function menu.update5(dt)
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,17.5, 625, 115, 150) then
    menuTab.schildzuruecksx=0.25
  else
    menuTab.schildzuruecksx=0.2
  end
  if menu.existiertKollision(love.mouse.getX(),love.mouse.getY(),5,5,137.5, 625, 450, 150) then
    menuTab.auswahl5.schwertBx=150
  else
    menuTab.auswahl5.schwertBx=100
  end
end

function menu.mousereleased5(x, y, button)
  if menu.existiertKollision(x,y,5,5,137.5, 625, 450, 150) and button == "l" then
    menuTab.auswahl4.menuFertig=true
    if menuTab.profil==1 then
      love.filesystem.write("profile/profil_1.txt", charackterZeichnung.gibVariable(3) .. "\n".. charackterZeichnung.gibVariable(4).. "\n" .. charackterZeichnung.gibVariable(5) .. "\n".. charackterZeichnung.gibVariable(6) .. "\n".. charackterZeichnung.gibVariable(7) .. "\n".. charackterZeichnung.gibVariable(8) .. "\n".. charackterZeichnung.gibVariable(9) .. "\n".. charackterZeichnung.gibVariable(10).."\n")
      love.filesystem.write("profile/profil_1_schwerter.txt", 4 .. " " .. 20)
      love.filesystem.write("profile/profil_1_coinsUndAuswahl.txt", 1 .. "\n" .. 0)
    elseif menuTab.profil==2 then
      love.filesystem.write("profile/profil_2.txt", charackterZeichnung.gibVariable(3) .. "\n".. charackterZeichnung.gibVariable(4).. "\n" .. charackterZeichnung.gibVariable(5) .. "\n".. charackterZeichnung.gibVariable(6) .. "\n".. charackterZeichnung.gibVariable(7) .. "\n".. charackterZeichnung.gibVariable(8) .. "\n".. charackterZeichnung.gibVariable(9) .. "\n".. charackterZeichnung.gibVariable(10).."\n")
      love.filesystem.write("profile/profil_2_schwerter.txt", 4 .. " " .. 20)
      love.filesystem.write("profile/profil_2_coinsUndAuswahl.txt", 1 .. "\n" .. 1000000)
    elseif menuTab.profil==3 then
      love.filesystem.write("profile/profil_3.txt", charackterZeichnung.gibVariable(3) .. "\n".. charackterZeichnung.gibVariable(4).. "\n" .. charackterZeichnung.gibVariable(5) .. "\n".. charackterZeichnung.gibVariable(6) .. "\n".. charackterZeichnung.gibVariable(7) .. "\n".. charackterZeichnung.gibVariable(8) .. "\n".. charackterZeichnung.gibVariable(9) .. "\n".. charackterZeichnung.gibVariable(10).."\n")
      love.filesystem.write("profile/profil_3_schwerter.txt", 4 .. " " .. 20)
      love.filesystem.write("profile/profil_3_coinsUndAuswahl.txt", 1 .. "\n" .. 0)
    end
  end
  if menu.existiertKollision(x,y,2,2,17.5, 625, 115, 150) and button == "l" then
    menuTab.auswahl=4
    charackterZeichnung.setzeVariable(1, 0)
    charackterZeichnung.setzeVariable(2, "")
    charackterZeichnung.setzeVariable(3, "m")
    charackterZeichnung.setzeVariable(4, 1)
    charackterZeichnung.setzeVariable(5, 1)
    charackterZeichnung.setzeVariable(6, 1)
    charackterZeichnung.setzeVariable(7, 1)
    charackterZeichnung.setzeVariable(8, 1)
    charackterZeichnung.setzeVariable(9, 1)
    charackterZeichnung.setzeVariable(10, 1)
  end
  if menu.existiertKollision(x,y,2,2, 25, 232, 75, 75) and button == "l" and charackterZeichnung.gibVariable(4) > 1 then
    charackterZeichnung.setzeVariable(4, "-1")
  end
  if menu.existiertKollision(x,y,2,2, 325, 230, 75, 75) and button == "l" and charackterZeichnung.gibVariable(4) < 5 then
    charackterZeichnung.setzeVariable(4, "+1")
  end
  if menu.existiertKollision(x,y,2,2, 125, 125, 75, 75) and button == "l" then
    charackterZeichnung.setzeVariable(3, "m")
  end
  if menu.existiertKollision(x,y,2,2, 225, 125, 75, 75) and button == "l" then
    charackterZeichnung.setzeVariable(3, "f")
  end
  if menu.existiertKollision(x,y,2,2, 25, 330, 75, 75) and button == "l" and charackterZeichnung.gibVariable(5) > 1 then
    charackterZeichnung.setzeVariable(5, "-1")
  end
  if menu.existiertKollision(x,y,2,2, 325, 330, 75, 75) and button == "l" and charackterZeichnung.gibVariable(5) < 6 then
    charackterZeichnung.setzeVariable(5, "+1")
  end
  if menu.existiertKollision(x,y,2,2, 430, 335, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 1)
  end
  if menu.existiertKollision(x,y,2,2, 455, 335, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 2)
  end
  if menu.existiertKollision(x,y,2,2, 480, 335, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 3)
  end
  if menu.existiertKollision(x,y,2,2, 505, 335, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 4)
  end
  if menu.existiertKollision(x,y,2,2, 530, 335, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 5)
  end
  if menu.existiertKollision(x,y,2,2, 430, 375, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 6)
  end
  if menu.existiertKollision(x,y,2,2, 455, 375, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 7)
  end
  if menu.existiertKollision(x,y,2,2, 480, 375, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 8)
  end
  if menu.existiertKollision(x,y,2,2, 505, 375, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 9)
  end
  if menu.existiertKollision(x,y,2,2, 530, 375, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(6, 10)
  end
  if menu.existiertKollision(x,y,2,2, 25, 430, 75, 75) and button == "l" and charackterZeichnung.gibVariable(7) > 1 then
    charackterZeichnung.setzeVariable(7, "-1")
  end
  if menu.existiertKollision(x,y,2,2, 325, 430, 75, 75) and button == "l" and charackterZeichnung.gibVariable(7) < 6 then
    charackterZeichnung.setzeVariable(7, "+1")
  end
  if menu.existiertKollision(x,y,2,2, 430, 435, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 1)
  end
  if menu.existiertKollision(x,y,2,2, 455, 435, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 2)
  end
  if menu.existiertKollision(x,y,2,2, 480, 435, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 3)
  end
  if menu.existiertKollision(x,y,2,2, 505, 435, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 4)
  end
  if menu.existiertKollision(x,y,2,2, 530, 435, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 5)
  end
  if menu.existiertKollision(x,y,2,2, 430, 475, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 6)
  end
  if menu.existiertKollision(x,y,2,2, 455, 475, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 7)
  end
  if menu.existiertKollision(x,y,2,2, 480, 475, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 8)
  end
  if menu.existiertKollision(x,y,2,2, 505, 475, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 9)
  end
  if menu.existiertKollision(x,y,2,2, 530, 475, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(8, 10)
  end
  if menu.existiertKollision(x,y,2,2, 25, 530, 75, 75) and button == "l" and charackterZeichnung.gibVariable(9) > 1 then
    charackterZeichnung.setzeVariable(9, "-1")
  end
  if menu.existiertKollision(x,y,2,2, 325, 530, 75, 75) and button == "l" and charackterZeichnung.gibVariable(9) < 6 then
    charackterZeichnung.setzeVariable(9, "+1")
  end
  if menu.existiertKollision(x,y,2,2, 430, 535, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 1)
  end
  if menu.existiertKollision(x,y,2,2, 455, 535, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 2)
  end
  if menu.existiertKollision(x,y,2,2, 480, 535, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 3)
  end
  if menu.existiertKollision(x,y,2,2, 505, 535, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 4)
  end
  if menu.existiertKollision(x,y,2,2, 530, 535, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 5)
  end
  if menu.existiertKollision(x,y,2,2, 430, 575, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 6)
  end
  if menu.existiertKollision(x,y,2,2, 455, 575, 20, 20) and button == "l"  then
   charackterZeichnung.setzeVariable(10, 7)
  end
  if menu.existiertKollision(x,y,2,2, 480, 575, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 8)
  end
  if menu.existiertKollision(x,y,2,2, 505, 575, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 9)
  end
  if menu.existiertKollision(x,y,2,2, 530, 575, 20, 20) and button == "l"  then
    charackterZeichnung.setzeVariable(10, 10)
  end
end