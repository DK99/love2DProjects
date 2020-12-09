function love.draw()
  for i,v in ipairs(meineQuadrate) do 
    zeichneQuadrate(v.x,v.y)
  end
  love.graphics.print(#meineQuadrate ,100,100)
end



function love.load()
  h=25
  b=25
  meineQuadrate={}
  erstelleQuadrate()
end

function love.update(dt)
  for i,v in ipairs(meineQuadrate) do 
    if v.r == 1 then
      v.y = v.y - v.g * dt
      
    elseif v.r == 2 then
      v.y= v.y + v.g * dt
     
    elseif v.r == 3 then
      v.x = v.x + v.g * dt
      
    else 
      v.x = v.x - v.g * dt
    end
    
    if v.x< -75 then 
      table.remove(meineQuadrate,i)
    
    elseif v.y < -75 then 
      table.remove(meineQuadrate,i)
      
     elseif v.x > 1000 then 
       table.remove(meineQuadrate,i)
     
     elseif v.y > 700 then 
       table.remove(meineQuadrate,i)
    end
  end
 end

function zeichneQuadrate(x,y)
  love.graphics.rectangle("line",x,y,b,h)
  love.graphics.rectangle("line",x+b,y+h,b,h)
  love.graphics.rectangle("line",x+b*2,y,b,h)
  love.graphics.rectangle("line",x,y+h*2,b,h)
  love.graphics.rectangle("line",x+b*2,y+h*2,b,h)
  
 end
 
 function erstelleQuadrate()
    for i=0,b*30,b*3 do
      for i2=0,h*30,h*3 do
        local einQuadrat={
          x=i,
          y=i2,
          g=math.random(1,500),
          r=math.random(1,4),
         }
         table.insert(meineQuadrate,einQuadrat)      
        end
    end
  end


  