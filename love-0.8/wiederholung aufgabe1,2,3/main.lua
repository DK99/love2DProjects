function love.load()
  gPosiX=151
  gPosiY=190
  kPosiX=500
  kPosiY=445
  timer=0
end

function love.update(dt)
  timer=timer+1*dt
  if timer >= 5 then
    gPosiX=gPosiX+100*dt
  end
  if timer >= 7 then
    kPosiX=kPosiX+50*dt
  end
end

function love.draw()
  grosseFigur(gPosiX,gPosiY)
  kleineFigur(kPosiX,kPosiY)
end

function grosseFigur(x,y)
  if gPosiX > 400 then
    love.graphics.setColor(0,255,0) 
  else 
    love.graphics.setColor(255,0,0)
  end
  love.graphics.rectangle("fill",x,y,200,300)
  love.graphics.circle("fill",x,y,25)
end

function kleineFigur(x,y)
  if kPosiX > 400 then
    love.graphics.setColor(0,255,0) 
  else 
    love.graphics.setColor(255,0,0)
  end
  love.graphics.rectangle("fill",x,y,100,50)
  love.graphics.circle("fill",x+100,y,10)
end


