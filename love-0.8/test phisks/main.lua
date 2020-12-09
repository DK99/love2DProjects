function love.load()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81 * 64, true)
  
  objects = {}
  
  objects.ball = {}
  currentb = 1
  
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 800/2, 600)
  objects.ground.shape = love.physics.newRectangleShape(800, 25)
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)
  
  objects.ceiling = {}
  objects.ceiling.body = love.physics.newBody(world, 800/2, 0)
  objects.ceiling.shape = love.physics.newRectangleShape(800, 25)
  objects.ceiling.fixture = love.physics.newFixture(objects.ceiling.body, objects.ceiling.shape)
  
  objects.leftwall = {}
  objects.leftwall.body = love.physics.newBody(world, 0, 600/2)
  objects.leftwall.shape = love.physics.newRectangleShape(25, 800)
  objects.leftwall.fixture = love.physics.newFixture(objects.leftwall.body, objects.leftwall.shape)
  
  objects.rightwall = {}
  objects.rightwall.body = love.physics.newBody(world, 800, 600/2)
  objects.rightwall.shape = love.physics.newRectangleShape(25, 800)
  objects.rightwall.fixture = love.physics.newFixture(objects.rightwall.body, objects.rightwall.shape)
  
  objects.block = {}
  objects.block.body = love.physics.newBody(world, 300, 100, "dynamic")
  objects.block.shape = love.physics.newRectangleShape(50, 50)
  objects.block.fixture = love.physics.newFixture(objects.block.body, objects.block.shape)
  objects.block.fixture:setRestitution(0.9)
end

function love.update(dt)
  world:update(dt)
  
  if love.keyboard.isDown("w") then
    objects.block.body:applyForce(0, -400)
  elseif love.keyboard.isDown("s") then
    objects.block.body:applyForce(0, 400)
  end
  
  if love.keyboard.isDown("a") then
    objects.block.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("d") then
    objects.block.body:applyForce(400, 0)
  end
  if love.keyboard.isDown("q") then
    for zahl=1, 1 , 1 do
      addBall()
    end
  elseif love.keyboard.isDown("e") then
    for b = #objects.ball, 1, -1 do
      objects.ball[b].body:destroy()
      table.remove(objects.ball, b)
    end
    
    currentb = 1
  end
end

function love.draw()
  love.graphics.setColor(math.random(0,255), math.random(0,255), math.random(0,255))
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  
  love.graphics.polygon("fill", objects.ceiling.body:getWorldPoints(objects.ceiling.shape:getPoints()))
  
  love.graphics.polygon("fill", objects.leftwall.body:getWorldPoints(objects.leftwall.shape:getPoints()))
  
  love.graphics.polygon("fill", objects.rightwall.body:getWorldPoints(objects.rightwall.shape:getPoints()))
  
  love.graphics.polygon("fill", objects.block.body:getWorldPoints(objects.block.shape:getPoints()))
  
  for q = 1, #objects.ball do
    love.graphics.circle("fill", objects.ball[q].body:getX(), objects.ball[q].body:getY(), objects.ball[q].shape:getRadius())
  end
  love.graphics.setColor(255, 0, 0)
  love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 100, 100)
  love.graphics.print("Anzahl: "..currentb, 100, 150)
end

function love.keypressed(key, unicode)
  if key=="escape" then
    os.exit()
  end
end

function addBall()
  mx, my = love.mouse.getPosition()
  
  objects.ball[currentb] = {}
  objects.ball[currentb].body = love.physics.newBody(world, mx, my, "dynamic")
  objects.ball[currentb].shape = love.physics.newCircleShape(20)
  objects.ball[currentb].fixture = love.physics.newFixture(objects.ball[currentb].body, objects.ball[currentb].shape, 1)
  objects.ball[currentb].fixture:setRestitution(0.9)
  currentb = currentb + 1
end