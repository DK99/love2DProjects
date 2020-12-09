--Autor D.K.

module(..., package.seeall)

local menu = require "menu"
local schwerterTab, schwerterAll

function schwerter.load()
  schwerterTab={
    schwertNummerOben=1;
    inventarAngezeigt=0;
    ausgewaehlt=0;
    dkFont2=love.graphics.newFont("DKFont.ttf", 100);
    dkFont=love.graphics.newFont("DKFont.ttf", 40);
  }
  schwerterAll={}
end

function schwerter.bilderIni(nummer, bild)
  if nummer == 1 then
    schwerterTab.w_2hsword=bild
  elseif nummer == 2 then
    schwerterTab.w_katana=bild
  elseif nummer == 3 then
    schwerterTab.w_katana_fire=bild
  elseif nummer == 4 then
    schwerterTab.w_longsword02=bild
  elseif nummer == 5 then
    schwerterTab.w_mace=bild
  elseif nummer == 6 then
    schwerterTab.w_mace_dark=bild
  elseif nummer == 7 then
    schwerterTab.w_mace_fire=bild
  elseif nummer == 8 then
    schwerterTab.w_sword_roman=bild
  elseif nummer == 9 then
    schwerterTab.w_sword_roman_dark=bild
  elseif nummer == 10 then
    schwerterTab.pfeil=bild
  elseif nummer == 11 then
    schwerterTab.leiste=bild
  end
end

function schwerter.ladeSchwerterProfil()
  schwerterTab.profil=menu.gibVariable(4)
  local zeile = 1
  if schwerterTab.profil == 1 then
    for line in love.filesystem.lines("profile/profil_1_schwerter.txt") do
      ladeSchwerter(line)
    end
    for line in love.filesystem.lines("profile/profil_1_coinsUndAuswahl.txt") do
      if zeile == 1 then
        schwerterTab.ausgewaehlt = tonumber(line)
        zeile=zeile+1
      end
    end
  elseif schwerterTab.profil == 2 then
    for line in love.filesystem.lines("profile/profil_2_schwerter.txt") do
      ladeSchwerter(line)
    end
    for line in love.filesystem.lines("profile/profil_2_coinsUndAuswahl.txt") do
      if zeile == 1 then
        schwerterTab.ausgewaehlt = tonumber(line)
        zeile=zeile+1
      end
    end
  elseif schwerterTab.profil == 3 then
    for line in love.filesystem.lines("profile/profil_3_schwerter.txt") do
      ladeSchwerter(line)
    end
    for line in love.filesystem.lines("profile/profil_3_coinsUndAuswahl.txt") do
      if zeile == 1 then
        schwerterTab.ausgewaehlt = tonumber(line)
        zeile=zeile+1
      end
    end
  end
end

function schwerter.ladeSchwerter(line)
  local temp = {
    bild = tonumber(string.sub(line, 1, 1));
    dmg = tonumber(string.sub(line, 3));
  }
  table.insert(schwerterAll, temp)
end

function schwerter.update(dt)
  if #schwerterAll >= 8 then
    schwerterTab.inventarAngezeigt=8
  elseif #schwerterAll == 7 then
    schwerterTab.inventarAngezeigt=7
  elseif #schwerterAll == 6 then
    schwerterTab.inventarAngezeigt=6
  elseif #schwerterAll == 5 then
    schwerterTab.inventarAngezeigt=5
  elseif #schwerterAll == 4 then
    schwerterTab.inventarAngezeigt=4
  elseif #schwerterAll == 3 then
    schwerterTab.inventarAngezeigt=3
  elseif #schwerterAll == 2 then
    schwerterTab.inventarAngezeigt=2
  elseif #schwerterAll == 1 then
    schwerterTab.inventarAngezeigt=1
  end
end

