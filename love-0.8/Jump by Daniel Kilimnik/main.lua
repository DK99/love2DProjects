 function love.load()
  lg = love.graphics
  punkte = lg.newFont("font/punkte.ttf",30)
  level = lg.newFont("font/punkte.ttf",70)
  level2 = lg.newFont("font/punkte.ttf",35)
  spielName = lg.newFont("font/punkte.ttf",150)
  drehen = lg.newImage("gfx/drehen.png")
  logo = lg.newImage("gfx/Logo_DK.png")
  math.randomseed(os.time())
end

player={
  y=380,
  y2=380,
  x=0,
  x2=0,
  jump="false",
  jumpBoost=0,
  jump2="false",
  jumpBoost2=0,
  gravity=4,
  move="false",
  boden=380,
  deadsAll=0,
  deadsAll2=0,
  level=0,
  levelVorher=0,
  rotation=0,
  rotationDa="true",
  sprache="English",
  gewinnerGekuehrt = "false",
  ende="false",
  pause="false",
}

levelAussehen={
  anzahl=0,
  knopf1="true",
  runter1="false",
  typ1=0,
  x1=0,
  y1=400,
  y21=400,
  h1=0,
  w1=0,
  runter2="false",
  knopf2="true",
  typ2=0,
  x2=0,
  y2=400,
  y22=400,
  h2=0,
  w2=0,
}

