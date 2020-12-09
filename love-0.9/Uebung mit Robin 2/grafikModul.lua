module (...,package.seeall)
utility = require "utility"

local kreisMasse={}

function grafikModul.draw()
  grafikModul.zeichneKreisMasse()
end

function grafikModul.load()
  for i=1,1000,1 do 
   local  meineKreise={ 
      x=math.random(0,800),
      y=math.random(0,800),
      r=math.random(1,10),
      ausrichtung=math.random(1,2)
    }
    meineKreise.x=math.random(0+meineKreise.r,800-meineKreise.r)
    meineKreise.y=math.random(0+meineKreise.r,800-meineKreise.r)
    if meineKreise.ausrichtung == 1 then 
      meineKreise.ausrichtung ="gut"
      
     else
       meineKreise.ausrichtung = "gemein"
    end
    table.insert(kreisMasse,meineKreise)
    
  end
end


function grafikModul.zeichneKreisMasse()
  for i,v in ipairs(kreisMasse) do 
    if v.ausrichtung == "gut" then
      love.graphics.setColor(0,0,255)
  
     else 
      love.graphics.setColor(255,0,0)
    end
      love.graphics.circle("fill",v.x,v.y,v.r)
  
    
  end
end

function grafikModul.keypressed(key)
  for i,v in ipairs(kreisMasse)do 
    if key == "y" then 
      v.ausrichtung = math.random(1,2)
     if v.ausrichtung ==1 then 
       v.ausrichtung = "gut"
   
     else 
      v.ausrichtung = "gemein" 
    end
  end
   if key == "x" then 
     v.x = math.random(v.r,800-v.r)
     v.y = math.random(v.r,800-v.r)
    end
    
    if key == "c" then
      if v.ausrichtung == "gemein" then
        for i2,v2 in ipairs(kreisMasse)do
          if v2.ausrichtung == "gut" then
            if utility.gibAbstand(v.x,v.y,v2.x,v2.y) <= v.r+v2.r then 
              table.remove(kreisMasse,i2)
            end
          end
        end
      end
    end
      
  end
    
      
end

function grafikModul.update(dt)
  for i,v in ipairs(kreisMasse) do
    if love.keyboard.isDown (" ") and v.ausrichtung == "gut" then 
      v.x = v.x +5 * dt
     
    elseif love.keyboard.isDown(" ") and v.ausrichtung == "gemein" then 
      v.x=v.x - 5 * dt
      
    
    end
  end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  