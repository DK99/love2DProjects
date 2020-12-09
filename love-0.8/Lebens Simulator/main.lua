level2=require 'level2'
level1=require 'level1'
menu=require 'menu'
profile=require 'profile'
optionen=require 'optionen'
spielTabelle=require 'spielTabelle'
gif1=require 'gif1'

function love.load()
  math.randomseed(os.time())
  schrift=love.graphics.newFont("MyScriptFont.ttf", 50)
  schrift2=love.graphics.newFont("MyScriptFont.ttf", 25)
  stencil=love.graphics.newFont("gunplay.ttf", 30)
  stencil2=love.graphics.newFont("gunplay.ttf", 20)
  stencil3=love.graphics.newFont("gunplay.ttf", 50)
  love.filesystem.mkdir("Profile")
  if not love.filesystem.exists("Profile/profil_1.txt") then
    love.filesystem.write("Profile/profil_1_name.txt", "Profil 1")
  end
  if not love.filesystem.exists("Profile/profil_2.txt") then
    love.filesystem.write("Profile/profil_2_name.txt", "Profil 2")
  end
  if not love.filesystem.exists("Profile/profil_3.txt") then
    love.filesystem.write("Profile/profil_3_name.txt", "Profil 3")
  end
end

function love.update(dt)
  if spielTabelle.szene == "menu" then
    menu.menu_update(dt)
  elseif spielTabelle.szene == "profile" then
    profile.profile_update(dt)
  elseif spielTabelle.szene == "profil_1" then
    if love.filesystem.exists("Profile/profil_1.txt") then
      spielTabelle.szene=love.filesystem.read("Profile/profil_1.txt")
    else
      spielTabelle.szene="gif 1"
    end
  elseif spielTabelle.szene == "profil_2" then
    if love.filesystem.exists("Profile/profil_2.txt") then
      spielTabelle.szene=love.filesystem.read("Profile/profil_2.txt")
    else
      spielTabelle.szene="gif 1"
    end
  elseif spielTabelle.szene == "profil_3" then
    if love.filesystem.exists("Profile/profil_3.txt") then
      spielTabelle.szene=love.filesystem.read("Profile/profil_3.txt")
    else
      spielTabelle.szene="gif 1"
    end
  elseif spielTabelle.szene == "optionen" then
    optionen.optionen_update(dt)
  elseif spielTabelle.szene == "gif 1" then
    gif1.gif1_update(dt)
  elseif spielTabelle.szene == "Level 1" then
    level1.level1_update(dt)
  elseif spielTabelle.szene 	== "Level 2" then
		level2.level2_update(dt)
  end
end

function love.draw()
  love.graphics.setFont(schrift)
  love.graphics.print(spielTabelle.szene, 100, 100)
  if spielTabelle.szene == "menu" then
    love.graphics.setFont(stencil3)
    menu.menu_draw()
  elseif spielTabelle.szene == "profile" then
    love.graphics.setFont(stencil2)
    profile.profile_draw()
  elseif spielTabelle.szene == "optionen" then
    love.graphics.setFont(stencil)
    optionen.optionen_draw()
  elseif spielTabelle.szene == "gif 1" then
    love.graphics.setFont(schrift)
    gif1.gif1_draw()
  elseif spielTabelle.szene == "Level 1" then
    love.graphics.setFont(schrift)
    level1.level1_draw()
  elseif spielTabelle.szene == "Level 2" then
    love.graphics.setFont(schrift)
  	level2.level2_draw()
  end
end

function love.keypressed(key)
  if key == "escape" then
    os.exit()
  end
  if spielTabelle.szene == "Level 1" then
    level1.level1_keypressed(key)
  elseif spielTabelle.szene == "profile" then
    profile.profile_keypressed(key)
  end
end

function love.keyreleased(key)
  if spielTabelle.szene == "Level 1" then
    level1.level1_keyreleased(key)
  end
end

function love.mousepressed(x, y, button)
  if spielTabelle.szene == "Level 1" then
    level1.level1_mousepressed(x, y, button)
  elseif spielTabelle.szene == "Level 2" then
    level2.level2_mousepressed(x, y, button)
  end
end

function love.mousereleased(x, y, button)
  if spielTabelle.szene == "profile" then
    profile.profile_mousereleased(x, y, button)
  elseif spielTabelle.szene == "Level 1" then
    level1.level1_mousereleased(x, y, button)
  end
end