sprache={
  erklaerung1="The first player can jump with the space",
  erklaerung2="key the second with the return key and",
  erklaerung3="pause with escape",
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

function love.draw()
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
    levelVorlageEasyDraw(255, 0, 0, 0, 204, 0)
  elseif player.level == 2 then
    levelVorlageEasyDraw(255, 213, 0, 59, 20, 175)
  elseif player.level == 3 then
    levelVorlageEasyDraw(182, 0, 148, 188, 243, 0)
  elseif player.level == 4 then
    levelVorlageEasyDraw(209, 0, 106, 149, 235, 0)
  elseif player.level == 5 then
    levelVorlageEasyDraw(254, 145, 0, 11, 97, 163)
  elseif player.level == 6 then
    levelVorlageEasyDraw(0, 237, 29, 255, 13, 0)
  elseif player.level == 7 then
    levelVorlageEasyDraw(180, 0, 151, 192, 244, 0)
  elseif player.level == 8 then
    levelVorlageEasyDraw(52, 21, 176, 255, 207, 0)
  elseif player.level == 9 then
    levelVorlageEasyDraw(13, 86, 166, 254, 154, 0)
  elseif player.level == 10 then
    levelVorlageEasyDraw(169, 0, 162, 200, 245, 0)
  elseif player.level == 11 then
    levelVorlageNormalDraw(255, 0, 0, 0, 204, 0)
  elseif player.level == 12 then
    levelVorlageNormalDraw(255, 213, 0, 59, 20, 175)
  elseif player.level == 13 then
    levelVorlageNormalDraw(182, 0, 148, 188, 243, 0)
  elseif player.level == 14 then
    levelVorlageNormalDraw(209, 0, 106, 149, 235, 0)
  elseif player.level == 15 then
    levelVorlageNormalDraw(254, 145, 0, 11, 97, 163)
  elseif player.level == 16 then
    levelVorlageNormalDraw(0, 237, 29, 255, 13, 0)
  elseif player.level == 17 then
    levelVorlageNormalDraw(180, 0, 151, 192, 244, 0)
  elseif player.level == 18 then
    levelVorlageNormalDraw(52, 21, 176, 255, 207, 0)
  elseif player.level == 19 then
    levelVorlageNormalDraw(13, 86, 166, 254, 154, 0)
  elseif player.level == 20 then
    levelVorlageNormalDraw(169, 0, 162, 200, 245, 0)
  elseif player.level == 21 then
    levelVorlageHardDraw(255, 0, 0, 0, 204, 0)
  elseif player.level == 22 then
    levelVorlageHardDraw(255, 213, 0, 59, 20, 175)
  elseif player.level == 23 then
    levelVorlageHardDraw(182, 0, 148, 188, 243, 0)
  elseif player.level == 24 then
    levelVorlageHardDraw(209, 0, 106, 149, 235, 0)
  elseif player.level == 25 then
    levelVorlageHardDraw(254, 145, 0, 11, 97, 163)
  elseif player.level == 26 then
    levelVorlageHardDraw(0, 237, 29, 255, 13, 0)
  elseif player.level == 27 then
    levelVorlageHardDraw(180, 0, 151, 192, 244, 0)
  elseif player.level == 28 then
    levelVorlageHardDraw(52, 21, 176, 255, 207, 0)
  elseif player.level == 29 then
    levelVorlageHardDraw(13, 86, 166, 254, 154, 0)
  elseif player.level == 30 then
    levelVorlageHardDraw(169, 0, 162, 200, 245, 0)
  elseif player.level == 31 then
    levelVorlage2PlayersDraw(255, 0, 0, 0, 204, 0)
  elseif player.level == 32 then
    levelVorlage2PlayersDraw(255, 213, 0, 59, 20, 175)
  elseif player.level == 33 then
    levelVorlage2PlayersDraw(182, 0, 148, 188, 243, 0)
  elseif player.level == 34 then
    levelVorlage2PlayersDraw(209, 0, 106, 149, 235, 0)
  elseif player.level == 35 then
    levelVorlage2PlayersDraw(254, 145, 0, 11, 97, 163)
  elseif player.level == 36 then
    levelVorlage2PlayersDraw(0, 237, 29, 255, 13, 0)
  elseif player.level == 37 then
    levelVorlage2PlayersDraw(180, 0, 151, 192, 244, 0)
  elseif player.level == 38 then
    levelVorlage2PlayersDraw(52, 21, 176, 255, 207, 0)
  elseif player.level == 39 then
    levelVorlage2PlayersDraw(13, 86, 166, 254, 154, 0)
  elseif player.level == 40 then
    levelVorlage2PlayersDraw(169, 0, 162, 200, 245, 0)
    lg.setColor(0, 0, 0)
    if player.level == 40 and player.x >= 800 and player.x2 >= 800 then
      if player.ende == "false" then
        ende = os.time()
        player.ende = "true"
      end
      if player.deadsAll > player.deadsAll2 then
        lg.print(sprache.player2 .. " " .. sprache.win, 300, 400)
      elseif player.deadsAll < player.deadsAll2 then
        lg.print(sprache.player1 .. " " .. sprache.win, 300, 400)
      elseif player.deadsAll == player.deadsAll2 then
        lg.print(sprache.unentschieden, 300, 400)
      end
      if os.difftime(os.time(), ende) >= 5 then
        player.gewinnerGekuehrt = "true"
      end
    end
  end
end

function love.update(dt)
  if player.sprache == "English" then
    sprache.erklaerung1="The first player can jump with the space"
    sprache.erklaerung2="key the second with the return key and"
    sprache.erklaerung3="pause with escape"
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
    sprache.erklaerung1="Den ersten Spieler kann mit der "
    sprache.erklaerung2="Leertaste springen der zweite Spieler"
    sprache.erklaerung3="mit der Enter Tatse und Pause mit Escape"
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
    sprache.unentschieden="Unentschieden"
  end
  player.rotation = player.rotation + 1 * (dt * 20)
  if player.move == "true" then
    if player.x >= 800 and player.level >= 1 and player.level < 10 or player.level >= 11 and player.level < 20 and player.x >= 800 or player.level >= 21 and player.level < 30 and player.x >= 800 or player.level >= 31 and player.level < 40 and player.x >= 800 and player.x2 >= 800 then
      player.level = player.level + 1
      player.levelVorher = player.levelVorher + 1
      player.x = 0
      player.x2 = 0
      player.y = player.boden
      player.y2 = player.boden
      levelAussehen.y21 = 400
      levelAussehen.y22 = 400
      levelAussehen.runter1 = "false"
      levelAussehen.runter2 = "false"
      levelAussehen.knopf1="true"
      levelAussehen.knopf2="true"
      levelAussehen.anzahl = 0
    elseif player.x >= 800 and player.level == 10 or player.level == 20 and player.x >= 800 or player.level == 30 and player.x >= 800 or player.level == 40 and player.x >= 800 and player.x2 >= 800 and player.gewinnerGekuehrt == "true" then
      dead()
    end
    local frame = dt * 30
    player.jumpBoost = player.jumpBoost + (player.gravity * frame)
    player.y = player.y + (player.jumpBoost * frame)
    if player.y > player.boden then
      player.y = player.boden
      player.jumpBoost = 0
      player.jump = "false"
    end
    player.jumpBoost2 = player.jumpBoost2 + (player.gravity * frame)
    player.y2 = player.y2 + (player.jumpBoost2 * frame)
    if player.y2 > player.boden then
      player.y2 = player.boden
      player.jumpBoost2 = 0
      player.jump2 = "false"
    end
    player.x = player.x + 500 * dt
    player.x2 = player.x2 + 500 * dt
    if player.level == 0 then
      level0Update()
    elseif player.level == -1 then
      levelOpUpdate()
    elseif player.level == -2 then
      levelPUpdate()
    elseif player.level == -3 then
      levelSchwierigkeitUpdate()
    elseif player.level == -4 then
      levelSteuerungUpdate()
    elseif player.level == 1 then
      levelVorlageEasyUpdate()
    elseif player.level == 2 then
      levelVorlageEasyUpdate()
    elseif player.level == 3 then
      levelVorlageEasyUpdate()
    elseif player.level == 4 then
      levelVorlageEasyUpdate()
    elseif player.level == 5 then
      levelVorlageEasyUpdate()
    elseif player.level == 6 then
      levelVorlageEasyUpdate()
    elseif player.level == 7 then
      levelVorlageEasyUpdate()
    elseif player.level == 8 then
      levelVorlageEasyUpdate()
    elseif player.level == 9 then
      levelVorlageEasyUpdate()
    elseif player.level == 10 then
      levelVorlageEasyUpdate()
    elseif player.level == 11 then
      levelVorlageNormalUpdate()
    elseif player.level == 12 then
      levelVorlageNormalUpdate()
    elseif player.level == 13 then
      levelVorlageNormalUpdate()
    elseif player.level == 14 then
      levelVorlageNormalUpdate()
    elseif player.level == 15 then
      levelVorlageNormalUpdate()
    elseif player.level == 16 then
      levelVorlageNormalUpdate()
    elseif player.level == 17 then
      levelVorlageNormalUpdate()
    elseif player.level == 18 then
      levelVorlageNormalUpdate()
    elseif player.level == 19 then
      levelVorlageNormalUpdate()
    elseif player.level == 20 then
      levelVorlageNormalUpdate()
    elseif player.level == 21 then
      levelVorlageHardUpdate()
    elseif player.level == 22 then
      levelVorlageHardUpdate()
    elseif player.level == 23 then
      levelVorlageHardUpdate()
    elseif player.level == 24 then
      levelVorlageHardUpdate()
    elseif player.level == 25 then
      levelVorlageHardUpdate()
    elseif player.level == 26 then
      levelVorlageHardUpdate()
    elseif player.level == 27 then
      levelVorlageHardUpdate()
    elseif player.level == 28 then
      levelVorlageHardUpdate()
    elseif player.level == 29 then
      levelVorlageHardUpdate()
    elseif player.level == 30 then
      levelVorlageHardUpdate()
    elseif player.level == 31 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 32 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 33 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 34 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 35 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 36 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 37 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 38 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 39 then
      levelVorlage2PlayersUpdate()
    elseif player.level == 40 then
      levelVorlage2PlayersUpdate()
    end
  end
end

function love.keypressed(key)
  if player.move == "true" then
    if key == " "  and player.jump == "false" then
      player.jumpBoost = - 38
      player.jump = "true"
    end
    if player.level >= 31 and player.level <= 40 then
      if key == "return" and player.jump2 == "false" then
        player.jumpBoost2 = - 38
        player.jump2 = "true"
      end
    end
  end
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
end

function love.mousepressed(x, y, button)
  
  --Einfach Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 50 and y <= 150 then
    player.level = 1
    player.levelVorher = 1
    player.move = "true"
  end
  
  --Normal Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 160 and y <= 260 then
    player.level = 11
    player.levelVorher = 11
    player.move = "true"
  end
  
  --Hard Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 270 and y <= 370 then
    player.level = 21
    player.levelVorher = 21
    player.move = "true"
  end
  
  --2 Spieler Knopf von Spiel Auswahl
  
  if player.level == -3 and button == "l" and x >= 100 and x <= 700 and y >= 380 and y <= 480 then
    player.level = 31
    player.levelVorher = 31
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

function dead()
  ende = nil
  player.ende = "false"
  player.gewinnerGekuehrt = "false"
  player.level = 0
  player.levelVorher = 0
  player.deadsAll = 0
  player.x = 0
  player.x2 = 0
  levelAussehen.anzahl = 0
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
  player.y = player.boden
  player.y2 = player.boden
  player.pause = "false"
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
  lg.print("Jump", 250, 50)
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

--Ab hier ist Level Vorlage Easy

function levelVorlageEasyDraw(r1, g1, b1, r2, g2, b2)
  lg.setColor(0, 0, 0)
  lg.rectangle("fill", player.x, player.y, 20, 20)
  lg.setColor(r1, g1, b1)
  if levelAussehen.typ1 == 1 then
    lg.rectangle("fill", levelAussehen.x1, levelAussehen.y1, levelAussehen.w1, levelAussehen.h1 / -1)
  elseif levelAussehen.typ1 == 2 then
    if levelAussehen.knopf1 == "true" then
      lg.draw(drehen, levelAussehen.x1 - 100, player.boden, player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x1, levelAussehen.y21, levelAussehen.w1, levelAussehen.h1 / -1)
    end
  end
  if levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    lg.rectangle("fill", levelAussehen.x2, levelAussehen.y2, levelAussehen.w2, levelAussehen.h2 / -1)
  elseif levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
    if levelAussehen.knopf2 == "true" then
      lg.draw(drehen, levelAussehen.x2 - 100, player.boden, player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x2, levelAussehen.y22, levelAussehen.w2, levelAussehen.h2 / -1)
    end
  end
  lg.rectangle("fill", 0, 0, 800, 200)
  lg.rectangle("fill", 0, 600, 800, -200)
  lg.setBackgroundColor(r2, g2, b2)
  lg.setColor(r2, g2, b2)
  lg.setFont(level)
  lg.print("Level " .. player.level .. " " .. sprache.easy, 200, 30)
  lg.setFont(punkte)
   lg.print(sprache.todeInsgesammt .. player.deadsAll, 30, 120)
end

function levelVorlageEasyUpdate()
  if levelAussehen.anzahl == 0 then
    levelAussehen.anzahl=math.random(1,2)
    levelAussehen.typ1=math.random(1,2)
    levelAussehen.x1=math.random(130,250)
    levelAussehen.h1=math.random(30,120)
    levelAussehen.w1=math.random(50,150)
    levelAussehen.typ2=math.random(1,2)
    levelAussehen.x2=math.random(430,600)
    levelAussehen.h2=math.random(30,120)
    levelAussehen.w2=math.random(50,150)
  end
  
  -- Erste Figur Typ 1
  
  if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y <= levelAussehen.y1 and player.y >= levelAussehen.y1 - levelAussehen.h1 and levelAussehen.typ1 == 1 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
   -- Erste Knopf Typ 2
   
if player.x >= levelAussehen.x1 - 120 and player.x <= levelAussehen.x1 - 100 and player.y >= 380 and player.y <= 400 and levelAussehen.typ1 == 2 then
  player.y = player.boden
  levelAussehen.y21 = 0
  levelAussehen.runter1 = "true"
  levelAussehen.knopf1="false"
 end
 
   -- Erste Figur Typ 2
   
 if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y <= levelAussehen.y1 and player.y >= levelAussehen.y1 - levelAussehen.h1 and levelAussehen.typ1 == 2 and levelAussehen.runter1 == "false" then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
 
   -- Zweite Figur Typ 1
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y <= levelAussehen.y2 and player.y >= levelAussehen.y2 - levelAussehen.h2 and levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
    -- Zweite Knopf Typ 2
    
if player.x >= levelAussehen.x2 - 120 and player.x <= levelAussehen.x2 - 100 and player.y >= 380 and player.y <= 400 and levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
  player.y = player.boden
  levelAussehen.runter2 = "true"
  levelAussehen.y22 = 0
  levelAussehen.knopf2="false"
end

   -- Zweite Figur Typ 2
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y <= levelAussehen.y2 and player.y >= levelAussehen.y2 - levelAussehen.h2 and levelAussehen.typ2 == 2 and levelAussehen.runter2 == "false" and levelAussehen.anzahl == 2 then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
end

--Ab hier ist Level Vorlage Normal

function levelVorlageNormalDraw(r1, g1, b1, r2, g2, b2)
  lg.setColor(0, 0, 0)
  lg.rectangle("fill", player.x, player.y + 175, 20, 20)
  lg.rectangle("fill", player.x, player.y - 175, 20, 20)
  lg.setColor(r1, g1, b1)
  if levelAussehen.typ1 == 1 then
    lg.rectangle("fill", levelAussehen.x1, levelAussehen.y1 + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
  elseif levelAussehen.typ1 == 2 then
    if levelAussehen.knopf1 == "true" then
      lg.draw(drehen, levelAussehen.x1 - 100, player.boden + 175 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x1, levelAussehen.y21  + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
    end
  end
  if levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    lg.rectangle("fill", levelAussehen.x2, levelAussehen.y2 - 175 , levelAussehen.w2, levelAussehen.h2 / -1)
  elseif levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
    if levelAussehen.knopf2 == "true" then
      lg.draw(drehen, levelAussehen.x2 - 100, player.boden - 175 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x2, levelAussehen.y22 - 175 , levelAussehen.w2, levelAussehen.h2 / -1)
    end
  end
  lg.rectangle("fill", 0, 225, 800, 150)
  lg.rectangle("fill", 0, 0, 800, 25)
  lg.rectangle("fill", 0, 600, 800, -25)
  lg.setBackgroundColor(r2, g2, b2)
  lg.setColor(r2, g2, b2)
  lg.setFont(level)
  lg.print("Level " .. player.level - 10 .. " " .. sprache.normal, 150, 250)
  lg.setFont(punkte)
  lg.print(sprache.todeInsgesammt .. player.deadsAll, 30, 335)
end

function levelVorlageNormalUpdate()
  if levelAussehen.anzahl == 0 then
    levelAussehen.anzahl=math.random(2,2)
    levelAussehen.typ1=math.random(1,2)
    levelAussehen.x1=math.random(130,250)
    levelAussehen.h1=math.random(30,120)
    levelAussehen.w1=math.random(50,150)
    levelAussehen.typ2=math.random(1,2)
    levelAussehen.x2=math.random(480,600)
    levelAussehen.h2=math.random(30,120)
    levelAussehen.w2=math.random(50,150)
  end
  
  -- Erste Figur Typ 1
  
  if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y + 175 >= levelAussehen.y1 - levelAussehen.h1 + 175 and levelAussehen.typ1 == 1 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400 
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
   -- Erste Knopf Typ 2
   
if player.x >= levelAussehen.x1 - 120 and player.x <= levelAussehen.x1 - 100 and player.y + 175 >= 380 + 175 and player.y + 175 <= 400 + 175 and levelAussehen.typ1 == 2 then
  player.y = player.boden
  levelAussehen.y21 = 0
  levelAussehen.runter1 = "true"
  levelAussehen.knopf1="false"
 end
 
   -- Erste Figur Typ 2
   
 if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y  + 175 >= levelAussehen.y1 - levelAussehen.h1  + 175 and levelAussehen.typ1 == 2 and levelAussehen.runter1 == "false" then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
 
   -- Zweite Figur Typ 1
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y - 175 <= levelAussehen.y2 - 175 and player.y - 175 >= levelAussehen.y2 - levelAussehen.h2 - 175 and levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
    -- Zweite Knopf Typ 2
    
if player.x >= levelAussehen.x2 - 120 and player.x <= levelAussehen.x2 - 100 and player.y - 175 >= 380 - 175 and player.y - 175 <= 400 - 175 and levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
  player.y = player.boden
  levelAussehen.runter2 = "true"
  levelAussehen.y22 = 0
  levelAussehen.knopf2="false"
end

   -- Zweite Figur Typ 2
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y - 175 <= levelAussehen.y2 - 175 and player.y - 175 >= levelAussehen.y2 - levelAussehen.h2 - 175 and levelAussehen.typ2 == 2 and levelAussehen.runter2 == "false" and levelAussehen.anzahl == 2 then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
end

--Ab hier ist Level Vorlage Hard

function levelVorlageHardDraw(r1, g1, b1, r2, g2, b2)
  lg.setColor(0, 0, 0)
  lg.rectangle("fill", player.x, player.y + 175, 20, 20)
  lg.rectangle("fill", player.x, (player.y / -1) + 405, 20, 20)
  lg.setColor(r1, g1, b1)
  if levelAussehen.typ1 == 1 then
    lg.rectangle("fill", levelAussehen.x1, levelAussehen.y1 + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
  elseif levelAussehen.typ1 == 2 then
    if levelAussehen.knopf1 == "true" then
      lg.draw(drehen, levelAussehen.x1 - 100, player.boden + 175 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x1, levelAussehen.y21  + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
    end
  end
  if levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    lg.rectangle("fill", levelAussehen.x2, levelAussehen.y2 - 335 , levelAussehen.w2, levelAussehen.h2 / -1)
  elseif levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
    if levelAussehen.knopf2 == "true" then
      lg.draw(drehen, levelAussehen.x2 - 100, player.boden - 340 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x2, levelAussehen.y22 - 335 , levelAussehen.w2, levelAussehen.h2 / -1)
    end
  end
  lg.rectangle("fill", 0, 225, 800, 150)
  lg.rectangle("fill", 0, 0, 800, 25)
  lg.rectangle("fill", 0, 600, 800, -25)
  lg.setBackgroundColor(r2, g2, b2)
  lg.setColor(r2, g2, b2)
  lg.setFont(level)
  lg.print("Level " .. player.level - 20 .. " " .. sprache.hard, 150, 250)
  lg.setFont(punkte)
  lg.print(sprache.todeInsgesammt .. player.deadsAll, 30, 335)
end

function levelVorlageHardUpdate()
  if levelAussehen.anzahl == 0 then
    levelAussehen.anzahl=math.random(2,2)
    levelAussehen.typ1=math.random(1,2)
    levelAussehen.x1=math.random(130,250)
    levelAussehen.h1=math.random(30,120)
    levelAussehen.w1=math.random(50,150)
    levelAussehen.typ2=math.random(1,2)
    levelAussehen.x2=math.random(480,600)
    levelAussehen.h2=math.random(30,120)
    levelAussehen.w2=math.random(50,150)
  end
  
  -- Erste Figur Typ 1
  
  if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y + 175 >= levelAussehen.y1 - levelAussehen.h1 + 175 and levelAussehen.typ1 == 1 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400 
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
   -- Erste Knopf Typ 2
   
if player.x >= levelAussehen.x1 - 120 and player.x <= levelAussehen.x1 - 100 and player.y + 175 >= 380 + 175 and player.y + 175 <= 400 + 175 and levelAussehen.typ1 == 2 then
  player.y = player.boden
  levelAussehen.y21 = 0
  levelAussehen.runter1 = "true"
  levelAussehen.knopf1="false"
 end
 
   -- Erste Figur Typ 2
   
 if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y  + 175 >= levelAussehen.y1 - levelAussehen.h1  + 175 and levelAussehen.typ1 == 2 and levelAussehen.runter1 == "false" then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
 
   -- Zweite Figur Typ 1
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and (player.y / -1) + 405 <= levelAussehen.y2 - 335 and (player.y / -1) + 405 >= levelAussehen.y2 - levelAussehen.h2 - 335 and levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400
    levelAussehen.y22 = 400
    levelAussehen.runter1 = "false"
    levelAussehen.runter2 = "false"
    levelAussehen.knopf1="true"
    levelAussehen.knopf2="true"
 end
 
    -- Zweite Knopf Typ 2
    
if player.x >= levelAussehen.x2 - 120 and player.x <= levelAussehen.x2 - 100 and (player.y / -1) + 405 >= 380 - 360 and (player.y / -1) + 405 <= 400 - 360 and levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
  player.y = player.boden
  levelAussehen.runter2 = "true"
  levelAussehen.y22 = 0
  levelAussehen.knopf2="false"
end

   -- Zweite Figur Typ 2
   
 if player.x >= levelAussehen.x2 - 20 and player.x <= levelAussehen.x2 + levelAussehen.w2 + 20 and (player.y / -1) + 405 <= levelAussehen.y2 - 335 and (player.y / -1) + 405 >= levelAussehen.y2 - levelAussehen.h2 - 335 and levelAussehen.typ2 == 2 and levelAussehen.runter2 == "false" and levelAussehen.anzahl == 2 then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.y22 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.runter2 = "false"
  levelAussehen.knopf1="true"
  levelAussehen.knopf2="true"
 end
end

--Ab hier ist Level Vorlage 2 Spieler

function levelVorlage2PlayersDraw(r1, g1, b1, r2, g2, b2)
  lg.setColor(0, 0, 0)
  lg.rectangle("fill", player.x, player.y + 175, 20, 20)
  lg.rectangle("fill", player.x2, player.y2 - 175, 20, 20)
  lg.setColor(r1, g1, b1)
  if levelAussehen.typ1 == 1 then
    lg.rectangle("fill", levelAussehen.x1, levelAussehen.y1 + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
  elseif levelAussehen.typ1 == 2 then
    if levelAussehen.knopf1 == "true" then
      lg.draw(drehen, levelAussehen.x1 - 100, player.boden + 175 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x1, levelAussehen.y21  + 175 , levelAussehen.w1, levelAussehen.h1 / -1)
    end
  end
  if levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    lg.rectangle("fill", levelAussehen.x2, levelAussehen.y2 - 175 , levelAussehen.w2, levelAussehen.h2 / -1)
  elseif levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
    if levelAussehen.knopf2 == "true" then
      lg.draw(drehen, levelAussehen.x2 - 100, player.boden - 175 , player.rotation, 0.06, 0.06, 100, 100)
      lg.rectangle("fill", levelAussehen.x2, levelAussehen.y22 - 175 , levelAussehen.w2, levelAussehen.h2 / -1)
    end
  end
  lg.rectangle("fill", 0, 225, 800, 150)
  lg.rectangle("fill", 0, 0, 800, 25)
  lg.rectangle("fill", 0, 600, 800, -25)
  lg.setBackgroundColor(r2, g2, b2)
  lg.setColor(r2, g2, b2)
  lg.setFont(level)
  lg.print("Level " .. player.level - 30 .. "  " .. sprache.twoPlayers, 100, 275)
  lg.setFont(punkte)
  lg.print(sprache.player1 .. " " .. sprache.todeInsgesammt .. player.deadsAll, 30, 335)
  lg.print(sprache.player2 .. " " .. sprache.todeInsgesammt .. player.deadsAll2, 30, 245)
end

function levelVorlage2PlayersUpdate()
  if levelAussehen.anzahl == 0 then
    levelAussehen.anzahl=math.random(2,2)
    levelAussehen.typ1=math.random(1,2)
    levelAussehen.x1=math.random(130,250)
    levelAussehen.h1=math.random(30,120)
    levelAussehen.w1=math.random(50,150)
    levelAussehen.typ2=math.random(1,2)
    levelAussehen.x2=math.random(480,600)
    levelAussehen.h2=math.random(30,120)
    levelAussehen.w2=math.random(50,150)
  end
  
  -- Erste Figur Typ 1
  
  if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y + 175 >= levelAussehen.y1 - levelAussehen.h1 + 175 and levelAussehen.typ1 == 1 then
    player.x = 0
    player.y = player.boden
    player.deadsAll = player.deadsAll + 1
    levelAussehen.y21 = 400 
    levelAussehen.runter1 = "false"
    levelAussehen.knopf1="true"
 end
 
   -- Erste Knopf Typ 2
   
if player.x >= levelAussehen.x1 - 120 and player.x <= levelAussehen.x1 - 100 and player.y + 175 >= 380 + 175 and player.y + 175 <= 400 + 175 and levelAussehen.typ1 == 2 then
  player.y = player.boden
  levelAussehen.y21 = 0
  levelAussehen.runter1 = "true"
  levelAussehen.knopf1="false"
 end
 
   -- Erste Figur Typ 2
   
 if player.x >= levelAussehen.x1 - 20 and player.x <= levelAussehen.x1 + levelAussehen.w1 + 20 and player.y  + 175 <= levelAussehen.y1 + 175 and player.y  + 175 >= levelAussehen.y1 - levelAussehen.h1  + 175 and levelAussehen.typ1 == 2 and levelAussehen.runter1 == "false" then
  player.y = player.boden
  player.x = 0
  player.deadsAll = player.deadsAll + 1
  levelAussehen.y21 = 400
  levelAussehen.runter1 = "false"
  levelAussehen.knopf1="true"
 end
 
  -- Zweite Figur Typ 1
   
 if player.x2 >= levelAussehen.x2 - 20 and player.x2 <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y2 - 175 <= levelAussehen.y2 - 175 and player.y2 - 175 >= levelAussehen.y2 - levelAussehen.h2 - 175 and levelAussehen.typ2 == 1 and levelAussehen.anzahl == 2 then
    player.x2 = 0
    player.y2 = player.boden
    player.deadsAll2 = player.deadsAll2 + 1
    levelAussehen.y22 = 400
    levelAussehen.runter2 = "false"
    levelAussehen.knopf2="true"
 end
 
    -- Zweite Knopf Typ 2
    
if player.x2 >= levelAussehen.x2 - 120 and player.x2 <= levelAussehen.x2 - 100 and player.y2 - 175 >= 380 - 175 and player.y2 - 175 <= 400 - 175 and levelAussehen.typ2 == 2 and levelAussehen.anzahl == 2 then
  player.y2 = player.boden
  levelAussehen.runter2 = "true"
  levelAussehen.y22 = 0
  levelAussehen.knopf2="false"
end

   -- Zweite Figur Typ 2
   
 if player.x2 >= levelAussehen.x2 - 20 and player.x2 <= levelAussehen.x2 + levelAussehen.w2 + 20 and player.y2 - 175 <= levelAussehen.y2 - 175 and player.y2 - 175 >= levelAussehen.y2 - levelAussehen.h2 - 175 and levelAussehen.typ2 == 2 and levelAussehen.runter2 == "false" and levelAussehen.anzahl == 2 then
  player.y2 = player.boden
  player.x2 = 0
  player.deadsAll2 = player.deadsAll2 + 1
  levelAussehen.y22 = 400
  levelAussehen.runter2 = "false"
  levelAussehen.knopf2="true"
 end
end