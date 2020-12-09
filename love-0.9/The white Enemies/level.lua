module(...,package.seeall)

--Modul by Daniel Albert
--In diesem Modul wird das Level gezeichnet, die Steuerung das Spielers geregelt, auf evt. Kollisionen geachtet und die Variablen des Spielers gespeichert


--anderes modul
local charackterZeichung = require 'charackterZeichnung'

--Variablendekleration
local tree, rock, frame, sand, kaktus, desert, desertToplains, plains, plainsToDesert, backDesert, backPlains, backDesertToPlains, backPlainsToDesert, spieler, lvl1, bewegungen, nervBewegung, sonstiges, back

 function level.load()
  spieler={
    x=0;
    y=0;
    ebene=0;
    sprung = false;
    fall = false;
    leben = 100;
    angriff = false;
    angriffX = 0;
    angriffY = 0;
    geld = 0;
    geldVorher = 0;
    animation = "stehen";
    richtung = "rechts";
    angriffTimer = 0;
    schwert = 0;
  }

  bewegungen = {
    sprungTimer = 0,
    kollisionstest = false,
    backupX = spieler.x,
    backupY = spieler.y,
    backupEbene = spieler.ebene,
	}

 nervBewegung = {
    
	}

 sonstiges = {
    supernerv = false;
    momentanesLevel = {};
    levelZahl = 1;
    animationTimer = 0;
	}
  local zeile = 1
  if menu.gibVariable(4) == 1 then
    for line in love.filesystem.lines("profile/profil_1_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  elseif menu.gibVariable(4) == 2 then
    for line in love.filesystem.lines("profile/profil_2_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  elseif menu.gibVariable(4) == 3 then
    for line in love.filesystem.lines("profile/profil_3_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  end
end

function level.draw()
	--hintergrund
	love.graphics.setColor(255,255,255)
	if back == "plains" then
		for i = 1,5,1 do
			love.graphics.draw(backPlains,i*1000-1500+spieler.x,0)
		end
		for i = 1,60,1 do
			love.graphics.draw(plains,i*64-900+spieler.x,295)
			love.graphics.draw(plains,i*64-900+spieler.x,359)
			love.graphics.draw(plains,i*64-900+spieler.x,423)
			love.graphics.draw(plains,i*64-900+spieler.x,487)
			love.graphics.draw(plains,i*64-900+spieler.x,551)
			love.graphics.draw(plains,i*64-900+spieler.x,615)
			love.graphics.draw(plains,i*64-900+spieler.x,679)
			love.graphics.draw(plains,i*64-900+spieler.x,743)
		end
	elseif back == "desert" then
		for i = 1,5,1 do
			love.graphics.draw(backDesert,i*1000-1500+spieler.x,0)
		end
		for i = 1,60,1 do
			love.graphics.draw(desert,i*64-900+spieler.x,295)
			love.graphics.draw(desert,i*64-900+spieler.x,359)
			love.graphics.draw(desert,i*64-900+spieler.x,423)
			love.graphics.draw(desert,i*64-900+spieler.x,487)
			love.graphics.draw(desert,i*64-900+spieler.x,551)
			love.graphics.draw(desert,i*64-900+spieler.x,615)
			love.graphics.draw(desert,i*64-900+spieler.x,679)
			love.graphics.draw(desert,i*64-900+spieler.x,743)
		end
	end
	--anzeigen
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", 100, 100, 250, 50)
  love.graphics.print(spieler.geld, 500, 100)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", 100, 100, spieler.leben*2.5, 50)
	--schwertzeichnung
	if spieler.richtung == "rechts" then
		schwerter.drawSchwert(spieler.schwert, spieler.ebene+spieler.y)
	else
		schwerter.drawSchwert(-spieler.schwert, spieler.ebene+spieler.y)
	end
	--spielerzeichnung
	love.graphics.setColor(255,255,255)
	charackterZeichnung.draw(400,spieler.y+spieler.ebene+300)
	--hindernissezeichnung
	for i,v in ipairs (sonstiges.momentanesLevel) do
		love.graphics.setColor(255,255,255)
		love.graphics.draw(v.bild,v.x+spieler.x,v.y,0,v.b/50,v.h/50)
		if gibtKollision(v.x+spieler.x,v.y,v.h,v.b,375,spieler.y+spieler.ebene+200,50,200) then
			if spieler.ebene+400 > v.y+v.b then
				love.graphics.setColor(255,255,255)
				charackterZeichnung.draw(400,spieler.y+spieler.ebene+300)
			end
		end
	end
end

function level.update(dt)
  --Regeneration
  if spieler.leben < 100 then
    spieler.leben=spieler.leben+dt
  end
  --Geld Speichern
  if spieler.geld ~= spieler.geldVorher then
    spieler.geldVorher = spieler.geld
    local zeile = 1
    local auswahl = 0
    if menu.gibVariable(4) == 1 then
      for line in love.filesystem.lines("profile/profil_1_coinsUndAuswahl.txt") do
        if zeile == 1 then
          auswahl = tonumber(line)
        end
        zeile=zeile+1
      end
      love.filesystem.write("profile/profil_1_coinsUndAuswahl.txt",auswahl.."\n"..spieler.geld)
    elseif menu.gibVariable(4) == 2 then
      for line in love.filesystem.lines("profile/profil_2_coinsUndAuswahl.txt") do
        if zeile == 1 then
          auswahl = tonumber(line)
        end
        zeile=zeile+1
      end
      love.filesystem.write("profile/profil_2_coinsUndAuswahl.txt",auswahl.."\n"..spieler.geld)
    elseif menu.gibVariable(4) == 3 then
      for line in love.filesystem.lines("profile/profil_3_coinsUndAuswahl.txt") do
        if zeile == 1 then
          auswahl = tonumber(line)
        end
        zeile=zeile+1
      end
      love.filesystem.write("profile/profil_3_coinsUndAuswahl.txt",auswahl.."\n"..spieler.geld)
    end
  end
	--Laufen
	if not spieler.angriff then
	if love.keyboard.isDown("d") and spieler.x-200*dt > -2000 then
		for i,v in ipairs (sonstiges.momentanesLevel) do
			if v.z == "solid" then
				if gibtKollision(375,spieler.y+spieler.ebene+375,50,50,v.x+spieler.x-200*dt,v.y+v.h-25,v.b,50) then
					bewegungen.kollisionstest = true
				end
			end
		end
		if not bewegungen.kollisionstest then
			spieler.x= spieler.x-200*dt
		else
			bewegungen.kollisionstest = false
		end
	end
	if love.keyboard.isDown("a") and spieler.x+200*dt < 500 then
		for i,v in ipairs (sonstiges.momentanesLevel) do
			if v.z == "solid" then
				if gibtKollision(375,spieler.y+spieler.ebene+375,50,50,v.x+spieler.x+200*dt,v.y+v.h-25,v.b,50) then
					bewegungen.kollisionstest = true
				end
			end
		end
		if not bewegungen.kollisionstest then
			spieler.x= spieler.x+200*dt
		else
			bewegungen.kollisionstest = false
		end
	end
	if love.keyboard.isDown("s") and spieler.ebene +100*dt < 400 then
		for i,v in ipairs (sonstiges.momentanesLevel) do
			if v.z == "solid" then
				if gibtKollision(375,spieler.y+spieler.ebene+375+100*dt,50,50,v.x+spieler.x,v.y+v.h-25,v.b,50) then
					bewegungen.kollisionstest = true
				end
			end
		end
		if not bewegungen.kollisionstest then
			spieler.ebene=spieler.ebene+100*dt
		else
			bewegungen.kollisionstest = false
		end
	end
	if love.keyboard.isDown("w") and spieler.ebene -100*dt > -100 then
		for i,v in ipairs (sonstiges.momentanesLevel) do
			if v.z == "solid" then
				if gibtKollision(375,spieler.y+spieler.ebene+375-100*dt,50,50,v.x+spieler.x,v.y+v.h-25,v.b,50) then
					bewegungen.kollisionstest = true
				end
			end
		end
		if not bewegungen.kollisionstest then
			spieler.ebene=spieler.ebene-100*dt
		else
			bewegungen.kollisionstest = false
		end
	end
	end
	
	--Springen
	if spieler.fall then
		if spieler.y < 0 then
			spieler.y = spieler.y + dt*400
		elseif spieler.y >= 0 then
			spieler.y = 0
			spieler.fall = false
			for i,v in ipairs (sonstiges.momentanesLevel) do
				if v.z == "solid" then
					if gibtKollision(375,spieler.y+spieler.ebene+375,50,50,v.x+spieler.x,v.y+v.h-25,v.b,50) then
						spieler.x = bewegungen.backupX
						spieler.y = bewegungen.backupY
						spieler.ebene = bewegungen.backupEbene
					end
				end
			end
		end
	end
	if spieler.sprung then
		bewegungen.sprungTimer = bewegungen.sprungTimer + dt
		spieler.y = spieler.y - 400*dt
		if bewegungen.sprungTimer > 1 then
			spieler.sprung = false
			spieler.fall = true
			bewegungen.sprungTimer = 0
		end
	end
	--Animation
	if love.keyboard.isDown("d") or love.keyboard.isDown("a") or love.keyboard.isDown("s") or love.keyboard.isDown("w") then
		if not spieler.sprung and not spieler.fall then
			spieler.animation = "gehen"
		else
			spieler.animation = "stehen"
		end
	else
		spieler.animation = "stehen"
	end
	charackterZeichnung.ini()
	charackterZeichnung.setzeVariable(1,1)
	if spieler.richtung == "links" then
		charackterZeichnung.setzeVariable(2,"L")
	else
		charackterZeichnung.setzeVariable(2,"R")
	end
	if spieler.animation == "stehen" then
		charackterZeichnung.setzeVariable(0,1)
	else
		sonstiges.animationTimer = sonstiges.animationTimer+dt
		if sonstiges.animationTimer < 0.2 then
			charackterZeichnung.setzeVariable(0,1)
		elseif sonstiges.animationTimer < 0.4 then
			charackterZeichnung.setzeVariable(0,2)
		elseif sonstiges.animationTimer < 0.6 then
			charackterZeichnung.setzeVariable(0,3)
		elseif sonstiges.animationTimer < 0.8 then
			charackterZeichnung.setzeVariable(0,4)
		else
			sonstiges.animationTimer = 0
		end
	end
	--Angriff
	if spieler.angriff then
		spieler.angriffTimer = spieler.angriffTimer+dt
		spieler.schwert = spieler.schwert+spieler.angriffTimer*100
		if spieler.angriffTimer >= 0.3 then
			spieler.angriff = false
			spieler.angriffTimer = 0
			spieler.schwert = 0
		end
	end
end

function level.keypressed(key)
	if key == " " and not spieler.sprung and not spieler.fall and not spieler.angriff then
		spieler.sprung = true
		bewegungen.backupX = spieler.x
		bewegungen.backupY = spieler.y
		bewegungen.backupEbene = spieler.ebene
	end
	--animation
	if key == "a" then
		spieler.richtung = "links"
	end
	if key == "d" then
		spieler.richtung = "rechts"
	end
end

function level.mouse(button)
	if button == "l" then
		if not spieler.sprung and not spieler.fall and not spieler.angriff then
			spieler.angriff = true
			spieler.angriffY = spieler.ebene+25
			if spieler.richtung == "rechts" then
				spieler.angriffX = spieler.x+50
			else
				spieler.angriffX = spieler.x-50
			end
		end
	end
end

function gibtKollision(x1,y1,b1,h1,x2,y2,b2,h2)
  if  x1 + b1   >=  x2      and
      x1        <   x2 + b2 and
      y1 + h1   >=  y2      and
      y1        <   y2 + h2
  then
      return true
  else
      return false
  end
end

function gibY()
	return spieler.ebene
end

function gibScrollenX()
	return spieler.x
end

function gibHindernisse()
	return sonstiges.momentanesLevel
end

function aenderLeben(aenderung)
	spieler.leben = spieler.leben+aenderung
  return spieler.leben
end

function gibAngriff()
	return spieler.angriff
end

function Geld(aenderung)
	spieler.geld = spieler.geld+aenderung
	return spieler.geld
end

function reset()
	spieler={
	x=0;
	y=0;
	ebene=0;
	sprung = false;
	fall = false;
	leben = 100;
	angriff = false;
	angriffX = 0;
	angriffY = 0;
	animation = "stehen";
	richtung = "rechts";
	geld = 0;
	geldVorher = 0;
  angriffTimer = 0;
  schwert = 0;
  }
  sonstiges = {
    supernerv = false;
    momentanesLevel = {};
    levelZahl = 1;
    animationTimer = 0;
	}
  local zeile = 1
  if menu.gibVariable(4) == 1 then
    for line in love.filesystem.lines("profile/profil_1_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  elseif menu.gibVariable(4) == 2 then
    for line in love.filesystem.lines("profile/profil_2_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  elseif menu.gibVariable(4) == 3 then
    for line in love.filesystem.lines("profile/profil_3_coinsUndAuswahl.txt") do
      if zeile == 2 then
        spieler.geld = tonumber(line)
        spieler.geldVorher = tonumber(line)
      end
      zeile=zeile+1
    end
  end
end

function gibNerv(nervModus)
	sonstiges.supernerv = nervModus
end

function gibLevel(biom,schwierigkeit)
	generiereLevel(schwierigkeit,biom)
	back = biom
end

function level.bilderIni(nummer,bild)
	if nummer == 1 then
		tree = bild
	elseif nummer == 2 then
		rock = bild
	elseif nummer == 3 then
		frame = bild
	elseif nummer == 4 then
		sand = bild
	elseif nummer == 5 then
		kaktus = bild
	elseif nummer == 6 then
		desert = bild
	elseif nummer == 7 then
		desertToPlains = bild
	elseif nummer == 8 then
		plains = bild
	elseif nummer == 9 then
		plainsToDesert = bild
	elseif nummer == 10 then
		backDesert = bild
	elseif nummer == 11 then
		backPlains = bild
	elseif nummer == 12 then
		backDesertToPlains = bild
	elseif nummer == 13 then
		backPlainsToDesert = bild
	end
end

function generiereLevel(schwierigkeit,biom)
	local objektcounter = 20
	local zufaellig = 0
	momentanesLevel = {}
	for p = 1,objektcounter,1 do
		local einObjekt
		if biom == "plains" then
			zufaellig = math.random(0,3)
			if zufaellig <= 1 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = tree ;
					}
			elseif zufaellig <= 2 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = rock ;
					}
			elseif zufaellig <= 3 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = frame ;
					}
			end
		elseif biom == "desert" then
			zufaellig = math.random(0,3)
			if zufaellig <= 1 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = kaktus ;
					}
			elseif zufaellig <= 2 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = sand ;
					}
			elseif zufaellig <= 3 then
				einObjekt = {
					x = math.random(2500/objektcounter*p-500,2500/objektcounter*p-500+2500/objektcounter*p);
					y = math.random(325,700);
					b = math.random(25,100);
					h = math.random(25,100);
					z = "solid";
					bild = frame ;
					}
			end
		end
		table.insert(sonstiges.momentanesLevel,einObjekt)
	end
end