--Autor D.K.

module(..., package.seeall)

local bilderG, timer, gegnerAll, kugelnAll
local level = require "level"
local charackterZeichnung = require "charackterZeichnung"
local schwerter = require "schwerter"

function gegner.keypressed(key)
  if key == "q" then
    for i,v in ipairs (gegnerAll) do
      v.leben=0
    end
  end
end

function gegner.load()
  bilderG={
    mon1={
    };
    mon2={
    };
    mon3={
    };
    cat1={
    };
    cat2={
    };
    cat3={
    };
    
  }
  gegnerAll={}
  kugelnAll={}
  timer=0
  schwierigkeit=0
end

function gegner.bilderIni(nummer, bild)
  if nummer == 1 then
    bilderG.mon1.walk1=bild
  elseif nummer == 2 then
    bilderG.mon1.walk2=bild
  elseif nummer == 3 then
    bilderG.mon1.walk3=bild
  elseif nummer == 4 then
    bilderG.mon1.walk4=bild
  elseif nummer == 5 then
    bilderG.mon1.walk5=bild
  elseif nummer == 6 then
    bilderG.mon1.attack1=bild
  elseif nummer == 7 then
    bilderG.mon1.attack2=bild
  elseif nummer == 8 then
    bilderG.mon1.attack3=bild
  elseif nummer == 9 then
    bilderG.mon1.attack4=bild
  elseif nummer == 10 then
    bilderG.mon1.attack5=bild
  elseif nummer == 11 then
    bilderG.mon1.attack6=bild
  elseif nummer == 12 then
    bilderG.mon1.attack7=bild
  elseif nummer == 13 then
    bilderG.mon1.die1=bild
  elseif nummer == 14 then
    bilderG.mon1.die2=bild
  elseif nummer == 15 then
    bilderG.mon1.die3=bild
  elseif nummer == 16 then
    bilderG.mon1.die4=bild
  elseif nummer == 17 then
    bilderG.mon1.die5=bild
  elseif nummer == 18 then
    bilderG.mon1.die6=bild
  elseif nummer == 19 then
    bilderG.mon1.die7=bild
  elseif nummer == 20 then
    bilderG.mon1.die8=bild
  elseif nummer == 21 then
    bilderG.mon1.die9=bild
  elseif nummer == 22 then
    bilderG.mon2.attack1=bild
  elseif nummer == 23 then
    bilderG.mon2.attack2=bild
  elseif nummer == 24 then
    bilderG.mon2.attack3=bild
  elseif nummer == 25 then
    bilderG.mon2.attack4=bild
  elseif nummer == 26 then
    bilderG.mon2.walk1=bild
  elseif nummer == 27 then
    bilderG.mon2.walk2=bild
  elseif nummer == 28 then
    bilderG.mon2.walk3=bild
  elseif nummer == 29 then
    bilderG.mon2.walk4=bild
  elseif nummer == 30 then
    bilderG.mon2.die1=bild
  elseif nummer == 31 then
    bilderG.mon2.die2=bild
  elseif nummer == 32 then
    bilderG.mon2.die3=bild
  elseif nummer == 33 then
    bilderG.mon2.die4=bild
  elseif nummer == 34 then
    bilderG.mon2.die5=bild
  elseif nummer == 35 then
    bilderG.mon2.die6=bild
  elseif nummer == 36 then
    bilderG.mon2.die7=bild
  elseif nummer == 37 then
    bilderG.mon2.die8=bild
  elseif nummer == 38 then
    bilderG.mon2.die9=bild
  elseif nummer == 39 then
    bilderG.mon3.attack1=bild
  elseif nummer == 40 then
    bilderG.mon3.attack2=bild
  elseif nummer == 41 then
    bilderG.mon3.attack3=bild
  elseif nummer == 42 then
    bilderG.mon3.attack4=bild
  elseif nummer == 43 then
    bilderG.mon3.attack5=bild
  elseif nummer == 44 then
    bilderG.mon3.idle1=bild
  elseif nummer == 45 then
    bilderG.mon3.idle2=bild
  elseif nummer == 46 then
    bilderG.mon3.idle3=bild
  elseif nummer == 47 then
    bilderG.mon3.idle4=bild
  elseif nummer == 48 then
    bilderG.mon3.idle5=bild
  elseif nummer == 49 then
    bilderG.mon3.die1=bild
  elseif nummer == 50 then
    bilderG.mon3.die2=bild
  elseif nummer == 51 then
    bilderG.mon3.die3=bild
  elseif nummer == 52 then
    bilderG.mon3.die4=bild
  elseif nummer == 53 then
    bilderG.mon3.die5=bild
  elseif nummer == 54 then
    bilderG.mon3.die6=bild
  elseif nummer == 55 then
    bilderG.mon3.die7=bild
  elseif nummer == 56 then
    bilderG.mon3.die8=bild
  elseif nummer == 57 then
    bilderG.mon3.die9=bild
  elseif nummer == 58 then
    bilderG.mon3.die10=bild
  elseif nummer == 59 then
    bilderG.cat1.walk1=bild
  elseif nummer == 60 then
    bilderG.cat1.walk2=bild
  elseif nummer == 61 then
    bilderG.cat1.walk3=bild
  elseif nummer == 62 then
    bilderG.cat1.walk4=bild
  elseif nummer == 63 then
    bilderG.cat1.die1=bild
  elseif nummer == 64 then
    bilderG.cat1.die2=bild
  elseif nummer == 65 then
    bilderG.cat1.die3=bild
  elseif nummer == 66 then
    bilderG.cat1.die4=bild
  elseif nummer == 67 then
    bilderG.cat1.die5=bild
  elseif nummer == 68 then
    bilderG.cat1.die6=bild
  elseif nummer == 69 then
    bilderG.cat1.die7=bild
  elseif nummer == 70 then
    bilderG.cat1.attack11=bild
  elseif nummer == 71 then
    bilderG.cat1.attack12=bild
  elseif nummer == 72 then
    bilderG.cat1.attack13=bild
  elseif nummer == 73 then
    bilderG.cat1.attack14=bild
  elseif nummer == 74 then
    bilderG.cat1.attack15=bild
  elseif nummer == 75 then
    bilderG.cat1.attack16=bild
  elseif nummer == 76 then
    bilderG.cat1.attack17=bild
  elseif nummer == 77 then
    bilderG.cat1.attack18=bild
  elseif nummer == 78 then
    bilderG.cat1.attack19=bild
  elseif nummer == 79 then
    bilderG.cat1.attack110=bild
  elseif nummer == 80 then
    bilderG.cat1.attack111=bild
  elseif nummer == 81 then
    bilderG.cat1.attack112=bild
  elseif nummer == 82 then
    bilderG.cat1.attack21=bild
  elseif nummer == 83 then
    bilderG.cat1.attack22=bild
  elseif nummer == 84 then
    bilderG.cat1.attack23=bild
  elseif nummer == 85 then
    bilderG.cat1.attack24=bild
  elseif nummer == 86 then
    bilderG.cat1.attack25=bild
  elseif nummer == 87 then
    bilderG.cat1.attack26=bild
  elseif nummer == 88 then
    bilderG.cat1.attack27=bild
  elseif nummer == 89 then
    bilderG.cat1.attack28=bild
  elseif nummer == 90 then
    bilderG.cat2.walk1=bild
  elseif nummer == 91 then
    bilderG.cat2.walk2=bild
  elseif nummer == 92 then
    bilderG.cat2.walk3=bild
  elseif nummer == 93 then
    bilderG.cat2.walk4=bild
  elseif nummer == 94 then
    bilderG.cat2.walk5=bild
  elseif nummer == 95 then
    bilderG.cat2.walk6=bild
  elseif nummer == 96 then
    bilderG.cat2.walk7=bild
  elseif nummer == 97 then
    bilderG.cat2.walk8=bild
  elseif nummer == 98 then
    bilderG.cat2.attack1=bild
  elseif nummer == 99 then
    bilderG.cat2.attack2=bild
  elseif nummer == 100 then
    bilderG.cat2.attack3=bild
  elseif nummer == 101 then
    bilderG.cat2.attack4=bild
  elseif nummer == 102 then
    bilderG.cat2.die1=bild
  elseif nummer == 103 then
    bilderG.cat2.die2=bild
  elseif nummer == 104 then
    bilderG.cat2.die3=bild
  elseif nummer == 105 then
    bilderG.cat2.die4=bild
  elseif nummer == 106 then
    bilderG.cat2.die5=bild
  elseif nummer == 107 then
    bilderG.cat3.attack11=bild
  elseif nummer == 108 then
    bilderG.cat3.attack12=bild
  elseif nummer == 109 then
    bilderG.cat3.attack13=bild
  elseif nummer == 110 then
    bilderG.cat3.attack14=bild
  elseif nummer == 111 then
    bilderG.cat3.attack15=bild
  elseif nummer == 112 then
    bilderG.cat3.attack16=bild
  elseif nummer == 113 then
    bilderG.cat3.attack17=bild
  elseif nummer == 114 then
    bilderG.cat3.attack18=bild
  elseif nummer == 115 then
    bilderG.cat3.attack19=bild
  elseif nummer == 116 then
    bilderG.cat3.attack110=bild
  elseif nummer == 117 then
    bilderG.cat3.attack111=bild
  elseif nummer == 118 then
    bilderG.cat3.attack112=bild
  elseif nummer == 119 then
    bilderG.cat3.attack113=bild
  elseif nummer == 120 then
    bilderG.cat3.attack114=bild
  elseif nummer == 121 then
    bilderG.cat3.attack115=bild
  elseif nummer == 122 then
    bilderG.cat3.attack116=bild
  elseif nummer == 123 then
    bilderG.cat3.attack117=bild
  elseif nummer == 124 then
    bilderG.cat3.attack118=bild
  elseif nummer == 125 then
    bilderG.cat3.attack119=bild
  elseif nummer == 126 then
    bilderG.cat3.attack21=bild
  elseif nummer == 127 then
    bilderG.cat3.attack22=bild
  elseif nummer == 128 then
    bilderG.cat3.attack23=bild
  elseif nummer == 129 then
    bilderG.cat3.attack24=bild
  elseif nummer == 130 then
    bilderG.cat3.attack25=bild
  elseif nummer == 131 then
    bilderG.cat3.attack26=bild
  elseif nummer == 132 then
    bilderG.cat3.attack27=bild
  elseif nummer == 133 then
    bilderG.cat3.attack28=bild
  elseif nummer == 134 then
    bilderG.cat3.attack29=bild
  elseif nummer == 135 then
    bilderG.cat3.attack210=bild
  elseif nummer == 136 then
    bilderG.cat3.attack211=bild
  elseif nummer == 137 then
    bilderG.cat3.attack212=bild
  elseif nummer == 138 then
    bilderG.cat3.attack213=bild
  elseif nummer == 139 then
    bilderG.cat3.attack214=bild
  elseif nummer == 140 then
    bilderG.cat3.attack215=bild
  elseif nummer == 141 then
    bilderG.mon1.idle1=bild
  elseif nummer == 142 then
    bilderG.mon1.idle2=bild
  elseif nummer == 143 then
    bilderG.mon1.idle3=bild
  elseif nummer == 144 then
    bilderG.mon1.idle4=bild
  elseif nummer == 145 then
    bilderG.mon2.idle1=bild
  elseif nummer == 146 then
    bilderG.mon2.idle2=bild
  elseif nummer == 147 then
    bilderG.mon2.idle3=bild
  elseif nummer == 148 then
    bilderG.mon2.idle4=bild
  elseif nummer == 149 then
    bilderG.mon3.idle1=bild
  elseif nummer == 150 then
    bilderG.mon3.idle2=bild
  elseif nummer == 151 then
    bilderG.mon3.idle3=bild
  elseif nummer == 152 then
    bilderG.mon3.idle4=bild
  elseif nummer == 153 then
    bilderG.mon3.idle5=bild
  elseif nummer == 154 then
    bilderG.cat1.idle1=bild
  elseif nummer == 155 then
    bilderG.cat1.idle2=bild
  elseif nummer == 156 then
    bilderG.cat1.idle3=bild
  elseif nummer == 157 then
    bilderG.cat1.idle4=bild
  elseif nummer == 158 then
    bilderG.cat2.idle1=bild
  elseif nummer == 159 then
    bilderG.cat2.idle2=bild
  elseif nummer == 160 then
    bilderG.cat2.idle3=bild
  elseif nummer == 161 then
    bilderG.cat2.idle4=bild
  end
