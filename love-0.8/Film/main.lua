function love.load()
  level = love.graphics.newFont("font/punkte.ttf",50)
  spielName = love.graphics.newFont("font/punkte.ttf",150)
  untertitel = love.graphics.newFont("font/punkte.ttf", 20)
  Erzaeler1 = love.audio.newSource("Audio/Erzaeler1.mp3")
  Erzaeler2 = love.audio.newSource("Audio/Erzaeler2.mp3")
  Erzaeler3 = love.audio.newSource("Audio/Erzaeler3.mp3")
  muellerin = love.audio.newSource("Audio/Muellerin.mp3")
  kevin1 = love.audio.newSource("Audio/Kevin1.mp3")
  kevin2 = love.audio.newSource("Audio/Kevin2.mp3")
  kevin3 = love.audio.newSource("Audio/Kevin3.mp3")
  maus1 = love.audio.newSource("Audio/Maus1.mp3")
  maus2 = love.audio.newSource("Audio/Maus2.mp3")
  frischkaese = love.graphics.newImage("gfx/frischkaese.png")
  brot = love.graphics.newImage("gfx/brot.png")
  x1=0
  x2=300
  x3=600
  x4=250
end

film={
  abgespielt=0,
  level=0,
  levelVorher=0,
  move=false,
  sprache="Ton",
  untertitel1="",
  untertitel2="",
  untertitel3="",
  pause=false,
}

function love.draw()
  if film.level == 0 then
    level0Draw()
  elseif film.level == -1 then
    levelOpDraw()
  elseif film.level == -2 then
    levelPDraw()
  elseif film.level == 1 then
    szene1Draw()
  elseif film.level == 2 then
    love.graphics.setColorMode("replace")
    szene2Draw()
  elseif film.level == 3 then
    love.graphics.setColorMode("replace")
    szene3Draw()
  end
end

function love.update(dt)
  if film.move then
    if film.level == 1 then
      szene1Update(dt)
    elseif film.level == 2 then
      szene2Update(dt)
    elseif film.level == 3 then
      szene3Update(dt)
    end
  end
end

function love.keypressed(key)
  if film.levelVorher == 0 then
  else
    if not film.pause and key == "escape" then
      film.move = false
      film.pause = true
      film.level = -2
      love.audio.pause()
    elseif key == "escape" and film.pause then
      film.level = film.levelVorher
      film.move = true
      film.pause = false
      if film.sprache == "Ton" or film.sprache == "Beides" then
        love.audio.resume()
      elseif film.sprache == "Untertitel" then
        love.audio.resume()
      end
    end
  end
end

function love.mousepressed(x, y, button)
  --Film Abspielen Knopf von Hauptseite
  
  if film.level == 0 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 then
    film.level = 1
    film.levelVorher = 1
    film.move=true
  end
  
  --Optionen Knopf von Hauptseite
    
  if film.level == 0 and button == "l" and x >= 200 and x <= 600 and y >= 400 and y <= 550 then
    film.level = -1
  end

  --Untertitel, Ton oder beides Knopf von Optionen
  
  if film.level == -1 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 and film.sprache == "Untertitel" then
    film.sprache = "Ton"
    love.audio.setVolume(1)
  elseif film.level == -1 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 and film.sprache == "Ton" then
    film.sprache = "Beides"
    love.audio.setVolume(1)
  elseif film.level == -1 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 and film.sprache == "Beides" then
    film.sprache = "Untertitel"
    love.audio.setVolume(0)
  end
  
  --Zurück Knopf von Optionen
  
  if film.level == -1 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    if film.levelVorher == 0 then
      film.level = 0
    elseif film.levelVorher > 0 then
      film.level = film.levelVorher
      film.move = true
      film.pause= false
      if film.sprache == "Ton" or film.sprache == "Beides" then
        love.audio.resume()
      elseif film.sprache == "Untertitel" then
        love.audio.resume()
      end
    end
  end
  
  --Zurück Knopf von Pause
  
  if film.level == -2 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    film.level = film.levelVorher
    film.move = true
    film.pause= false
    if film.sprache == "Ton" or film.sprache == "Beides" then
      love.audio.resume()
    elseif film.sprache == "Untertitel" then
      love.audio.resume()
    end
  end
  
  --Optionen Knopf von Pause
  
  if film.level == -2 and button == "l" and x >= 100 and x <= 700 and y >= 200 and y <= 300 then
    film.level = -1
  end
  
  --Hauptmenü Knopf von Pause
  
  if film.level == -2 and button == "l" and x >= 100 and x <= 700 and y >= 350 and y <= 450 then
    film.level = 0
    film.levelVorher = 0
    film.abgespielt=0
    film.move=false
    film.untertitel1=""
    film.untertitel2=""
    film.untertitel3=""
    film.pause=false
    x4=250
    film.abgespielt = 1
  end
