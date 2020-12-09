function love.load()
  lg = love.graphics
  punkte = lg.newFont("font/punkte.ttf",30)
  level = lg.newFont("font/punkte.ttf",70)
  level2 = lg.newFont("font/punkte.ttf",35)
  spielName = lg.newFont("font/punkte.ttf",150)
  pigR=lg.newImage("gfx/schweinR.png")
  pigL=lg.newImage("gfx/schweinL.png")
  furzSchweinR=lg.newImage("gfx/furzSchweinR.png")
  furzSchweinL=lg.newImage("gfx/furzSchweinL.png")
  waffe=lg.newImage("gfx/waffe.png")
  waffel=lg.newImage("gfx/waffel.png")
  waffer=lg.newImage("gfx/waffer.png")
  kugelnBild=lg.newImage("gfx/kugeln.png")
end

player={
  move="false",
  x=0,
  y=0,
  bewegungx="=",
  bewegungSx="+",
  bewegungy="=",
  waffe=1,
  level=0,
  levelVorher=0,
  sprache="English",
  pause="false",
}

sprache={
  erklaerung1="",
  erklaerung2="",
  erklaerung3="",
  steuerung="Controls",
  sprache="Language",
  optionen="Options",
  zurueck="Back",
  neuesSpiel="New Game",
  todeInsgesammt="Deads All ",
  menu="Main Menu",
  easy="Easy",
  normal="Normal",
  hard="Hard",
  twoPlayers="2 Players",
  player2="Player 2",
  player1="Player 1",
  win="wins",
  unentschieden="Tie",
}

kugeln={}

schwein={
  bewegungSx="+"
}

function love.update(dt)
  if player.sprache == "English" then
    sprache.erklaerung1=""
    sprache.erklaerung2=""
    sprache.erklaerung3=""
    sprache.steuerung="Controls"
    sprache.menu = "Main Menu"
    sprache.optionen = "Options"
    sprache.zurueck = "Back"
    sprache.sprache = "Language"
    sprache.neuesSpiel = "New Game"
    sprache.todeInsgesammt="Deads All "
    sprache.easy="Easy"
    sprache.normal="normal"
    sprache.hard="Hard"
    sprache.twoPlayers="2 Players"
    sprache.player2="Player 2"
    sprache.player1="Player 1"
    sprache.win="wins"
    sprache.unentschieden="Tie"
  elseif player.sprache == "Deutsch" then
    sprache.erklaerung1=""
    sprache.erklaerung2=""
    sprache.erklaerung3=""
    sprache.steuerung="Steuerung"
    sprache.menu = "Haupt Menue"
    sprache.optionen = "Optionen"
    sprache.zurueck = "Zurueck"
    sprache.sprache = "Sprache"
    sprache.neuesSpiel = "Neues Spiel"
    sprache.todeInsgesammt="Tote Insgesammt "
    sprache.easy="Einfach"
    sprache.normal="Normal"
    sprache.hard="Hard"
    sprache.twoPlayers="2 Spieler"
    sprache.player2="Spieler 2"
    sprache.player1="Spieler 1"
    sprache.win="gewinnt"
  end
  if player.move=="true" then
    if player.level == 0 then
      level0Update()
    sprache.unentschieden="Unentschieden"
    elseif player.level == -1 then
      levelOpUpdate()
    elseif player.level == -2 then
      levelPUpdate()
    elseif player.level == -3 then
      levelSchwierigkeitUpdate()
    elseif player.level == -4 then
      levelSteuerungUpdate()
    elseif player.level == 1 then
      levelSpielUpdate(dt)
    end
  end
end

function love.keypressed(key)
  if key == "d" then
    player.bewegungx="+"
    player.bewegungSx="+"
  elseif key == "a" then
    player.bewegungx="-"
    player.bewegungSx="-"
  end
  if key == "w" then
    player.bewegungy="-"
  elseif key == "s" then
    player.bewegungy="+"
  end
  if player.move == "true" then
    --SchussSchwein
    if key == "q" then
      if schwein.bewegungSx == "+" then
        angriffSchwein(player.x - 200, player.y, 400)
      elseif player.bewegungSx == "-" then
        angriffSchwein(schwein.x, schwein.y + 90, -400)
      end
    end
  end
end

function love.keyreleased(key)
  if player.levelVorher == 0 then
  else
    if key == "escape" and player.pause == "false" then
      player.move = "false"
      player.pause = "true"
      player.level = -2
    elseif key == "escape" and player.pause == "true" then
      player.level = player.levelVorher
      player.move = "true"
      player.pause = "false"
    end
  end
  if key == "d" then
    player.bewegungx="="
  elseif key == "a" then
    player.bewegungx="="
  end
  if key == "w" then
    player.bewegungy="="
  elseif key == "s" then
    player.bewegungy="="
  end
