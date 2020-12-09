----------------------http://goo.gl/QKjP7m
-- Overworld Map                        --
--  @author markundk                    --
------------------------------------------
--
module(...,package.seeall)
local level = require "level"
local menu = require "menu"
--
local plainsPic, desertPic, seaPic,
      plainsDesertPic, seaPlainsPic, desertPlainsPic,
      beginnCityPic, bigCityPic, font
function overworld_module.load()
  overworld_module.rX = 0
  overworld_module.rY = 30
  overworld_module.rXPRE = 0
  overworld_module.rYPRE = 30
  overworld_module.aktuellesFeld = 1
  overworld_module.aktuellesFeldSwitch = false
  overworld_module.weiterleiten = false
  overworld_module.weiterleitenFeld = 0
  overworld_module.font = love.graphics.newFont(12)
  overworld_module.profil=0
end
--
function overworld_module.mapLoad()
  overworld_module.map = { 
    { pic = overworld_module.seaPlainsPic,
      name = "Strand zu Knebro",
      x = 0,
      y = 30,
      open = false,
      kosten = 100,
      nummer = 1
    },
    { pic = overworld_module.beginnCityPic,
      name = "Knebro",
      x = 128,
      y = 30,
      open = true,
      nummer = 2
    },
    { pic = overworld_module.plainsPic, 
      name = "Erste Schritte",
      x = 256,
      y = 30,
      open = false,
      kosten = 100,
      nummer = 3
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 30,
      open = false,
      kosten = 150,
      nummer = 4
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 30,
      open = false,
      kosten = 200,
      nummer = 5
    },
    { pic = overworld_module.desertPlainsPic, 
      name = "randomized",
      x = 640,
      y = 30,
      open = false,
      kosten = 250,
      nummer = 6
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 768,
      y = 30,
      open = false,
      kosten = 300,
      nummer = 7
    },
    --
    { pic = overworld_module.seaPlainsPic, 
      name = "randomized",
      x = 0,
      y = 158,
      open = false,
      kosten = 150,
      nummer = 8
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 128,
      y = 158,
      open = false,
      kosten = 100,
      nummer = 9
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 256,
      y = 158,
      open = false,
      kosten = 150,
      nummer = 10
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 158,
      open = false,
      kosten = 200,
      nummer = 11
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 158,
      open = false,
      kosten = 250,
      nummer = 12
    },
    { pic = overworld_module.desertPlainsPic, 
      name = "randomized",
      x = 640,
      y = 158,
      open = false,
      kosten = 300,
      nummer = 13
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 768,
      y = 158,
      open = false,
      kosten = 350,
      nummer = 14
    },
    --
    { pic = overworld_module.seaPlainsPic,
      name = "randomized",
      x = 0,
      y = 286,
      open = false,
      kosten = 200,
      nummer = 15
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 128,
      y = 286,
      open = false,
      kosten = 150,
      nummer = 16
    },
    { pic = overworld_module.plainsPic,
      name = "randomized", 
      x = 256,
      y = 286,
      open = false,
      kosten = 200,
      nummer = 17
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 286,
      open = false,
      kosten = 250,
      nummer = 18
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 286,
      open = false,
      kosten = 300,
      nummer = 19
    },
    { pic = overworld_module.desertPlainsPic, 
      name = "randomized",
      x = 640,
      y = 286,
      open = false,
      kosten = 350,
      nummer = 20
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 768,
      y = 286,
      open = false,
      kosten = 400,
      nummer = 21
    },
    --
    { pic = overworld_module.seaPlainsPic, 
      name = "randomized",
      x = 0,
      y = 414,
      open = false,
      kosten = 250,
      nummer = 22
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 128,
      y = 414,
      open = false,
      kosten = 200,
      nummer = 23
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 256,
      y = 414,
      open = false,
      kosten = 250,
      nummer = 24
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 414,
      open = false,
      kosten = 300,
      nummer = 25
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 414,
      open = false,
      kosten = 350,
      nummer = 26
    },
    { pic = overworld_module.desertPlainsPic, 
      name = "randomized",
      x = 640,
      y = 414,
      open = false,
      kosten = 400,
      nummer = 27
    },
    { pic = overworld_module.bigCityPic,
      name = "Knebopolis",
      x = 768,
      y = 414,
      open = false,
      kosten = 450,
      nummer = 28
    },
    --
    { pic = overworld_module.seaPlainsPic, 
      name = "randomized",
      x = 0,
      y = 542,
      open = false,
      kosten = 300,
      nummer = 29
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 128,
      y = 542,
      open = false,
      kosten = 250,
      nummer = 30
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 256,
      y = 542,
      open = false,
      kosten = 300,
      nummer = 31
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 542,
      open = false,
      kosten = 350,
      nummer = 32
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 542,
      open = false,
      kosten = 400,
      nummer = 33
    },
    { pic = overworld_module.desertPlainsPic, 
      name = "randomized",
      x = 640,
      y = 542,
      open = false,
      kosten = 450,
      nummer = 34
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 768,
      y = 542,
      open = false,
      kosten = 500,
      nummer = 35
    },
    --
    { pic = overworld_module.seaPlainsPic, 
      name = "randomized",
      x = 0,
      y = 670,
      open = false,
      kosten = 350,
      nummer = 36
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 128,
      y = 670,
      open = false,
      kosten = 300,
      nummer = 37
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 256,
      y = 670,
      open = false,
      kosten = 350,
      nummer = 38
    },
    { pic = overworld_module.plainsDesertPic, 
      name = "randomized",
      x = 384,
      y = 670,
      open = false,
      kosten = 400,
      nummer = 39
    },
    { pic = overworld_module.desertPic, 
      name = "randomized",
      x = 512,
      y = 670,
      open = false,
      kosten = 450,
      nummer = 40
    },
    { pic = overworld_module.desertPlainsPic,
      name = "randomized", 
      x = 640,
      y = 670,
      open = false,
      kosten = 500,
      nummer = 41
    },
    { pic = overworld_module.plainsPic, 
      name = "randomized",
      x = 768,
      y = 670,
      open = false,
      kosten = 550,
      nummer = 42
    },
  }
