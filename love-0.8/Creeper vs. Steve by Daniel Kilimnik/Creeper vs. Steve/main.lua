function love.load()
  menu=false
  spielfeld_vertikal_x=0
  spielfeld_horizontal_y=0
  spielfeld_sand_x=0
  lPosiX=0
  lPosiY=0
  lPunkte=0
  lSuper=false
  rPosiX=750
  rPosiY=750
  rPunkte=0
  rSuper=false
  sPosiX=math.random(0,15)*50
  sPosiY=math.random(0,15)*50
  dPosiX=math.random(0,15)*50
  dPosiY=math.random(0,15)*50
  math.randomseed(os.time())
  timer=0
  timer2=0
  schrift=love.graphics.newFont("schrift.ttf", 30)
  menuS=love.graphics.newFont("schrift.ttf", 100)
  gewinn=love.graphics.newFont("schrift.ttf", 50)
  sand=love.graphics.newImage("minecraft_sand.png")
  sandSchatz=love.graphics.newImage("minecraft_sandschatz.png")
  logo=love.graphics.newImage("Logo_DK.png")
  diablock=love.graphics.newImage("diablock.png")
  creeper_left=love.graphics.newImage("creeper_left.png")
  creeper_front=love.graphics.newImage("creeper_front.png")
  creeper_back=love.graphics.newImage("creeper_back.png")
  creeper_right=love.graphics.newImage("creeper_right.png")
  creeper_richtung="front"
  steve_left=love.graphics.newImage("steve_left.png")
  steve_front=love.graphics.newImage("steve_front.png")
  steve_back=love.graphics.newImage("steve_back.png")
  steve_right=love.graphics.newImage("steve_right.png")
  steve_richtung="front"
  gewinner=""
  timer1=true
  timer3=true
  minecraft=love.audio.newSource("Minecraft Music.mp3")
end

function love.update(dt)
  love.audio.setVolume(20)
  love.audio.play(minecraft)
  if not menu then
    if rPosiX > 750 then
      rPosiX = 750
      end
    if rPosiX < 0 then
      rPosiX = 0
    end
    if rPosiY > 750 then
      rPosiY = 750
    end
    if rPosiY < 0 then
      rPosiY = 0
    end
    if lPosiX > 750 then
      lPosiX = 750
    end
    if lPosiX < 0 then
      lPosiX = 0
    end
    if lPosiY > 750 then
      lPosiY = 750
    end
    if lPosiY < 0 then
      lPosiY = 0
    end
    timer=timer+dt
    if timer>=2 then
      sPosiX=math.random(0,15)*50
      sPosiY=math.random(0,15)*50
      timer=0
    end
    timer2=timer2+dt
    if timer2>=10 then
      dPosiX=math.random(0,15)*50
      dPosiY=math.random(0,15)*50
      timer2=0
    end
    if lPosiX == sPosiX and lPosiY == sPosiY then
      timer=2
      lPunkte=lPunkte+1
    end
    if rPosiX == sPosiX and rPosiY == sPosiY then
      timer=2
      rPunkte=rPunkte+1
    end
    if lPosiX == dPosiX and lPosiY == dPosiY and not lSuper and not rSuper then
      timer2=10
      lSuper=true
      lPunkte=lPunkte+5
    end
    if rPosiX == dPosiX and rPosiY == dPosiY and not lSuper and not rSuper then
      timer2=10
      rSuper=true
      rPunkte=rPunkte+5
    end
    if lPunkte == 50 then
      gewinner="Gewinner ist det Creeper"
    end
    if rPunkte == 50 then
      gewinner="Gewinner ist Steve"
    end
    if lPunkte == 50 and rPunkte == 50 then
      gewinner="Unentschieden"
    end
  end
end

function love.draw()
  if not menu then
    if lSuper then
      love.graphics.draw(diablock, 300, 50, 0, 2, sx)
    elseif rSuper then
      love.graphics.draw(diablock, 750, 50, 0, 2, sx)
    end
    if gewinner == "" then
      spielfeld()
      love.graphics.setLineWidth(4)
      love.graphics.setFont(schrift)
      love.graphics.print("Punkte Creeper "..lPunkte, 50, 50)
      love.graphics.print("Punkte Steve "..rPunkte, 500, 50)
      spielFigur(lPosiX,lPosiY+100,1)
      spielFigur(rPosiX,rPosiY+100,2)
      schatzKiste(sPosiX,sPosiY+100)
      schatzDia(dPosiX,dPosiY+100)
    else
      love.graphics.setColorMode("replace")
      love.graphics.draw(logo, 50, 50, 0, 1.5, sx)
      love.graphics.setColorMode("modulate")
      if gewinner == "Gewinner ist der Creeper" then
      elseif gewinner == "Gewinner ist Steve" then
      else
        love.graphics.setColor(255, 255, 255)
      end
      love.graphics.setFont(gewinn)
      love.graphics.print(gewinner, 100, 700)
    end
  elseif menu then
    love.graphics.setFont(menuS)
    love.graphics.print("Menü", 300, 50)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("line", 200, 300, 350, 100)
    love.graphics.print("Neustart", 225, 300)
    love.graphics.rectangle("line", 200, 500, 350, 100)
    love.graphics.print("Beenden", 225, 500)
  end
end

