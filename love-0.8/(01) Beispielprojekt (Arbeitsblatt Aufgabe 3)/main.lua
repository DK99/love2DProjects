function love.draw()
 	love.graphics.setColor(255, 255, 0)
    love.graphics.circle("fill",0,0,30)
	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("line",60,20,10)
	love.graphics.circle("line",60,45,15)
	love.graphics.circle("line",60,80,20)
	love.graphics.print("Oh Gott, ich schm...", 80, 25)
end