end

function love.mousepressed(x, y, button)
  if player.move == "true" then
    --Schuss
    if button == "l" then
      if player.waffe == 1 then
        if player.bewegungSx == "+" then
          kugelSchiessen(player.x + 132, player.y + 90, 400)
        elseif player.bewegungSx == "-" then
          kugelSchiessen(player.x, player.y + 90, -400)
        end
      end
    end
  end
  
  --Einfach Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 50 and y <= 150 then
    player.level = 1
    player.levelVorher = 1
    player.move = "true"
  end
  
  --Normal Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 160 and y <= 260 then
    player.level = 11
    player.levelVorher = 1
    player.move = "true"
  end
  
  --Hard Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 270 and y <= 370 then
    player.level = 1
    player.levelVorher = 1
    player.move = "true"
  end
  
  --2 Spieler Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 380 and y <= 480 then
    player.level = 1
    player.levelVorher = 1
    player.move = "true"
  end
  
  --Neues Spiel Knopf von Hauptseite
  
  if player.level == 0 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 then
    player.level = -3
  end
  
  --Optionen Knopf von Hauptseite
    
  if player.level == 0 and button == "l" and x >= 200 and x <= 380 and y >= 400 and y <= 500 then
    player.level = -1
  end
  
   --Steuerungs Knopf von Hauptseite
    
  if player.level == 0 and button == "l" and x >= 420 and x <= 600 and y >= 400 and y <= 500 then
    player.level = -4
  end
  
  --Sprache Knopf von Optionen
  
  if player.level == -1 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 and player.sprache == "Deutsch" then
    player.sprache = "English"
  elseif player.level == -1 and button == "l" and x >= 200 and x <= 600 and y >= 200 and y <= 350 and player.sprache == "English" then
    player.sprache = "Deutsch"
  end
  
  --Zurück Knopf von Optionen
  
  if player.level == -1 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    if player.levelVorher == 0 then
      player.level = 0
    elseif player.levelVorher > 0 then
      player.level = player.levelVorher
      player.move = "true"
    end
  end
 
 --Zurück Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    player.level = 0
  end
  
  --Zurück Knopf von Steuerung
  
  if player.level == -4 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    player.level = 0
  end
  
  --Zurück Knopf von Pause
  
  if player.level == -2 and button == "l" and x >= 0 and x <= 300 and y >= 500 and y <= 600 then
    player.level = player.levelVorher
    player.move = "true"
  end
  
  --Optionen Knopf von Pause
  
  if player.level == -2 and button == "l" and x >= 100 and x <= 700 and y >= 200 and y <= 300 then
    player.level = -1
  end
  
  --Hauptmenü Knopf von Pause
  
  if player.level == -2 and button == "l" and x >= 100 and x <= 700 and y >= 350 and y <= 450 then
    dead()
  end
end

function love.draw()
  lg.setColorMode("modulate")
  lg.setBackgroundColor(255, 255, 255)
  if player.level == 0 then
    level0Draw()
  elseif player.level == -1 then
    levelOpDraw()
  elseif player.level == -2 then
    levelPDraw()
  elseif player.level == -3 then
    levelSchwierigkeitDraw()
  elseif player.level == -4 then
    levelSteuerungDraw()
  elseif player.level == 1 then
    lg.setColorMode("replace")
    levelSpielDraw()
  end
end

function kugelSchiessen(x, y, xGeschwindigkeit)
  local tempK={
    x=x,
    y=y,
    xGeschwindigkeit=xGeschwindigkeit,
  }
  table.insert(kugeln, tempK)
end

--Ab hier ist Level -3 (Spiel Auswahl)

function levelSchwierigkeitDraw()
  lg.setColor(0, 0, 0)
  lg.setLineWidth(5)
  lg.rectangle("line", 100 , 50, 600, 100)
  lg.rectangle("line", 100 , 160, 600, 100)
  lg.rectangle("line", 100 , 270, 600, 100)
  lg.rectangle("line", 100 , 380, 600, 100)
  lg.rectangle("line", 0, 500, 300, 100)
  lg.setFont(level)
  lg.print(sprache.easy, 280 , 75)
  lg.print(sprache.normal, 270 , 185)
  lg.print(sprache.hard, 300 , 295)
  lg.print(sprache.twoPlayers, 250 , 405)
  lg.print(sprache.zurueck, 30, 530)
end

function levelSchwierigkeitUpdate()
  
end

--Ab hier ist Level -2 (Pause)

