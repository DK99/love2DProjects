function love.load()
  breite = 30
  hoehe = 20
  flaecher = breite * hoehe
  umfangr = 2 * breite + 2 * hoehe
  radius = 20
  umfangk = 2 * radius * math.pi
  flaechek = radius * radius * math.pi
  xd = 200
  yd = 400
  --umfangd = 
  --flaeched = 
end
function love.draw()
  love.graphics.rectangle("fill", 100, 100, breite, hoehe)
  love.graphics.print("Der Umfang meines Rechtecks beträgt " .. umfangr .. " Pixel!", 400, 100)
  love.graphics.print("Der Flächeninhalt beträgt " .. flaecher .. " Quadratpixel", 400, 200)
  love.graphics.circle("fill", 300, 300, radius)
  love.graphics.print("Der Umfang meines Kreises beträgt " .. umfangk .. " Pixel!", 400, 300)
  love.graphics.print("Der Flächeninhalt beträgt " .. flaechek .. " Quadratpixel", 400, 400)
  love.graphics.triangle("fill", xd, yd, xd - 100, yd - 100, xd + 20, yd - 100)
  --love.graphics.print("Der Umfang meines Dreiecks beträgt " .. umfangd .. " Pixel!", 400, 300)
  --love.graphics.print("Der Flächeninhalt beträgt " .. flaeched .. " Quadratpixel", 400, 400)
end