end

--Ab hier ist Level -2 (Pause)

function levelPDraw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setFont(spielName)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Pause", 200, 50)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", 100 , 200, 600, 100)
  love.graphics.rectangle("line", 100 , 350, 600, 100)
  love.graphics.rectangle("line", 0, 500, 300, 100)
  love.graphics.setFont(level)
  love.graphics.print("Optionen", 250, 230)
  love.graphics.print("Haupt Menue", 200, 380)
  love.graphics.print("Zurueck", 30, 530)
end

function levelPUpdate()
  
end
 --Ab hier ist Level -1 (Optionen)
 
 function levelOpDraw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setFont(spielName)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Optionen", 120, 50)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", 100 , 200, 600, 150)
  love.graphics.rectangle("line", 0, 500, 300, 100)
  love.graphics.setFont(level)
  love.graphics.print(film.sprache, 130, 250)
  love.graphics.print("Zurueck", 30, 530)
end

function levelOpUpdate()
  
end

--Ab hier ist Level 0 (Menu)

function level0Draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setFont(spielName)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Jump", 250, 50)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", 200 , 200, 400, 150)
  love.graphics.rectangle("line", 200 , 400, 400, 150)
  love.graphics.setFont(level)
  love.graphics.print("Film abspielen", 210, 250)
  love.graphics.print("Optionen", 270, 450)
end

function level0Update()
  
end

function szene1Draw()
  love.graphics.setBackgroundColor(30,144,255)
  zeichneWolken(x1,100)
  zeichneWolken(x2,100)
  zeichneWolken(x3,100)
  love.graphics.setColor(100, 100, 100)
  love.graphics.rectangle("fill", 0, 500, 800, 100)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 50, 550, 100, 10)
  love.graphics.rectangle("fill", 200, 550, 100, 10)
  love.graphics.rectangle("fill", 350, 550, 100, 10)
  love.graphics.rectangle("fill", 500, 550, 100, 10)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", 100, 300, 200, 200)
  love.graphics.rectangle("fill", 500, 300, 200, 200)
  love.graphics.setColor(139,69,19)
  love.graphics.rectangle("fill", 225, 400, 50, 100)
  love.graphics.rectangle("fill", 525, 400, 50, 100)
  love.graphics.setColor(0, 0, 0)
  love.graphics.triangle("fill", 100, 300, 300, 300, 200, 150)
  love.graphics.triangle("fill", 500, 300, 700, 300, 600, 150)
  love.graphics.rectangle("fill", 225, 450, 10, 10)
  love.graphics.rectangle("fill", 525, 450, 10, 10)
  zeichneKevin(x4, 420)
  if film.sprache=="Untertitel" or film.sprache=="Beides" then
    love.graphics.setFont(untertitel)
    love.graphics.print(film.untertitel1, 20, 20)
    love.graphics.print(film.untertitel2, 20, 70)
    love.graphics.print(film.untertitel3, 20, 120)
  end
end

function szene1Update(dt)
  if film.sprache == "Ton" or film.sprache == "Beides" then
    if film.abgespielt == 0 then
      love.audio.play(Erzaeler1)
      film.abgespielt = 1
    end
  end
  x1=x1+5*dt
  x2=x2+5*dt
  x3=x3+5*dt
  if x1 >= 900 then
    x1=0
  elseif x2 >= 900 then
    x2=0
  elseif x3 >= 900 then
    x3=0
  end
  x4 = x4 + 50 * dt
  film.untertitel1="Eines Tages ging Kevin spazieren Er dachte an"
  film.untertitel2="ein Frischkaese Brot mit Senf Leider hatte er aber nichts"
  film.untertitel3="dafuer da Also ging er zu seiner Freundin der Muellerin"
  if x4 >= 800 then
    film.level=2
    film.levelVorher=2
    x4 = -50
  end
end

function zeichneWolken(x,y)
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", x, y, 50, 255)
  love.graphics.circle("fill", x+70, y+10, 50, 255)
  love.graphics.circle("fill", x+120, y+60, 50, 255)
  love.graphics.circle("fill", x+80, y+50, 50, 255)
  love.graphics.circle("fill", x+20, y+40, 50, 255)
end

function zeichneKevin(x1, y1)
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("fill", x1, y1, 15, 255)
  love.graphics.line(x1, y1 + 15, x1, y1 + 50)
  love.graphics.line(x1, y1 + 50, x1+20, y1 + 80)
  love.graphics.line(x1, y1 + 50, x1-20, y1 + 80)
  love.graphics.line(x1, y1 + 30, x1+30, y1 - 10)
  love.graphics.line(x1, y1 + 30, x1-30, y1 - 10)
end