function schwerter.drawInventar()
  love.graphics.reset()
  love.graphics.setFont(schwerterTab.dkFont)
  for i = 0, schwerterTab.inventarAngezeigt-1, 1 do
    if schwerterTab.ausgewaehlt == schwerterTab.schwertNummerOben+i then
      love.graphics.rectangle("line", 700, 100*(i), 300, 100)
    end
    if schwerterAll[schwerterTab.schwertNummerOben+i].bild == 1 then
      love.graphics.draw(schwerterTab.w_2hsword, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 2 then
      love.graphics.draw(schwerterTab.w_katana, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 3 then
      love.graphics.draw(schwerterTab.w_katana_fire, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 4 then
      love.graphics.draw(schwerterTab.w_longsword02, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 5 then
      love.graphics.draw(schwerterTab.w_mace, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 6 then
      love.graphics.draw(schwerterTab.w_mace_dark, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 7 then
      love.graphics.draw(schwerterTab.w_mace_fire, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 8 then
      love.graphics.draw(schwerterTab.w_sword_roman, 710, 100*i, 0, 1.5625, sx)
    elseif schwerterAll[schwerterTab.schwertNummerOben+i].bild == 9 then
      love.graphics.draw(schwerterTab.w_sword_roman_dark, 710, 100*i, 0, 1.5625, sx)
    end
    love.graphics.print("Schaden:\n"..schwerterAll[schwerterTab.schwertNummerOben+i].dmg, 835, 100*i+10)
  end
  love.graphics.draw(schwerterTab.pfeil, 665.5, 37.5, math.rad(-90), 0.15, sx, schwerterTab.pfeil:getWidth()/2, schwerterTab.pfeil:getHeight()/2)
  love.graphics.draw(schwerterTab.pfeil, 665.5, 765.5, math.rad(90), 0.15, sx, schwerterTab.pfeil:getWidth()/2, schwerterTab.pfeil:getHeight()/2)
  love.graphics.draw(schwerterTab.leiste, 665.5, 75, 0, 0.15, 0.151, schwerterTab.leiste:getWidth()/2)
  love.graphics.setColor(255, 255, 255) 
end

function schwerter.mousereleased(x, y, button)
  if x+2 >= 628 and x < 703 and y+2 >= 0 and y < 75 and button=="l" and schwerterTab.schwertNummerOben ~= 1 then
    schwerterTab.schwertNummerOben=schwerterTab.schwertNummerOben-1
  end
  if x+2 >= 628 and x < 703 and y+2 >= 728 and y < 803 and button=="l" and schwerterTab.schwertNummerOben + 7 < #schwerterAll then
    schwerterTab.schwertNummerOben=schwerterTab.schwertNummerOben+1
  end
  for i = 0, schwerterTab.inventarAngezeigt-1, 1 do
    if x+2 >= 700 and x < 1000 and y+2 >= 100*i and y < 110+(100*i) and button=="l" then
      schwerterTab.ausgewaehlt=schwerterTab.schwertNummerOben+i
      local zeile = 1
      local coins = 0
      if schwerterTab.profil == 1 then
        for line in love.filesystem.lines("profile/profil_1_coinsUndAuswahl.txt") do
          if zeile == 2 then
            coins = tonumber(line)
          end
          zeile=zeile+1
        end
        love.filesystem.write("profile/profil_1_coinsUndAuswahl.txt", schwerterTab.ausgewaehlt.."\n"..coins)
      elseif schwerterTab.profil == 2 then
        for line in love.filesystem.lines("profile/profil_2_coinsUndAuswahl.txt") do
          if zeile == 2 then
            coins = tonumber(line)
          end
          zeile=zeile+1
        end
        love.filesystem.write("profile/profil_2_coinsUndAuswahl.txt", schwerterTab.ausgewaehlt.."\n"..coins)
      elseif schwerterTab.profil == 3 then
        for line in love.filesystem.lines("profile/profil_3_coinsUndAuswahl.txt") do
          if zeile == 2 then
            coins = tonumber(line)
          end
          zeile=zeile+1
        end
        love.filesystem.write("profile/profil_3_coinsUndAuswahl.txt", schwerterTab.ausgewaehlt.."\n"..coins)
      end
    end
  end
end

function schwerter.neuesSchwert(bild, dmg)
  if schwerterTab.profil == 1 then
    love.filesystem.append("profile/profil_1_schwerter.txt", "\n" .. bild .. " " .. dmg)
  elseif schwerterTab.profil == 2 then
    love.filesystem.append("profile/profil_1_schwerter.txt", "\n" .. bild .. " " .. dmg)
  elseif schwerterTab.profil == 3 then
    love.filesystem.append("profile/profil_1_schwerter.txt", "\n" .. bild .. " " .. dmg)
  end
  ladeSchwerter(bild.." "..dmg)
end

function schwerter.reset()
  for i,v in ipairs(schwerterAll) do 
    table.remove(schwerterAll, i) 
  end
  schwerterTab.schwertNummerOben=1
  schwerterTab.inventarAngezeigt=0
  schwerterTab.ausgewaehlt=0
  schwerterTab.profil=0
end

function schwerter.drawSchwert(grad, y)
  love.graphics.reset()
  if charackterZeichnung.gibVariable(2) == "L" then
    if schwerterAll[schwerterTab.ausgewaehlt].bild == 1 then
      love.graphics.draw(schwerterTab.w_2hsword, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_2hsword:getWidth(), schwerterTab.w_2hsword:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 2 then
      love.graphics.draw(schwerterTab.w_katana, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_katana:getWidth(), schwerterTab.w_katana:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 3 then
      love.graphics.draw(schwerterTab.w_katana_fire, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_katana_fire:getWidth(), schwerterTab.w_katana_fire:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 4 then
      love.graphics.draw(schwerterTab.w_longsword02, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_longsword02:getWidth(), schwerterTab.w_longsword02:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 5 then
      love.graphics.draw(schwerterTab.w_mace, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_mace:getWidth(), schwerterTab.w_mace:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 6 then
      love.graphics.draw(schwerterTab.w_mace_dark, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_mace_dark:getWidth(), schwerterTab.w_mace_dark:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 7 then
      love.graphics.draw(schwerterTab.w_mace_fire, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_mace_fire:getWidth(), schwerterTab.w_mace_fire:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 8 then
      love.graphics.draw(schwerterTab.w_sword_roman, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_sword_roman:getWidth(), schwerterTab.w_sword_roman:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 9 then
      love.graphics.draw(schwerterTab.w_sword_roman_dark, 380, y+275, math.rad(grad), 1, sx, schwerterTab.w_sword_roman_dark:getWidth(), schwerterTab.w_sword_roman_dark:getHeight())
    end
  elseif charackterZeichnung.gibVariable(2) == "R" then
    if schwerterAll[schwerterTab.ausgewaehlt].bild == 1 then
      love.graphics.draw(schwerterTab.w_2hsword, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_2hsword:getWidth(), schwerterTab.w_2hsword:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 2 then
      love.graphics.draw(schwerterTab.w_katana, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_katana:getWidth(), schwerterTab.w_katana:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 3 then
      love.graphics.draw(schwerterTab.w_katana_fire, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_katana_fire:getWidth(), schwerterTab.w_katana_fire:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 4 then
      love.graphics.draw(schwerterTab.w_longsword02, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_longsword02:getWidth(), schwerterTab.w_longsword02:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 5 then
      love.graphics.draw(schwerterTab.w_mace, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_mace:getWidth(), schwerterTab.w_mace:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 6 then
      love.graphics.draw(schwerterTab.w_mace_dark, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_mace_dark:getWidth(), schwerterTab.w_mace_dark:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 7 then
      love.graphics.draw(schwerterTab.w_mace_fire, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_mace_fire:getWidth(), schwerterTab.w_mace_fire:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 8 then
      love.graphics.draw(schwerterTab.w_sword_roman, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_sword_roman:getWidth(), schwerterTab.w_sword_roman:getHeight())
    elseif schwerterAll[schwerterTab.ausgewaehlt].bild == 9 then
      love.graphics.draw(schwerterTab.w_sword_roman_dark, 420, y+275, math.rad(grad), -1, 1, schwerterTab.w_sword_roman_dark:getWidth(), schwerterTab.w_sword_roman_dark:getHeight())
    end
  end
end

function schwerter.ausgewaehltDmg()
  return schwerterAll[schwerterTab.ausgewaehlt].dmg
end