function levelPDraw()
  lg.setBackgroundColor(255, 255, 255)
  lg.setFont(spielName)
  lg.setColor(0, 0, 0)
  lg.print("Pause", 200, 50)
  lg.setLineWidth(5)
  lg.rectangle("line", 100 , 200, 600, 100)
  lg.rectangle("line", 100 , 350, 600, 100)
  lg.rectangle("line", 0, 500, 300, 100)
  lg.setFont(level)
  lg.print(sprache.optionen, 250, 230)
  lg.print(sprache.menu, 200, 380)
  lg.print(sprache.zurueck, 30, 530)
end

function levelPUpdate()
  
end
 --Ab hier ist Level -1 (Optionen)
 
 function levelOpDraw()
  lg.setBackgroundColor(255, 255, 255)
  lg.setFont(spielName)
  lg.setColor(0, 0, 0)
  lg.print(sprache.optionen, 120, 50)
  lg.setLineWidth(5)
  lg.rectangle("line", 100 , 200, 600, 150)
  lg.rectangle("line", 0, 500, 300, 100)
  lg.setFont(level)
  lg.print(sprache.sprache.." ".. player.sprache, 130, 250)
  lg.print(sprache.zurueck, 30, 530)
end

function levelOpUpdate()
  
end

--Ab hier ist Level 0 (Menu)

function level0Draw()
  lg.setBackgroundColor(255, 255, 255)
  lg.setFont(spielName)
  lg.setColor(0, 0, 0)
  lg.print("Call of pigs", 250, 50)
  lg.setLineWidth(5)
  lg.rectangle("line", 200 , 200, 400, 150)
  lg.rectangle("line", 200 , 400, 180, 100)
  lg.rectangle("line", 420 , 400, 180, 100)
  lg.setFont(level)
  lg.print(sprache.neuesSpiel, 210, 250)
  lg.setFont(level2)
  lg.print(sprache.optionen, 210, 430)
  lg.print(sprache.steuerung, 430, 430)
end

function level0Update()
  
end

--Ab hier ist Level -4 (Steuerung)

function levelSteuerungDraw()
  lg.setBackgroundColor(255, 255, 255)
  lg.setFont(spielName)
  lg.setColor(0, 0, 0)
  lg.print(sprache.steuerung, 100, 50)
  lg.rectangle("line", 0, 500, 300, 100)
  lg.setFont(level)
  lg.print(sprache.zurueck, 30, 530)
  lg.setFont(level2)
  lg.print(sprache.erklaerung1, 60, 200)
  lg.print(sprache.erklaerung2, 60, 260)
  lg.print(sprache.erklaerung3, 60, 320)
end

function levelSteuerungUpdate()
  
end

--Level 0 Spiel Selbst

function levelSpielDraw()
  lg.draw(waffe, 350, 520, 0, 0.5, sx)
  lg.line(0, 500, 800, 500)
  if player.bewegungSx == "-" then
    lg.draw(waffel, player.x, player.y + 50, 0, 0.3, sx)
  elseif player.bewegungSx == "+" then
    lg.draw(waffer, player.x, player.y + 50, 0, 0.3, sx)
  end
  for i, v in ipairs(kugeln) do
    lg.draw(kugelnBild, v.x, v.y, 0, 0.5, sx)
  end
  for i, v in ipairs(schwein) do
    lg.draw(pigR, schwein.xVorher, schwein.y, 0, 0.2, sx)
    lg.draw(furzSchweinR, v.x, v.y, 0, 0.5, sx)
  end
end

function levelSpielUpdate(dt)
  if player.x >= 668 then
      player.x=668
    elseif player.x <= 0 then
      player.x=0
    end
    if player.y >= 450 then
      player.y=450
    elseif player.y <= -50 then
    player.y=-50
    end
    if player.bewegungx=="+" then
      player.x = player.x + 200 * dt
    end
    if player.bewegungx=="-" then
      player.x = player.x - 200 * dt
    end
    if player.bewegungy=="+" then
      player.y = player.y + 200 * dt
    end
    if player.bewegungy=="-" then
      player.y = player.y - 200 * dt
    end
    for i,v in ipairs(kugeln) do
      v.x = v.x + v.xGeschwindigkeit * dt
      if v.x > 800 or v.x < 0 then
        table.remove(kugeln, i)
      end
    end
    for i,v in ipairs(schwein) do
      v.x = v.x + v.xGeschwindigkeit * dt
      if v.x > 800 or v.x < 0 then
        table.remove(schwein, i)
      end
    end
end

function dead()
  player.level = 0
  player.levelVorher = 0
  player.deadsAll = 0
  player.x = 0
  player.y = 0
  player.pause = "false"
end

function angriffSchwein(x, y, xGeschwindigkeit) -- Easy Gegner
  local tempS={
    x=x,
    xVorher=x,
    y=y,
    xGeschwindigkeit=xGeschwindigkeit,
  }
  table.insert(schwein, tempS)
end