end

function gegner.draw()
  for i,v in ipairs (kugelnAll) do
    love.graphics.rectangle("fill", v.x+level.gibScrollenX(), v.y, 5, 5)
  end
  for i,v in ipairs (gegnerAll) do
    if v.typ == 1 then
      drawMon1(v.x+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung)
    elseif v.typ == 2 then
      drawMon2(v.x+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung)
    elseif v.typ == 3 then
      drawMon3(v.x+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung)
    elseif v.typ == 4 then
      drawCat1(v.x+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung, v.angriffTyp)
    elseif v.typ == 5 then
      drawCat2(v.x+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung)
    elseif v.typ == 6 then
      drawCat3(v.x-50+level.gibScrollenX(), v.y, v.richtung, v.animation, v.bewegung, v.angriffTyp)
    end
  end
end

function gegner.update(dt)
  timer=timer+dt
  spawnGegner(schwierigkeit)
  animation()
  ki(dt)
  for i,v in ipairs (kugelnAll) do
    if v.richtung == 1 then
      v.x=v.x-500*dt
    elseif v.richtung == 2 then
      v.x=v.x+500*dt
    end
    if generKollidiertMitSpieler(v.x, v.y, 5, 5) then
      table.remove(kugelnAll, i)
    end
  end
  for i,v in ipairs (gegnerAll) do
    if level.gibAngriff() then
      if charackterZeichnung.gibVariable(2) == "R" then
        if 420+75 >= v.x+level.gibScrollenX()-50 and 420 < v.x+level.gibScrollenX()+50 and level.gibY()+390 >= v.y-75 and level.gibY()+210 < v.y+75 then
          v.leben=v.leben-schwerter.ausgewaehltDmg()
        end
      elseif charackterZeichnung.gibVariable(2) == "L" then
        if 375+75 >= v.x+level.gibScrollenX()-50 and 375 < v.x+level.gibScrollenX()+50 and level.gibY()+390 >= v.y-75 and level.gibY()+210 < v.y+75 then
          v.leben=v.leben-schwerter.ausgewaehltDmg()
        end
      end
    end
    if v.bewegung == "angriff" then
      level.aenderLeben(-v.schaden)
    end
    if v.leben <= 0 then
      level.Geld(v.dropCoins)
      if v.dropSchwertBild ~= 0 then
        schwerter.neuesSchwert(v.dropSchwertBild, v.dropSchwertDmg)
      end
      table.remove(gegnerAll, i)
    end
    if v.bewegung=="gehen" then
      if v.x >= v.gehenX - 5 and v.x <= v.gehenX + 5 and v.y >= v.gehenY - 5 and v.y <= v.gehenY + 5 then
        v.bewegung = "stehen"
      else
        local xBewegung, yBewegung = gibBewegungVonNach(v.x,v.y,v.gehenX,v.gehenY,50,dt)
        v.x=xBewegung
        v.y=yBewegung
      end
    end
  end
