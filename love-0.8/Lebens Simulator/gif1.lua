module(..., package.seeall)
spielTabelle=require 'spielTabelle'

gif1={
  bild1=love.graphics.newImage("gfx/gif1/IMG00000.bmp");
  bild2=love.graphics.newImage("gfx/gif1/IMG00001.bmp");
  bild3=love.graphics.newImage("gfx/gif1/IMG00002.bmp");
  bild4=love.graphics.newImage("gfx/gif1/IMG00003.bmp");
  bild5=love.graphics.newImage("gfx/gif1/IMG00004.bmp");
  bild6=love.graphics.newImage("gfx/gif1/IMG00005.bmp");
  bild7=love.graphics.newImage("gfx/gif1/IMG00006.bmp");
  bild8=love.graphics.newImage("gfx/gif1/IMG00007.bmp");
  bild9=love.graphics.newImage("gfx/gif1/IMG00008.bmp");
  bild10=love.graphics.newImage("gfx/gif1/IMG00009.bmp");
  bild11=love.graphics.newImage("gfx/gif1/IMG00010.bmp");
  bild12=love.graphics.newImage("gfx/gif1/IMG00011.bmp");
  bild13=love.graphics.newImage("gfx/gif1/IMG00012.bmp");
  bild14=love.graphics.newImage("gfx/gif1/IMG00013.bmp");
  bild15=love.graphics.newImage("gfx/gif1/IMG00014.bmp");
  bild16=love.graphics.newImage("gfx/gif1/IMG00015.bmp");
  bild17=love.graphics.newImage("gfx/gif1/IMG00016.bmp");
  bild18=love.graphics.newImage("gfx/gif1/IMG00017.bmp");
  bild19=love.graphics.newImage("gfx/gif1/IMG00018.bmp");
  bild20=love.graphics.newImage("gfx/gif1/IMG00019.bmp");
  bild21=love.graphics.newImage("gfx/gif1/IMG00020.bmp");
  bild22=love.graphics.newImage("gfx/gif1/IMG00021.bmp");
  bild23=love.graphics.newImage("gfx/gif1/IMG00022.bmp");
  bild24=love.graphics.newImage("gfx/gif1/IMG00023.bmp");
  bild25=love.graphics.newImage("gfx/gif1/IMG00024.bmp");
  bilder=bild1;
  timer=0;
  zoom=5;
}

function gif1_draw()
  if gif1.timer <= 0.25 then
    love.graphics.draw(gif1.bild1, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 0.5 then
    love.graphics.draw(gif1.bild2, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 0.75 then
    love.graphics.draw(gif1.bild3, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 1 then
    love.graphics.draw(gif1.bild4, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 1.25 then
    love.graphics.draw(gif1.bild5, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 1.5 then
    love.graphics.draw(gif1.bild6, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 1.75 then
    love.graphics.draw(gif1.bild7, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 2 then
    love.graphics.draw(gif1.bild8, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 2.25 then
    love.graphics.draw(gif1.bild9, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 2.5 then
    love.graphics.draw(gif1.bild10, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 2.75 then
    love.graphics.draw(gif1.bild11, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 3 then
    love.graphics.draw(gif1.bild12, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 3.25 then
    love.graphics.draw(gif1.bild13, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 3.5 then
    love.graphics.draw(gif1.bild14, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 3.75 then
    love.graphics.draw(gif1.bild15, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 4 then
    love.graphics.draw(gif1.bild16, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 4.25 then
    love.graphics.draw(gif1.bild17, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 4.5 then
    love.graphics.draw(gif1.bild18, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 4.75 then
    love.graphics.draw(gif1.bild19, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 5 then
    love.graphics.draw(gif1.bild20, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 5.25 then 
    love.graphics.draw(gif1.bild21, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 5.5 then
    love.graphics.draw(gif1.bild22, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 5.75 then
    love.graphics.draw(gif1.bild23, 0, 0, 0, 5, sx)
  elseif gif1.timer <= 6 then
    love.graphics.draw(gif1.bild24, 0, 0, 0, 5, sx)
  else
    love.graphics.draw(gif1.bild25, 0, 0, 0, gif1.zoom, sx)
  end
end

function gif1_update(dt)
  gif1.timer=gif1.timer+dt
  if gif1.zoom <= 15 and gif1.timer >= 6.5 then
    gif1.zoom = gif1.zoom + 5 * dt
  elseif gif1.zoom >= 15 then
    spielTabelle.szene="Level 1"
    gif1.bilder=bild1
    gif1.timer=0
    gif1.zoom=5
  end
end