end
--
function overworld_module.profilIni()
  local zeile=1
  if overworld_module.profil == 1 then
    for line in love.filesystem.lines("profile/profil_1.txt") do
      if zeile == 9 then
        overworld_module.suche(line)
      end
      zeile=zeile+1
    end
  elseif overworld_module.profil == 2 then
    for line in love.filesystem.lines("profile/profil_2.txt") do
      if zeile == 9 then
        overworld_module.suche(line)
      end
      zeile=zeile+1
    end
  elseif overworld_module.profil == 3 then
    for line in love.filesystem.lines("profile/profil_3.txt") do
      if zeile == 9 then
        overworld_module.suche(line)
      end
      zeile=zeile+1
    end
  end
end
--
function overworld_module.suche(line)
  for nummer = 1, 42, 1 do
    nBeginn, nEnde = string.find(line, " "..nummer.." ")
    if nBeginn ~= nil then
      overworld_module.oeffneLevel(nummer)
    end
  end
end
--
function overworld_module.oeffneLevel(nummer)
  for i,z in ipairs (overworld_module.map) do
    if z.nummer == nummer then
      z.open=true
    end
  end
end
--
function overworld_module.bilderIni(number, picture)
  if number == 1 then
    overworld_module.plainsPic = picture
  elseif number == 2 then
    overworld_module.desertPic = picture
  elseif number == 3 then
    overworld_module.plainsDesertPic = picture
  elseif number == 4 then
    overworld_module.desertPlainsPic = picture
  elseif number == 5 then
    overworld_module.seaPlainsPic = picture
  elseif number == 6 then
    overworld_module.beginnCityPic = picture
  elseif number == 7 then
    overworld_module.bigCityPic = picture
  end
end
--
function overworld_module.draw()
  love.graphics.setFont(overworld_module.font)
  for i,z in ipairs (overworld_module.map) do
    if z.open == false then
      love.graphics.setColor(100,100,100,255)
      love.graphics.draw(z.pic,z.x,z.y,0,2,2)
    else
      love.graphics.setColor(255,255,255,255)
      love.graphics.draw(z.pic,z.x,z.y,0,2,2)
    end
  end
  love.graphics.setColor(255,255,255,255)
  --love.graphics.print("OVERWORLD MM(O)\n\n  @ markundk\n\n  @ DK Development\n\n  @Daniel A.",400,400,0,2)
  love.graphics.rectangle("line",overworld_module.rX,overworld_module.rY,128,128)
  overworld_module.gibFeldInfo(overworld_module.map[aktuellesFeld],10,10)
  love.graphics.print("C: " .. level.Geld(0),900,10)
