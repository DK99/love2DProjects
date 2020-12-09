local menu = require "menu"
local gegner = require "gegner"
local bilderLaden = require "bilderLaden"
local overworld_module = require "overworld_module"
local schwerter = require "schwerter"
local level = require "level"
local fps, modus, pause, inventar

function love.load()
  math.randomseed(os.time())
  love.filesystem.createDirectory("profile")
  einstellungenload()
  gegner.load()
  charackterZeichnung.load()
  menu.load()
  overworld_module.load()
  schwerter.load()
  bilderLaden.load()
  fps=false
  modus="menu"
  pause=false
  inventar=false
end

function love.draw()
  if not bilderLaden.fertig() then
    bilderLaden.draw()
  else
    if not pause then
      if modus=="menu" then
        menu.draw()
      elseif modus == "overworld" then
        overworld_module.draw()
      elseif modus == "level" then
        level.draw()
        gegner.draw()
      end  
      if inventar then
        schwerter.drawInventar()
      end
    else
      menu.draw()
    end
  end
  if fps then
    love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 800, 10)
  end
end

function love.update(dt)
  if not bilderLaden.fertig() then
    bilderLaden.update(dt)
  else
    if not pause then
      if inventar then
        schwerter.update(dt)
      else
        if modus=="menu" then
          menu.update(dt)
          if menu.gibVariable(3) then
            modus="overworld"
            profil=menu.gibVariable(4)
            menu.setzeVariable(4, false)
            schwerter.ladeSchwerterProfil()
            level.load()
            charackterZeichnung.setzeVariable(1, menu.gibVariable(4))
            charackterZeichnung.ini()
          end
        elseif modus == "overworld" then
          overworld_module.update(dt)
          overworld_module.profilIni()
          if overworld_module.weiterleitung() ~= 0 then
            modus="level"
          end
        end
      end
      if modus=="level" then
        level.update(dt)
        gegner.update(dt)
        charackterZeichnung.update(dt)
        if love.keyboard.isDown("w") or love.keyboard.isDown("s") or love.keyboard.isDown("a") or love.keyboard.isDown("d") or love.keyboard.isDown(" ") then
          inventar=false
        end
        if level.aenderLeben(0) <= 0 then
          modus="overworld"
          inventar=false
          level.reset()
        end
      end
    else
      inventar=false
      if menu.gibVariable(5) then
        schwerter.reset()
        level.reset()
        gegner.reset()
        overworld_module.load()
        menu.setzeVariable(5, false)
        overworld_module.reset()
        charackterZeichnung.reset()
      end
      if not menu.gibVariable(1) and menu.gibVariable(2) then
        pause=false
        modus="menu"
        menu.setzeVariable(3, false)
      elseif not menu.gibVariable(1) then
        pause=false
      end
      menu.update(dt)
    end
  end
end

function love.mousereleased(x, y, button)
  if bilderLaden.fertig() then
    if not pause then
      if inventar then
        schwerter.mousereleased(x, y, button)
      else
        if modus=="menu" then
          menu.mousereleased(x, y, button)
        elseif modus == "overworld" then
          overworld_module.mouse(x,y,button)
        elseif modus == "level" then
          level.mouse(button)
        end
      end
    else
      menu.mousereleased(x, y, button)
    end
  end
end

function love.keypressed(key)
  if bilderLaden.fertig() then
    if modus == "overworld" then
      if not inventar then
        overworld_module.keypressed(key)
      end
      if key == "e" then
        if inventar then
          inventar=false
        elseif not inventar then
          inventar=true
        end
      end
    elseif modus == "level" then
      level.keypressed(key)
      if key == "e" then
        if inventar then
          inventar=false
        elseif not inventar then
          inventar=true
        end
      end
      if key == "q" then
        modus="overworld"
        inventar=false
        level.reset()
      end
    end
    gegner.keypressed(key)
    if key=="escape" and modus ~= "menu" then
      if pause then
        pause=false
        menu.setzeVariable(1, false)
        menu.setzeVariable(2, 1)
      elseif not pause then
        menu.setzeVariable(1, true)
        menu.setzeVariable(2, 0)
        pause=true
      end
    end
    if key=="f3" then
      if fps then
        fps=false
      else
        fps=true
      end
    end
  end
end

function einstellungenload()
  local zeile=1
  if love.filesystem.exists("optionen.txt") then
    for line in love.filesystem.lines("optionen.txt") do
      if zeile==1 then
        love.audio.setVolume(tonumber(line)/100)
      elseif zeile==2 then
        if line=="Fenster" then
          love.window.setFullscreen(false, "desktop")
        elseif line == "Vollbild" then
          love.window.setFullscreen(true, "desktop")
        end
      end
      zeile=zeile+1
    end
  end
end

function love.focus(f)
  if not f then
    if modus ~= "menu" then
      if not pause then
        menu.setzeVariable(1, true)
        menu.setzeVariable(2, 0)
        pause=true
      end
    end
  end
end