 function love.load()
  stern={}
  anzahlSterne=0
  vomZentrumWeg=false
  math.randomseed(os.time())
  speed=0
  speedMax=10
end

function trageInTabelleEin(x, y)
  local temp={
    x=x;
    y=y;
    r=math.random(0,2);
  }
  table.insert(stern, temp)
end

function sternSpawn()
  while anzahlSterne < 5000 do
    trageInTabelleEin(math.random(0, 900), math.random(0, 900))
    anzahlSterne=anzahlSterne+1
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0,0,0)
  for i,v in ipairs(stern) do
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("fill", v.x, v.y, v.r)
  end
  love.graphics.print(speed, 850, 850)
end

function love.update(dt)
  sternSpawn()
  if love.keyboard.isDown(" ") then
    vomZentrumWeg=true
    if speed <= speedMax then
      speed=speed+10*dt
    end
    if speed >= speedMax then
      speed=speed-10*dt
    end
  elseif not love.keyboard.isDown(" ") then
    vomZentrumWeg=false
    speed=0
  end
  if vomZentrumWeg == true then
    for i,v in ipairs(stern) do
      local m = (450-v.y)/(450-v.x)
      x_bewegung=1/math.sqrt(1+m^2)
      y_bewegung=math.sqrt(1-(1/math.sqrt(1+m^2))^2)
      if v.x > 450 then
        x_bewegung = x_bewegung*-1
      end
      if v.y > 450 then
        y_bewegung = y_bewegung*-1
      end
      v.x=v.x-x_bewegung*speed
      v.y=v.y-y_bewegung*speed
      if v.x <= 900 and v.x >= 0 and v.y <= 900 and v.y >= 0 then
        sternAusserhalb=false
      else
        sternAusserhalb=true
      end
      if sternAusserhalb then
        table.remove(stern, i)
        trageInTabelleEin(math.random(250, 650), math.random(250, 650))
      end
    end
  end
  if love.keyboard.isDown("]") then
    speedMax=speedMax+1
  elseif love.keyboard.isDown("/") and speedMax >= 0 then
    speedMax=speedMax-1
  end
end