end

function gegner.spawnGegner(level)
  while #gegnerAll ~= 10 do
    local temp={
      x=math.random(-500, 2000);
      y=math.random(300, 800);
      typ=math.random(1,6);
      richtung=math.random(1, 2);
      animation=1;
      bewegung="stehen";
      tAni=timer;
      tKi=timer+math.random(0, 5);
      leben=100;
      angriffTyp=math.random(1,2);
      timerK=timer;
      gehenX=0;
      gehenY=0;
      dropCoins=0;
      dropSchwertBild=0;
      dropSchwertDmg=0;
      schaden=0;
    }
    local dropSchwert = math.random(1, 10)
    leben = math.random(50*level, 50*level+50)
    temp.dropCoins=math.random(0, 5*level+5)
    temp.schaden=1
    if dropSchwert == 1 then
      temp.dropSchwertBild=math.random(1, 9)
      temp.dropSchwertDmg=math.random(1, 50*level+25)
    end
    table.insert(gegnerAll, temp)
  end
end

function gegner.spawnKugel(x, y, richtung)
  local temp={
    x=x;
    y=y;
    richtung=richtung;
  }
  table.insert(kugelnAll, temp)
end

function gegner.ki(dt)
  for i,v in ipairs (gegnerAll) do
    if gibAbstandZumSpieler(v.x+level.gibScrollenX(), v.y) <= 600 then
      if level.gibScrollenX()/-1+400 <= v.x then
        v.richtung=2
      else
        v.richtung=1
      end
      if v.typ == 1 then
        if not generKollidiertMitSpieler(v.x-37.5+level.gibScrollenX(), v.y-62.5, 75, 87.5) or level.gibY()+365+10 <= v.y or level.gibY()+365-10 >= v.y then
          v.bewegung="gehen"
          if v.richtung==2 then
            v.gehenX=430-level.gibScrollenX()+bilderG.mon1.walk1:getWidth()/2
          else
            v.gehenX=430-level.gibScrollenX()-bilderG.mon1.walk1:getWidth()/2
          end
          v.gehenY=level.gibY()+365
        else
          v.bewegung="angriff"
        end
      elseif v.typ == 2 then
        if not generKollidiertMitSpieler(v.x-25+level.gibScrollenX(), v.y-120, 75, 125) or level.gibY()+380+10 <= v.y or level.gibY()+380-10 >= v.y then
          v.bewegung="gehen"
          if v.richtung==2 then
            v.gehenX=410-level.gibScrollenX()+bilderG.mon2.walk1:getWidth()/2
          else
            v.gehenX=415-level.gibScrollenX()-bilderG.mon2.walk1:getWidth()/2
          end
          v.gehenY=level.gibY()+380
        else
          v.bewegung="angriff"
        end
      elseif v.typ == 3 then
        if not generKollidiertMitSpieler(v.x-50+level.gibScrollenX(), v.y-285, 100, 100) or level.gibY()+450+10 <= v.y or level.gibY()+450-10 >= v.y then
          v.bewegung="gehen"
          if v.richtung==2 then
            v.gehenX=435-level.gibScrollenX()+bilderG.mon3.idle1:getWidth()/2
          else
            v.gehenX=435-level.gibScrollenX()-bilderG.mon3.idle1:getWidth()/2
          end
            v.gehenY=level.gibY()+450
        else
          v.bewegung="angriff"
        end
      elseif v.typ == 4 then
        if not generKollidiertMitSpieler(v.x-25+level.gibScrollenX(), v.y-62.5, 62.5, 87.5) or level.gibY()+360+10 <= v.y or level.gibY()+360-10 >= v.y then
          v.bewegung="gehen"
          if v.richtung==2 then
            v.gehenX=415-level.gibScrollenX()+bilderG.cat1.walk1:getWidth()/2
          else
            v.gehenX=415-level.gibScrollenX()-bilderG.cat1.walk1:getWidth()/2
          end
          v.gehenY=level.gibY()+360
        else
          v.bewegung="angriff"
        end
      elseif v.typ == 5 then
        if v.richtung==2 then
          if not generKollidiertMitSpieler(v.x-200+level.gibScrollenX(), v.y-62.5, 62.5, 87.5) or level.gibY()+360+10 <= v.y or level.gibY()+360-10 >= v.y then
            v.bewegung="gehen"
            v.gehenX=590-level.gibScrollenX()+bilderG.cat2.walk1:getWidth()/2
            v.gehenY=level.gibY()+360
          else
            v.bewegung="angriff"
            if v.timerK <= timer then
              spawnKugel(v.x, v.y-25, 1)
              v.timerK=timer+0.2
            end
          end
        elseif v.richtung == 1 then
          if not generKollidiertMitSpieler(v.x+175+level.gibScrollenX(), v.y-62.5, 62.5, 87.5) or level.gibY()+360+10 <= v.y or level.gibY()+360-10 >= v.y then
            v.bewegung="gehen"
            v.gehenX=500-level.gibScrollenX()-bilderG.cat2.walk1:getWidth()/2
            v.gehenY=level.gibY()+360
          else
            v.bewegung="angriff"
            if v.timerK <= timer then
              spawnKugel(v.x, v.y-25, 2)
              v.timerK=timer+0.2
            end
          end
        end
      elseif v.typ == 6 then
        if v.richtung == 2 then
          if not generKollidiertMitSpieler(v.x-150+level.gibScrollenX(), v.y-62.5, 62.5, 87.5) or level.gibY()+360+10 <= v.y or level.gibY()+360-10 >= v.y then
            v.bewegung="gehen"
            v.gehenX=540-level.gibScrollenX()+bilderG.cat1.walk1:getWidth()/2
            v.gehenY=level.gibY()+360
          else
            v.bewegung="angriff"
          end
        elseif v.richtung == 1 then
          if not generKollidiertMitSpieler(v.x+175+level.gibScrollenX(), v.y-62.5, 62.5, 87.5) or level.gibY()+360+10 <= v.y or level.gibY()+360-10 >= v.y then
            v.bewegung="gehen"
            v.gehenX=590-level.gibScrollenX()-bilderG.cat1.walk1:getWidth()/2
            v.gehenY=level.gibY()+360
          else
            v.bewegung="angriff"
          end
        end
      end
    else
      if v.tKi <= timer and v.bewegung ~= "gehen" then
        local kiZahl = math.random(1,6)
        if kiZahl == 1 then
          v.bewegung="stehen"
          v.richtung=1
        elseif kiZahl == 2 then
          v.bewegung="stehen"
          v.richtung=2
        elseif kiZahl == 3 then
          v.bewegung="gehen"
          v.richtung=2
          v.gehenX=math.random(-500, v.x)
          v.gehenY=v.y
        elseif kiZahl == 4 then
          v.bewegung="gehen"
          v.richtung=1
          v.gehenX=math.random(v.x, 2000)
          v.gehenY=v.y
        elseif kiZahl == 5 then
          v.bewegung="gehen"
          v.gehenY=math.random(v.y, 800)
          v.gehenX=v.x
          v.richtung=math.random(1, 2)
        elseif kiZahl == 6 then
          v.bewegung="gehen"
          v.gehenY=math.random(300, v.y)
          v.gehenX=v.x
          v.richtung=math.random(1, 2)
        end
        v.tKi=timer+math.random(0, 5)
      end
    end
  end