function love.mousepressed(x, y, button)
  if menu then
    if button == "l" and x >=200 and x <= 650 and y >= 300 and y <= 400 then
      menu=false
      lPosiX = 0
      lPosiY = 0
      rPosiY = 750
      rPosiX = 750
      timer = 2
      timer2 = 10
      rSuper = false
      lSuper = false
      rPunkte = 0
      lPunkte = 0
      lcheat=false
      gewinner=""
    end
    if button == "l" and x >=200 and x <= 650 and y >= 500 and y <= 600 then
      os.exit()
    end
  end
end

function love.keypressed(key)
  if key == "escape" and not menu then
    menu=true
  elseif key == "escape" and menu then
    menu=false
  end
  if not menu then
    if key == "lshift" and lSuper==true then
      lSuper=false
      rPunkte=rPunkte-5
    end
    if key == "rshift" and rSuper==true then
      rSuper=false
      lPunkte=lPunkte-5
    end
    if key == "1" then
      lcheat=true
    end
    if key == "q" and lcheat then
      lPunkte=lPunkte+50
    end
    if key == "e" and lcheat then
      rPunkte=rPunkte-1
    end
    if key == "up" and rPosiY-50 == lPosiY and rPosiX == lPosiX then
      steve_richtung="back"
    elseif key == "up" then
      steve_richtung="back"
      rPosiY = rPosiY - 50
    end
    if key == "down" and rPosiY+50 == lPosiY and rPosiX == lPosiX then
      steve_richtung="front"
    elseif key == "down" then
      steve_richtung="front"
      rPosiY = rPosiY + 50
    end
    if key == "right" and rPosiY == lPosiY and rPosiX+50 == lPosiX then
      steve_richtung="right"
    elseif key == "right" then
      steve_richtung="right"
      rPosiX = rPosiX + 50
    end
    if key == "left" and rPosiY == lPosiY and rPosiX-50 == lPosiX then
      steve_richtung="left"
    elseif key == "left" then
      steve_richtung="left"
      rPosiX = rPosiX - 50
    end
    if key == "w" and lPosiY-50 == rPosiY and lPosiX == rPosiX then
      creeper_richtung="back"
    elseif key == "w" then
      creeper_richtung="back"
      lPosiY = lPosiY - 50
    end
    if key == "s" and lPosiY+50 == rPosiY and lPosiX == rPosiX then
      creeper_richtung="front"
    elseif key == "s" then
      creeper_richtung="front"
      lPosiY = lPosiY + 50
    end
    if key == "d" and lPosiY == rPosiY and lPosiX+50 == rPosiX then
      creeper_richtung="right"
    elseif key == "d" then
      creeper_richtung="right"
      lPosiX = lPosiX + 50
    end
    if key == "a" and lPosiY == rPosiY and lPosiX-50 == rPosiX then
      creeper_richtung="left"
    elseif key == "a" then
      creeper_richtung="left"
      lPosiX = lPosiX - 50
    end
  end
end

function spielFigur(x, y, spieler)
  if spieler == 1 then
    if creeper_richtung=="front" then
      love.graphics.draw(creeper_front, x+1, y+1, 0, 0.14, sx)
    elseif creeper_richtung=="back" then
      love.graphics.draw(creeper_back, x+1, y+1, 0, 0.14, sx)
    elseif creeper_richtung=="left" then
      love.graphics.draw(creeper_left, x+1, y+1, 0, 0.14, sx)
    elseif creeper_richtung=="right" then
      love.graphics.draw(creeper_right, x+1, y+1, 0, 0.14, sx)
    end
  elseif spieler == 2 then
    if steve_richtung=="front" then
      love.graphics.draw(steve_front, x+13, y+3, 0, 0.25, sx)
    elseif steve_richtung=="back" then
      love.graphics.draw(steve_back, x+13, y+3, 0, 0.25, sx)
    elseif steve_richtung=="left" then
      love.graphics.draw(steve_left, x+13, y+3, 0, 0.25, sx)
    elseif steve_richtung=="right" then
      love.graphics.draw(steve_right, x+13, y+3, 0, 0.25, sx)
    end
  end
end

function schatzKiste(x,y)
  love.graphics.draw(sandSchatz, x+1, y+1, 0, 3, sx)
end

function spielfeld()
  love.graphics.setColorMode("replace")
  while spielfeld_sand_x < 800 do
    love.graphics.draw(sand, spielfeld_sand_x, 0+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 50+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 100+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 150+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 200+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 250+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 300+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 350+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 400+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 450+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 500+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 550+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 600+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 650+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 700+100, 0, 0.15, sx)
    love.graphics.draw(sand, spielfeld_sand_x, 750+100, 0, 0.15, sx)
    spielfeld_sand_x=spielfeld_sand_x+50
  end
  spielfeld_sand_x=0
  
  love.graphics.setColor(0, 0, 0)
  while spielfeld_vertikal_x < 800 do
    love.graphics.line(spielfeld_vertikal_x, 100, spielfeld_vertikal_x, 900)
    spielfeld_vertikal_x=spielfeld_vertikal_x+50
  end
  spielfeld_vertikal_x=0
  
  while spielfeld_horizontal_y < 800 do
    love.graphics.line(0, spielfeld_horizontal_y+100, 800, spielfeld_horizontal_y+100)
    spielfeld_horizontal_y=spielfeld_horizontal_y+50
  end
  spielfeld_horizontal_y=0
end

function schatzDia(x, y)
  if not lSuper and not rSuper then
    love.graphics.draw(diablock, x, y, 0, 3, sx)
  end
end