end
--
function overworld_module.mouse(x,y,button)
  if button == "l" then
    overworld_module.rXPRE = overworld_module.rX
    overworld_module.rYPRE = overworld_module.rY
    for i,z in ipairs (overworld_module.map) do
      if x >= z.x and x <= z.x+128 and y >= z.y and y <= z.y+128 then
        overworld_module.rX = z.x
        overworld_module.rY = z.y
        if overworld_module.rX == overworld_module.rXPRE and overworld_module.rY == overworld_module.rYPRE then
          if z.open == true then
            overworld_module.weiterleiten=true
            overworld_module.weiterleitenFeld=z.nummer
            if z.nummer == 2 then
              level.gibLevel("plains",0)
              gegner.setzeSchwierigkeit(1)
            else
              gegner.setzeSchwierigkeit(0.02*z.kosten)
              if z.nummer == 4 or z.nummer == 5 or z.nummer == 6 or z.nummer == 11 or z.nummer == 12 or z.nummer == 13 or z.nummer == 18 or z.nummer == 19 or z.nummer == 20 or z.nummer == 25 or z.nummer == 26 or z.nummer == 27 or z.nummer == 32 or z.nummer == 33 or z.nummer == 34 or z.nummer == 39 or z.nummer == 40 or z.nummer == 41 then
                level.gibLevel("desert",0.02*z.kosten-1)
              else
                level.gibLevel("plains",0.02*z.kosten-1)
              end
            end
          elseif z.open == false and z.kosten <= level.Geld(0) and overworld_module.checkFeld(i) == true then
            level.Geld(-z.kosten)
            if overworld_module.profil == 1 then
              love.filesystem.append("profile/profil_1.txt", " " .. z.nummer .. " ")
            elseif overworld_module.profil == 2 then
              love.filesystem.append("profile/profil_2.txt", " " .. z.nummer .. " ")
            elseif overworld_module.profil == 3 then
              love.filesystem.append("profile/profil_3.txt", " " .. z.nummer .. " ")
            end
            z.open = true
          end
        end
      end
    end
    overworld_module.aktuellesFeldSwitch = true
  end
end
--
function overworld_module.weiterleitung()
  if overworld_module.weiterleiten then
    overworld_module.weiterleiten = false
    return overworld_module.weiterleitenFeld
  else
    return 0
  end
end
--
function overworld_module.gibFeldInfo(feld,x,y)
  love.graphics.setColor(255,255,255,255)
  if feld.open == true then
    love.graphics.print("Level ist verfügbar!",x,y)
    love.graphics.print("Name: " .. feld.name,x+200,y)
    love.graphics.print("Klicken um Level zu starten",x+375,y)
  elseif feld.name == "Meer Ohne Namen" then
    love.graphics.print("Level gibt es nicht!",x,y)
    love.graphics.print("Name: " .. feld.name,x+200,y)
  else
    love.graphics.print("Level ist nicht verfügbar!",x,y)
    love.graphics.print("Name: Unbekannt",x+200,y)
    love.graphics.print("Klicken um zu kaufen, für " .. feld.kosten .. "C",x+375,y)
  end
end
--
function overworld_module.update(dt)
  overworld_module.coins=level.Geld(0)
  overworld_module.profil=menu.gibVariable(4)
  if overworld_module.aktuellesFeldSwitch == true then
    for i,z in ipairs (overworld_module.map) do
      if overworld_module.rX == z.x and overworld_module.rY == z.y then
        overworld_module.aktuellesFeld = i
        overworld_module.aktuellesFeldSwitch = false
      end
    end
  end
end
--
function overworld_module.checkFeld(v)
  if overworld_module.map[v-1] ~= nil then
    if overworld_module.map[v-1].open == true then
      return true
    end
  end
  if overworld_module.map[v+1] ~= nil then
    if overworld_module.map[v+1].open == true then
      return true
    end
  end
  if overworld_module.map[v-7] ~= nil then
    if overworld_module.map[v-7].open == true then
      return true
    end
  end
  if overworld_module.map[v+7] ~= nil then
    if overworld_module.map[v+7].open == true then
      return true
    end
  end
end
--
function overworld_module.keypressed(key)
  if key == "right" and overworld_module.rX <= 640 then
    overworld_module.rX = overworld_module.rX+128
    overworld_module.aktuellesFeldSwitch = true
  end
  if key == "left" and overworld_module.rX > 0 then
    overworld_module.rX = overworld_module.rX-128
    overworld_module.aktuellesFeldSwitch = true
  end
  if key == "down" and overworld_module.rY <= 542 then
    overworld_module.rY = overworld_module.rY+128
    overworld_module.aktuellesFeldSwitch = true
  end
  if key == "up" and overworld_module.rY > 30 then
    overworld_module.rY = overworld_module.rY-128
    overworld_module.aktuellesFeldSwitch = true
  end
end

function overworld_module.reset()
  overworld_module.mapLoad()
  overworld_module.load()
end