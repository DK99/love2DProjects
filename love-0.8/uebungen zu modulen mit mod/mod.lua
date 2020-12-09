module(...,package.seeall)
disco=false
spielerSpeed = 200
hindernissSpeed = 100

function mod.keypressed(key)
  if key == "return" then
    disco=true
  elseif key == " " then
    disco=false
  end  
  if key == "kp1" and spielerSpeed <=500 then
    spielerSpeed = spielerSpeed + 100
  end
  if key == "kp2" and spielerSpeed >=0 then
    spielerSpeed = spielerSpeed - 100
  end
  if key == "kp4" and hindernissSpeed <=500 then
    hindernissSpeed = hindernissSpeed + 100
  end
  if key == "kp5" and hindernissSpeed >=0 then
    hindernissSpeed = hindernissSpeed - 100
  end
end