end

function gegner.gibBewegungVonNach(x1,y1,x2,y2,geschwindigkeit,dt)
	local xBewegung = 0
	local yBewegung = 1
  if x2-x1 ~= 0 then
    local m = (y1 - y2)/(x2 - x1)
    xBewegung = 1 / math.sqrt(1+m^2)
    yBewegung = math.sqrt(1 - xBewegung^2)
  end
  if x1 > x2 then
    xBewegung = xBewegung * -1
  end
  if y1 > y2 then
    yBewegung = yBewegung * -1
  end
  return x1+xBewegung*geschwindigkeit*dt, y1+yBewegung*geschwindigkeit*dt
end

function gegner.generKollidiertMitSpieler(x1, y1, b1, h1)
  if x1 + b1 >= 375 and x1 < 375 + 50 and y1 + h1 >= level.gibY()+210 and y1 < level.gibY()+210 + 180 then
    return true
  else
    return false
  end
end
function gegner.gibAbstandZumSpieler(x1, y1)
  return math.sqrt((400-x1)^2+(level.gibY()-y1)^2)
end

function gegner.reset()
  for i,v in ipairs(gegnerAll) do 
    table.remove(gegnerAll, i) 
  end
  for i,v in ipairs(kugelnAll) do 
    table.remove(kugelnAll, i) 
  end
  timer=0
