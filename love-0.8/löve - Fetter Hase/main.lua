function love.load()
  -- Startwerte
  rabbitX = 100
  rabbitY = 400
  rabbitDirection = "stand_links"
  
  -- Bilder
  rabbit_sit_right = love.graphics.newImage("media/rabbit_sit_right.png")
  rabbit_sit_left = love.graphics.newImage("media/rabbit_sit_left.png")
  rabbit_run_right = love.graphics.newImage("media/rabbit_run_right.png")
  rabbit_run_left = love.graphics.newImage("media/rabbit_run_left.png")
  rabbit_look_front = love.graphics.newImage("media/rabbit_look_front.png")
  
  -- Zu zeichnendes Bild
  rabbitToDraw = rabbit_sit_right
  
  zeit=os.time()
end

function love.draw()
  love.graphics.setColor(100,100,100,255)
  love.graphics.rectangle("fill",0,430,800,20)
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(rabbitToDraw,rabbitX,rabbitY,0,0.3,0.3)
end

function love.update(dt)
  if os.difftime(os.time(),zeit)>= 3 and os.difftime(os.time(),zeit)<= 4 and rabbitX <= 700 then
    rabbitX = rabbitX + 500 * dt
    rabbitToDraw = rabbit_run_right
    if rabbitX >= 300 and rabbitX <= 350 then
      if rabbitY <=800 then
        rabbitY = rabbitY + 100 * dt
      elseif rabbitY <= 800 and rabbitY >= 400 then
        rabbitY = rabbitY - 100 * dt
      end
    end
  elseif os.difftime(os.time(), zeit) <= 4 and rabbitX >= 650 then
    rabbitToDraw = rabbit_sit_right
  elseif os.difftime(os.time(), zeit) == 5 then
    rabbitToDraw = rabbit_sit_left
  elseif os.difftime(os.time(), zeit) >= 8 and rabbitX >= 400 then
    rabbitX = rabbitX - 500 * dt
    rabbitToDraw = rabbit_run_left
  elseif os.difftime(os.time(), zeit) == 9 then
    rabbitToDraw = rabbit_look_front
  elseif os.difftime(os.time(), zeit) >= 10 then
    os.exit()
  end
end