function szene2Draw()
  love.graphics.setBackgroundColor(30,144,255)
  zeichneWolken(x1,100)
  zeichneWolken(x2,100)
  zeichneWolken(x3,100)
  love.graphics.setColor(205,91,69)
  love.graphics.rectangle("fill",400,50,200,550)
  love.graphics.setColor(139,69,19)
  love.graphics.rectangle("fill",450,380,80,120)
  love.graphics.setColor(100, 100, 100)
  love.graphics.rectangle("fill", 0, 500, 800, 100)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 50, 550, 100, 10)
  love.graphics.rectangle("fill", 200, 550, 100, 10)
  love.graphics.rectangle("fill", 350, 550, 100, 10)
  love.graphics.rectangle("fill", 500, 550, 100, 10)
  zeichneKevin(x4,460)
  if os.difftime(os.time(), ton) >=  6 and film.abgespielt >= 3 then
    love.graphics.draw(brot, x4 - 60, 420, 0, 0.07, sx)
  end
  love.graphics.setColor(56,56,56)
  love.graphics.rectangle("fill",330,65,350,50)
  love.graphics.rectangle("fill",475,0,50,300)
  love.graphics.setColor(0,0,0)
  love.graphics.circle("fill",500,85,10)
  love.graphics.setColor(0,0,0)
  love.graphics.circle("fill",460,440,5)
  zeichneKevin(500,460)
  love.graphics.circle("fill",500,500,20, 255)
  if film.sprache=="Untertitel" or film.sprache=="Beides" then
    love.graphics.setFont(untertitel)
    love.graphics.setColorMode("modulate")
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(film.untertitel1, 20, 250)
    love.graphics.print(film.untertitel2, 20, 300)
    love.graphics.print(film.untertitel3, 20, 350)
  end
end

function szene2Update(dt)
  repeat
   x4 = x4 + 50 * dt
   local bewegungsrichtung = "+"
  until  bewegungsrichtung == "+" and x4 <= 400 do
  end
  if x4 >= 380 then
    if film.sprache == "Ton" or film.sprache == "Beides" then
      if film.abgespielt == 1 then
        love.audio.play(kevin1)
        film.abgespielt = 2
        ton=os.time()
      end
      if os.difftime(os.time(), ton) ==  4 and film.abgespielt == 2 then
        love.audio.stop(kevin1)
        love.audio.play(muellerin)
        film.abgespielt = 3
      end
      if os.difftime(os.time(), ton) ==  7 and film.abgespielt == 3 then
        love.audio.stop(muellerin)
        love.audio.play(Erzaeler2)
        film.abgespielt = 4
      end
      if os.difftime(os.time(), ton) >=  11 and film.abgespielt == 4 then
        love.audio.stop(Erzaeler2)
        x4 = x4 - 50 * dt
        local bewegungsrichtung = "-"
        if x4 < 0 then
          film.level = 3
          film.levelVorher = 3
        end
      end
    end
  end
  x1=x1+5*dt
  x2=x2+5*dt
  x3=x3+5*dt
  if x1 >= 900 then
    x1=0
  elseif x2 >= 900 then
    x2=0
  elseif x3 >= 900 then
    x3=0
  end
  film.untertitel1="Kevin   Hey Mullerin hast du ein Frischkaese Brot mit Senf fuer mich"
  film.untertitel2="Muellerin   Nein aber du kannst ein Brot haben"
  film.untertitel3="Kevin bedankte und verabschiedete sich und ging zur Frischkaese Maus"
end

function szene3Draw()
  love.graphics.setBackgroundColor(30,144,255)
  love.graphics.draw(frischkaese, 300, 250, 0, 1, sx)
  love.graphics.setColor(139,69,19)
  love.graphics.rectangle("fill",450,420,80,80)
  love.graphics.setColor(0,0,0)
  love.graphics.circle("fill",460,460,5)
  zeichneWolken(x1,100)
  zeichneWolken(x2,100)
  zeichneWolken(x3,100)
  love.graphics.setColor(100, 100, 100)
  love.graphics.rectangle("fill", 0, 500, 800, 100)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 50, 550, 100, 10)
  love.graphics.rectangle("fill", 200, 550, 100, 10)
  love.graphics.rectangle("fill", 350, 550, 100, 10)
  love.graphics.rectangle("fill", 500, 550, 100, 10)
  zeichneKevin(100, 420)
  zeichneKevin(200, 420)
  love.graphics.draw(frischkaese, 162, 355, 0, 0.2, sx)
end

function szene3Update(dt)
  x1=x1+5*dt
  x2=x2+5*dt
  x3=x3+5*dt
  if x1 >= 900 then
    x1=0
  elseif x2 >= 900 then
    x2=0
  elseif x3 >= 900 then
    x3=0
  end
end