end

function gegner.animation()
  for i,v in ipairs (gegnerAll) do
    if v.typ == 1 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 5 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.animation < 7 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 9 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    elseif v.typ == 2 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 9 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    elseif v.typ == 3 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 5 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.animation < 5 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 10 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 5 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    elseif v.typ == 4 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.angriffTyp == 1 then
            if v.animation < 12 then
              v.animation=v.animation+1
            else
              v.animation = 1
              v.angriffTyp=math.random(1,2)
            end
          elseif v.angriffTyp == 2 then
            if v.animation < 8 then
              v.animation=v.animation+1
            else
              v.animation = 1
              v.angriffTyp=math.random(1,2)
            end
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 7 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    elseif v.typ == 5 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 8 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 5 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    elseif v.typ == 6 then
      if timer >= v.tAni+0.1 then
        v.tAni=timer
        if v.bewegung=="gehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        elseif v.bewegung=="angriff" then
          if v.angriffTyp == 1 then
            if v.animation < 19 then
              v.animation=v.animation+1
            else
              v.animation = 1
              v.angriffTyp=math.random(1,2)
            end
          elseif v.angriffTyp == 2 then
            if v.animation < 15 then
              v.animation=v.animation+1
            else
              v.animation = 1
              v.angriffTyp=math.random(1,2)
            end
          end
        elseif v.bewegung=="sterben" then
          if v.animation < 7 then
            v.animation=v.animation+1
          else
            table.remove(gegnerAll,i)
          end
        elseif v.bewegung=="stehen" then
          if v.animation < 4 then
            v.animation=v.animation+1
          else
            v.animation = 1
          end
        end
      end
    end
  end
end

function gegner.drawMon1(x, y, r, a, b)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.walk1, x, y+50, 0, 3, sx, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.walk2, x, y+50, 0, 3, sx, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.walk3, x, y+50, 0, 3, sx, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.walk4, x, y+50, 0, 3, sx, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.walk5, x, y+50, 0, 3, sx, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.attack1, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.attack2, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.attack3, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.attack4, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.attack5, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon1.attack6, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon1.attack7, x, y+50, 0, 3, sx, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.die1, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.die2, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.die3, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.die4, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.die3, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon1.die5, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon1.die7, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon1.die8, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon1.die9, x, y+50, 0, 3, sx, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.idle1, x, y+50, 0, 3, sx, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.idle2, x, y+50, 0, 3, sx, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.idle3, x, y+50, 0, 3, sx, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.idle4, x, y+50, 0, 3, sx, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.walk1, x, y+50, 0, -3, 3, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.walk2, x, y+50, 0, -3, 3, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.walk3, x, y+50, 0, -3, 3, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.walk4, x, y+50, 0, -3, 3, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.walk5, x, y+50, 0, -3, 3, bilderG.mon1.walk1:getWidth()/2, bilderG.mon1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.attack1, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.attack2, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.attack3, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.attack4, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.attack5, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon1.attack6, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon1.attack7, x, y+50, 0, -3, 3, bilderG.mon1.attack1:getWidth()/2, bilderG.mon1.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.die1, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.die2, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.die3, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.die4, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon1.die5, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon1.die6, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon1.die7, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon1.die8, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon1.die9, x, y+50, 0, -3, 3, bilderG.mon1.die1:getWidth()/2, bilderG.mon1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon1.idle1, x, y+50, 0, -3, 3, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon1.idle2, x, y+50, 0, -3, 3, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon1.idle3, x, y+50, 0, -3, 3, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon1.idle4, x, y+50, 0, -3, 3, bilderG.mon1.idle1:getWidth()/2, bilderG.mon1.idle1:getHeight())
      end
    end
  end
end

function gegner.drawMon2(x, y, r, a, b)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.walk1, x, y+13, 0, 3, sx, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.walk2, x, y+13, 0, 3, sx, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.walk3, x, y+13, 0, 3, sx, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.walk4, x, y+13, 0, 3, sx, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.attack1, x, y+13, 0, 3, sx, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.attack2, x, y+13, 0, 3, sx, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.attack3, x, y+13, 0, 3, sx, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.attack4, x, y+13, 0, 3, sx, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.die1, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.die2, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.die3, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.die4, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon2.die5, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon2.die6, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon2.die7, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon2.die8, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon2.die9, x, y+13, 0, 3, sx, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.idle1, x, y+13, 0, 3, sx, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.idle2, x, y+13, 0, 3, sx, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.idle3, x, y+13, 0, 3, sx, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.idle4, x, y+13, 0, 3, sx, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.walk1, x, y+13, 0, -3, 3, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.walk2, x, y+13, 0, -3, 3, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.walk3, x, y+13, 0, -3, 3, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.walk4, x, y+13, 0, -3, 3, bilderG.mon2.walk1:getWidth()/2, bilderG.mon2.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.attack1, x, y+13, 0, -3, 3, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.attack2, x, y+13, 0, -3, 3, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.attack3, x, y+13, 0, -3, 3, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.attack4, x, y+13, 0, -3, 3, bilderG.mon2.attack1:getWidth()/2, bilderG.mon2.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.die1, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.die3, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.die3, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.die4, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon2.die5, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon2.die6, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon2.die7, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon2.die8, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon2.die9, x, y+13, 0, -3, 3, bilderG.mon2.die1:getWidth()/2, bilderG.mon2.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon2.idle1, x, y+13, 0, -3, 3, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon2.idle3, x, y+13, 0, -3, 3, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon2.idle3, x, y+13, 0, -3, 3, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon2.idle4, x, y+13, 0, -3, 3, bilderG.mon2.idle1:getWidth()/2, bilderG.mon2.idle1:getHeight())
      end
    end
  end
end

function gegner.drawMon3(x, y, r, a, b)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.idle1, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.idle2, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.idle3, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.idle4, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.idle5, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.attack1, x, y-150, 0, 3, sx, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.attack2, x, y-150, 0, 3, sx, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.attack3, x, y-150, 0, 3, sx, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.attack4, x, y-150, 0, 3, sx, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.attack5, x, y-150, 0, 3, sx, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.die1, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.die2, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.die3, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.die4, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.die5, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon3.die6, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon3.die7, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon3.die8, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon3.die9, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 10 then
        love.graphics.draw(bilderG.mon3.die10, x, y-150, 0, 3, sx, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.idle1, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.idle2, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.idle3, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.idle4, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.idle5, x, y-150, 0, 3, sx, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.idle1, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.idle2, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.idle3, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.idle4, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.idle5, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.attack1, x, y-150, 0, -3, 3, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.attack2, x, y-150, 0, -3, 3, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.attack3, x, y-150, 0, -3, 3, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.attack4, x, y-150, 0, -3, 3, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.attack5, x, y-150, 0, -3, 3, bilderG.mon3.attack1:getWidth()/2, bilderG.mon3.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.die1, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.die2, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.die3, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.die4, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.die5, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.mon3.die6, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.mon3.die7, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.mon3.die8, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 9 then
        love.graphics.draw(bilderG.mon3.die9, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      elseif a == 10 then
        love.graphics.draw(bilderG.mon3.die10, x, y-150, 0, -3, 3, bilderG.mon3.die1:getWidth()/2, bilderG.mon3.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.mon3.idle1, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.mon3.idle2, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.mon3.idle3, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.mon3.idle4, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.mon3.idle5, x, y-150, 0, -3, 3, bilderG.mon3.idle1:getWidth()/2, bilderG.mon3.idle1:getHeight())
      end
    end
  end
end

function gegner.drawCat1(x, y, r, a, b, aT)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.walk1, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.walk2, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.walk3, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.walk4, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if aT == 1 then
        if a == 1 then
          love.graphics.draw(bilderG.cat1.attack11, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat1.attack12, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat1.attack13, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat1.attack14, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat1.attack15, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat1.attack16, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat1.attack17, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat1.attack18, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat1.attack19, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat1.attack110, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat1.attack111, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat1.attack112, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        end
      elseif aT == 2 then
        if a == 1 then
          love.graphics.draw(bilderG.cat1.attack21, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat1.attack22, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat1.attack23, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat1.attack24, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat1.attack25, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat1.attack26, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat1.attack27, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat1.attack28, x, y+50, 0, 3, sx, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        end
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.die1, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.die2, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.die3, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.die4, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat1.die5, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat1.die6, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat1.die7, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.idle1, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.idle2, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.idle3, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.idle4, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.walk1, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.walk2, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.walk3, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.walk4, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if aT == 1 then
        if a == 1 then
          love.graphics.draw(bilderG.cat1.attack11, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat1.attack12, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat1.attack13, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat1.attack14, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat1.attack15, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat1.attack16, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat1.attack17, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat1.attack18, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat1.attack19, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat1.attack110, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat1.attack111, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat1.attack112, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        end
      elseif aT == 2 then
        if a == 1 then
          love.graphics.draw(bilderG.cat1.attack21, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat1.attack22, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat1.attack23, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat1.attack24, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat1.attack25, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat1.attack26, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat1.attack27, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat1.attack28, x, y+50, 0, -3, 3, bilderG.cat1.attack11:getWidth()/2, bilderG.cat1.attack11:getHeight())
        end
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.die1, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.die2, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.die3, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.die4, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat1.die5, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat1.die6, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat1.die7, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.idle1, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.idle2, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.idle3, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.idle4, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      end
    end
  end
end

function gegner.drawCat2(x, y, r, a, b)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.walk1, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.walk2, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.walk3, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.walk4, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat2.walk5, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat2.walk6, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat2.walk7, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.cat2.walk8, x, y+50, 0, 3, sx, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.attack1, x, y+50, 0, 3, sx, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.attack2, x, y+50, 0, 3, sx, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.attack3, x, y+50, 0, 3, sx, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.attack4, x, y+50, 0, 3, sx, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.die1, x, y+50, 0, 3, sx, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.die2, x, y+50, 0, 3, sx, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.die3, x, y+50, 0, 3, sx, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.die4, x, y+50, 0, 3, sx, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat2.die5, x, y+50, 0, 3, sx, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.idle1, x, y+50, 0, 3, sx, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.idle2, x, y+50, 0, 3, sx, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.idle3, x, y+50, 0, 3, sx, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.idle4, x, y+50, 0, 3, sx, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.walk1, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.walk2, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.walk3, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.walk4, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat2.walk5, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat2.walk6, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat2.walk7, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      elseif a == 8 then
        love.graphics.draw(bilderG.cat2.walk8, x, y+50, 0, -3, 3, bilderG.cat2.walk1:getWidth()/2, bilderG.cat2.walk1:getHeight())
      end
    elseif b=="angriff" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.attack1, x, y+50, 0, -3, 3, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.attack2, x, y+50, 0, -3, 3, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.attack3, x, y+50, 0, -3, 3, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.attack4, x, y+50, 0, -3, 3, bilderG.cat2.attack1:getWidth()/2, bilderG.cat2.attack1:getHeight())
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.die1, x, y+50, 0, -3, 3, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.die2, x, y+50, 0, -3, 3, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.die3, x, y+50, 0, -3, 3, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.die4, x, y+50, 0, -3, 3, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat2.die5, x, y+50, 0, -3, 3, bilderG.cat2.die1:getWidth()/2, bilderG.cat2.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat2.idle1, x, y+50, 0, -3, 3, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat2.idle2, x, y+50, 0, -3, 3, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat2.idle3, x, y+50, 0, -3, 3, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat2.idle4, x, y+50, 0, -3, 3, bilderG.cat2.idle1:getWidth()/2, bilderG.cat2.idle1:getHeight())
      end
    end
  end
end

function gegner.drawCat3(x, y, r, a, b, aT)
  if r == 1 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.walk1, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.walk2, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.walk3, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.walk4, x, y+50, 0, 3, sx, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if aT == 1 then
        if a == 1 then
          love.graphics.draw(bilderG.cat3.attack11, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat3.attack12, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat3.attack13, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat3.attack15, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat3.attack13, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat3.attack16, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat3.attack17, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat3.attack18, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat3.attack19, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat3.attack110, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat3.attack111, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat3.attack112, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 13 then
          love.graphics.draw(bilderG.cat3.attack113, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 14 then
          love.graphics.draw(bilderG.cat3.attack114, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 15 then
          love.graphics.draw(bilderG.cat3.attack115, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 16 then
          love.graphics.draw(bilderG.cat3.attack116, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 17 then
          love.graphics.draw(bilderG.cat3.attack117, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 18 then
          love.graphics.draw(bilderG.cat3.attack118, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 19 then
          love.graphics.draw(bilderG.cat3.attack119, x+75, y+65-13, 0, 3, sx, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        end
      elseif aT == 2 then
        if a == 1 then
          love.graphics.draw(bilderG.cat3.attack21, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat3.attack22, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat3.attack23, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat3.attack24, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat3.attack25, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat3.attack26, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat3.attack27, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat3.attack28, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat3.attack29, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat3.attack210, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat3.attack211, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat3.attack212, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 13 then
          love.graphics.draw(bilderG.cat3.attack213, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 14 then
          love.graphics.draw(bilderG.cat3.attack214, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 15 then
          love.graphics.draw(bilderG.cat3.attack215, x+75, y+70-20, 0, 3, sx, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        end
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.die1, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.die2, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.die3, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.die4, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat1.die5, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat1.die6, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat1.die7, x, y+50, 0, 3, sx, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.idle1, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.idle2, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.idle3, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.idle4, x, y+50, 0, 3, sx, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      end
    end
  elseif r == 2 then
    if b=="gehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.walk1, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.walk2, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.walk3, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.walk4, x, y+50, 0, -3, 3, bilderG.cat1.walk1:getWidth()/2, bilderG.cat1.walk1:getHeight())
      end
    elseif b=="angriff" then
      if aT == 1 then
        if a == 1 then
          love.graphics.draw(bilderG.cat3.attack11, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat3.attack12, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat3.attack13, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat3.attack14, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat3.attack15, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat3.attack16, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat3.attack17, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat3.attack18, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat3.attack19, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat3.attack110, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat3.attack111, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat3.attack112, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 13 then
          love.graphics.draw(bilderG.cat3.attack113, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 14 then
          love.graphics.draw(bilderG.cat3.attack114, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 15 then
          love.graphics.draw(bilderG.cat3.attack115, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 16 then
          love.graphics.draw(bilderG.cat3.attack116, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 17 then
          love.graphics.draw(bilderG.cat3.attack117, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 18 then
          love.graphics.draw(bilderG.cat3.attack118, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        elseif a == 19 then
          love.graphics.draw(bilderG.cat3.attack119, x-75, y+65-13, 0, -3, 3, bilderG.cat3.attack11:getWidth()/2, bilderG.cat3.attack11:getHeight())
        end
      elseif aT == 2 then
        if a == 1 then
          love.graphics.draw(bilderG.cat3.attack21, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 2 then
          love.graphics.draw(bilderG.cat3.attack22, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 3 then
          love.graphics.draw(bilderG.cat3.attack23, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 4 then
          love.graphics.draw(bilderG.cat3.attack24, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 5 then
          love.graphics.draw(bilderG.cat3.attack25, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 6 then
          love.graphics.draw(bilderG.cat3.attack26, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 7 then
          love.graphics.draw(bilderG.cat3.attack27, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 8 then
          love.graphics.draw(bilderG.cat3.attack28, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 9 then
          love.graphics.draw(bilderG.cat3.attack29, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 10 then
          love.graphics.draw(bilderG.cat3.attack210, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 11 then
          love.graphics.draw(bilderG.cat3.attack211, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 12 then
          love.graphics.draw(bilderG.cat3.attack212, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 13 then
          love.graphics.draw(bilderG.cat3.attack213, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 14 then
          love.graphics.draw(bilderG.cat3.attack214, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        elseif a == 15 then
          love.graphics.draw(bilderG.cat3.attack215, x-75, y+70-20, 0, -3, 3, bilderG.cat3.attack21:getWidth()/2, bilderG.cat3.attack21:getHeight())
        end
      end
    elseif b=="sterben" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.die1, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.die2, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.die3, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.die4, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 5 then
        love.graphics.draw(bilderG.cat1.die5, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 6 then
        love.graphics.draw(bilderG.cat1.die6, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      elseif a == 7 then
        love.graphics.draw(bilderG.cat1.die7, x, y+50, 0, -3, 3, bilderG.cat1.die1:getWidth()/2, bilderG.cat1.die1:getHeight())
      end
    elseif b=="stehen" then
      if a == 1 then
        love.graphics.draw(bilderG.cat1.idle1, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 2 then
        love.graphics.draw(bilderG.cat1.idle2, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 3 then
        love.graphics.draw(bilderG.cat1.idle3, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      elseif a == 4 then
        love.graphics.draw(bilderG.cat1.idle4, x, y+50, 0, -3, 3, bilderG.cat1.idle1:getWidth()/2, bilderG.cat1.idle1:getHeight())
      end
    end
  end
end

function gegner.setzeSchwierigkeit(aenderung)
  schwierigkeit=aenderung
end