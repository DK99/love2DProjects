--Autor D.K.

module(..., package.seeall)

local charackterTab, bilderC, profil

function charackterZeichnung.load()
  groesse=0.4
  charackterTab={
    geschlecht="m";
    hautfarbe=1;
    hautfarbeGezeichnet=false;
    haare=1;
    haareGezeichnet=false;
    haarefarbe=1;
    oberteil=1;
    oberteilGezeichnet=false;
    oberteilfarbe=1;
    hoseundschuhe=1;
    hoseundschuheGezeichnet=false;
    hoseundschuhefarbe=1;
    richtung="";
    animation=0;
    animationVorher=0;
  }
  bilderC={}
  profil=0
end

function charackterZeichnung.gibVariable(variableNummer)
  if variableNummer == 1 then
    return profil
  elseif variableNummer == 2 then
    return charackterTab.richtung
  elseif variableNummer == 3 then
    return charackterTab.geschlecht
  elseif variableNummer == 4 then
    return charackterTab.hautfarbe
  elseif variableNummer == 5 then
    return charackterTab.haare
  elseif variableNummer == 6 then
    return charackterTab.haarefarbe
  elseif variableNummer == 7 then
    return charackterTab.oberteil
  elseif variableNummer == 8 then
    return charackterTab.oberteilfarbe
  elseif variableNummer == 9 then
    return charackterTab.hoseundschuhe
  elseif variableNummer == 10 then
    return charackterTab.hoseundschuhefarbe
  end
end

function charackterZeichnung.setzeVariable(variableNummer, wert)
  if variableNummer == 0 then
    charackterTab.animation=wert
    if charackterTab.animation ~= charackterTab.animationVorher then
      charackterTab.hautfarbeGezeichnet=false
      charackterTab.hoseundschuheGezeichnet=false
      charackterTab.animationVorher=charackterTab.animation
    end
  elseif variableNummer == 1 then
    profil=wert
  elseif variableNummer == 2 then
    charackterTab.richtung=wert
  elseif variableNummer == 3 then
    charackterTab.geschlecht=wert
    charackterTab.hautfarbeGezeichnet=false
  elseif variableNummer == 4 then
    if wert == "+1" then
      charackterTab.hautfarbe=charackterTab.hautfarbe+1
    elseif wert == "-1" then
      charackterTab.hautfarbe=charackterTab.hautfarbe-1
    else
      charackterTab.hautfarbe=wert
    end
    charackterTab.hautfarbeGezeichnet=false
  elseif variableNummer == 5 then
    if wert == "+1" then
      charackterTab.haare=charackterTab.haare+1
    elseif wert == "-1" then
      charackterTab.haare=charackterTab.haare-1
    else
      charackterTab.haare=wert
    end
    charackterTab.haareGezeichnet=false
  elseif variableNummer == 6 then
    charackterTab.haarefarbe=wert
    charackterTab.haareGezeichnet=false
  elseif variableNummer == 7 then
    if wert == "+1" then
      charackterTab.oberteil=charackterTab.oberteil+1
    elseif wert == "-1" then
      charackterTab.oberteil=charackterTab.oberteil-1
    else
      charackterTab.oberteil=wert
    end
    charackterTab.haareGezeichnet=false
  elseif variableNummer == 8 then
    charackterTab.oberteilfarbe=wert
    charackterTab.oberteilGezeichnet=false
  elseif variableNummer == 9 then
    if wert == "+1" then
      charackterTab.hoseundschuhe=charackterTab.hoseundschuhe+1
    elseif wert == "-1" then
      charackterTab.hoseundschuhe=charackterTab.hoseundschuhe-1
    else
      charackterTab.hoseundschuhe=wert
    end
    charackterTab.hoseundschuheGezeichnet=false
  elseif variableNummer == 10 then
    charackterTab.hoseundschuhefarbe=wert
    charackterTab.hoseundschuheGezeichnet=false
  end
end

function charackterZeichnung.bilderIni(nummer, bild)
  if nummer == 1 then
    bilderC.mannSA1=bild
  elseif nummer == 2 then
    bilderC.mannSA2=bild
  elseif nummer == 3 then
    bilderC.mannSA3=bild
  elseif nummer == 4 then
    bilderC.mannSA4=bild
  elseif nummer == 5 then
    bilderC.frauV=bild
  elseif nummer == 6 then
    bilderC.frauSA1=bild
  elseif nummer == 7 then
    bilderC.frauSA2=bild
  elseif nummer == 8 then
    bilderC.frauSA3=bild
  elseif nummer == 9 then
    bilderC.frauSA4=bild
  elseif nummer == 10 then
    bilderC.SH1A1=bild
  elseif nummer == 11 then
    bilderC.SH2A1=bild
  elseif nummer == 12 then
    bilderC.SH3A1=bild
  elseif nummer == 13 then
    bilderC.SH4A1=bild
  elseif nummer == 14 then
    bilderC.SH5A1=bild
  elseif nummer == 15 then
    bilderC.SH1A2=bild
  elseif nummer == 16 then
    bilderC.SH2A2=bild
  elseif nummer == 17 then
    bilderC.SH3A2=bild
  elseif nummer == 18 then
    bilderC.SH4A2=bild
  elseif nummer == 19 then
    bilderC.SH5A2=bild
  elseif nummer == 20 then
    bilderC.SH1A3=bild
  elseif nummer == 21 then
    bilderC.SH2A3=bild
  elseif nummer == 22 then
    bilderC.SH3A3=bild
  elseif nummer == 23 then
    bilderC.SH4A3=bild
  elseif nummer == 24 then
    bilderC.SH5A3=bild
  elseif nummer == 25 then
    bilderC.SH1A4=bild
  elseif nummer == 26 then
    bilderC.SH2A4=bild
  elseif nummer == 27 then
    bilderC.SH3A4=bild
  elseif nummer == 28 then
    bilderC.SH4A4=bild
  elseif nummer == 29 then
    bilderC.SH5A4=bild
  elseif nummer == 30 then
    bilderC.VH1=bild
  elseif nummer == 31 then
    bilderC.VH2=bild
  elseif nummer == 32 then
    bilderC.VH3=bild
  elseif nummer == 33 then
    bilderC.VH4=bild
  elseif nummer == 34 then
    bilderC.VH5=bild
  elseif nummer == 35 then
    bilderC.VO1=bild
  elseif nummer == 36 then
    bilderC.VO2=bild
  elseif nummer == 37 then
    bilderC.VO3=bild
  elseif nummer == 38 then
    bilderC.VO4=bild
  elseif nummer == 39 then
    bilderC.VO5=bild
  elseif nummer == 40 then
    bilderC.mSO1=bild
  elseif nummer == 41 then
    bilderC.mSO2=bild
  elseif nummer == 42 then
    bilderC.mSO3=bild
  elseif nummer == 43 then
    bilderC.mSO4=bild
  elseif nummer == 44 then
    bilderC.mSO5=bild
  elseif nummer == 45 then
    bilderC.fSO1=bild
  elseif nummer == 46 then
    bilderC.fSO2=bild
  elseif nummer == 47 then
    bilderC.fSO3=bild
  elseif nummer == 48 then
    bilderC.fSO4=bild
  elseif nummer == 49 then
    bilderC.fSO5=bild
  elseif nummer == 50 then
    bilderC.VHa1=bild
  elseif nummer == 51 then
    bilderC.VHa2=bild
  elseif nummer == 52 then
    bilderC.VHa3=bild
  elseif nummer == 53 then
    bilderC.VHa4=bild
  elseif nummer == 54 then
    bilderC.VHa5=bild
  elseif nummer == 55 then
    bilderC.SHa1=bild
  elseif nummer == 56 then
    bilderC.SHa2=bild
  elseif nummer == 57 then
    bilderC.SHa3=bild
  elseif nummer == 58 then
    bilderC.SHa4=bild
  elseif nummer == 59 then
    bilderC.SHa5=bild
  elseif nummer == 60 then
    bilderC.mannV=bild
  end
end

function charackterZeichnung.ini()
  local zeile=1
  if profil==1 then
    if love.filesystem.exists("profile/profil_1.txt") then
      for line in love.filesystem.lines("profile/profil_1.txt") do
        if zeile==1 then
          charackterTab.geschlecht=line
        elseif zeile==2 then
          charackterTab.hautfarbe=tonumber(line)
        elseif zeile==3 then
          charackterTab.haare=tonumber(line)
        elseif zeile==4 then
          charackterTab.haarefarbe=tonumber(line)
        elseif zeile==5 then
          charackterTab.oberteil=tonumber(line)
        elseif zeile==6 then
          charackterTab.oberteilfarbe=tonumber(line)
        elseif zeile==7 then
          charackterTab.hoseundschuhe=tonumber(line)
        elseif zeile==8 then
          charackterTab.hoseundschuhefarbe=tonumber(line)
        end
        zeile=zeile+1
      end
    end
  elseif profil==2 then
    if love.filesystem.exists("profile/profil_2.txt") then
      for line in love.filesystem.lines("profile/profil_2.txt") do
        if zeile==1 then
          charackterTab.geschlecht=line
        elseif zeile==2 then
          charackterTab.hautfarbe=tonumber(line)
        elseif zeile==3 then
          charackterTab.haare=tonumber(line)
        elseif zeile==4 then
          charackterTab.haarefarbe=tonumber(line)
        elseif zeile==5 then
          charackterTab.oberteil=tonumber(line)
        elseif zeile==6 then
          charackterTab.oberteilfarbe=tonumber(line)
        elseif zeile==7 then
          charackterTab.hoseundschuhe=tonumber(line)
        elseif zeile==8 then
          charackterTab.hoseundschuhefarbe=tonumber(line)
        end
        zeile=zeile+1
      end
    end
  elseif profil==3 then
    if love.filesystem.exists("profile/profil_3.txt") then
      for line in love.filesystem.lines("profile/profil_3.txt") do
        if zeile==1 then
          charackterTab.geschlecht=line
        elseif zeile==2 then
          charackterTab.hautfarbe=tonumber(line)
        elseif zeile==3 then
          charackterTab.haare=tonumber(line)
        elseif zeile==4 then
          charackterTab.haarefarbe=tonumber(line)
        elseif zeile==5 then
          charackterTab.oberteil=tonumber(line)
        elseif zeile==6 then
          charackterTab.oberteilfarbe=tonumber(line)
        elseif zeile==7 then
          charackterTab.hoseundschuhe=tonumber(line)
        elseif zeile==8 then
          charackterTab.hoseundschuhefarbe=tonumber(line)
        end
        zeile=zeile+1
      end
    end
  end
end

function charackterZeichnung.update(dt)
  local dataH = ""
  local dataO = ""
  local dataHa = ""
  local dataHau = ""
  if charackterTab.hoseundschuhe == 1 and not charackterTab.hoseundschuheGezeichnet or charackterTab.hoseundschuhe == 2 and not charackterTab.hoseundschuheGezeichnet then
    if charackterTab.hoseundschuhe == 1 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH1:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH1A1:getData()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH1A2:getData()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH1A3:getData()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH1A4:getData()
        end
      end
    elseif charackterTab.hoseundschuhe == 2 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH2:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH2A1:getData()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH2A2:getData()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH2A3:getData()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH2A4:getData()
        end
      end
    end
    if charackterTab.hoseundschuhefarbe==1 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 0, 0, 0, a end)
    elseif charackterTab.hoseundschuhefarbe==2 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 125, 125, 125, a end)
    elseif charackterTab.hoseundschuhefarbe==3 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 125, 0, 0, a end)
    elseif charackterTab.hoseundschuhefarbe==4 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 255, 0, 0, a end)
    elseif charackterTab.hoseundschuhefarbe==5 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 255, 0, 255, a end)
    elseif charackterTab.hoseundschuhefarbe==6 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 0, 0, 255, a end)
    elseif charackterTab.hoseundschuhefarbe==7 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 0, 255, 255, a end)
    elseif charackterTab.hoseundschuhefarbe==8 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 0, 255, 0, a end)
    elseif charackterTab.hoseundschuhefarbe==9 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 255, 255, 0, a end)
    elseif charackterTab.hoseundschuhefarbe==10 then
      dataH:mapPixel(function(x, y, r, g, b, a) return 245, 217, 143, a end)
    end
    if charackterTab.hoseundschuhe == 1 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH1:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH1A1:refresh()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH1A2:refresh()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH1A3:refresh()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH1A4:refresh()
        end
      end
    elseif charackterTab.hoseundschuhe == 2 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH2:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH2A1:refresh()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH2A2:refresh()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH2A3:refresh()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH2A4:refresh()
        end
      end
    end
    charackterTab.hoseundschuheGezeichnet=true
  elseif charackterTab.hoseundschuhe == 3 and not charackterTab.hoseundschuheGezeichnet or charackterTab.hoseundschuhe == 4 and not charackterTab.hoseundschuheGezeichnet or charackterTab.hoseundschuhe == 5 and not charackterTab.hoseundschuheGezeichnet then
    if charackterTab.hoseundschuhe == 3 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH3:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH3A1:getData()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH3A2:getData()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH3A3:getData()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH3A4:getData()
        end
      end
    elseif charackterTab.hoseundschuhe == 4 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH4:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH4A1:getData()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH4A2:getData()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH4A3:getData()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH4A4:getData()
        end
      end
    elseif charackterTab.hoseundschuhe == 5 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH5:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH5A1:getData()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH5A2:getData()
        elseif charackterTab.anmation==3 then
          dataH = bilderC.SH5A3:getData()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH5A4:getData()
        end
      end
    end
    if charackterTab.hoseundschuhefarbe==1 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 0, 0, a end end)
    elseif charackterTab.hoseundschuhefarbe==2 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 125, 125, 125, a end end)
    elseif charackterTab.hoseundschuhefarbe==3 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 125, 0, 0, a end end)
    elseif charackterTab.hoseundschuhefarbe==4 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 0, 0, a end end)
    elseif charackterTab.hoseundschuhefarbe==5 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 0, 255, a end end)
    elseif charackterTab.hoseundschuhefarbe==6 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 0, 255, a end end)
    elseif charackterTab.hoseundschuhefarbe==7 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 255, 255, a end end)
    elseif charackterTab.hoseundschuhefarbe==8 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 255, 0, a end end)
    elseif charackterTab.hoseundschuhefarbe==9 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 255, 0, a end end)
    elseif charackterTab.hoseundschuhefarbe==10 then
      dataH:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 245, 217, 143, a end end)
    end
    if charackterTab.hoseundschuhe == 3 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH3:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH3A1:refresh()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH3A2:refresh()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH3A3:refresh()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH3A4:refresh()
        end
      end
    elseif charackterTab.hoseundschuhe == 4 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH4:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH4A1:refresh()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH4A2:refresh()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH4A3:refresh()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH4A4:refresh()
        end
      end
    elseif charackterTab.hoseundschuhe == 5 then
      if charackterTab.richtung=="V" then
        dataH = bilderC.VH5:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataH = bilderC.SH5A1:refresh()
        elseif charackterTab.animation==2 then
          dataH = bilderC.SH5A2:refresh()
        elseif charackterTab.animation==3 then
          dataH = bilderC.SH5A3:refresh()
        elseif charackterTab.animation==4 then
          dataH = bilderC.SH5A4:refresh()
        end
      end
    end
    charackterTab.hoseundschuheGezeichnet=true
  end
  if charackterTab.oberteil == 1 and not charackterTab.oberteilGezeichnet or charackterTab.oberteil == 2 and not charackterTab.oberteilGezeichnet then
    if charackterTab.oberteil == 1 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO1:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO1:getData()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO1:getData()
        end
      end
    elseif charackterTab.oberteil == 2 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO2:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO2:getData()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO2:getData()
        end
      end
    end
    if charackterTab.oberteilfarbe==1 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 0, 0, 0, a end)
    elseif charackterTab.oberteilfarbe==2 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 125, 125, 125, a end)
    elseif charackterTab.oberteilfarbe==3 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 125, 0, 0, a end)
    elseif charackterTab.oberteilfarbe==4 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 255, 0, 0, a end)
    elseif charackterTab.oberteilfarbe==5 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 255, 0, 255, a end)
    elseif charackterTab.oberteilfarbe==6 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 0, 0, 255, a end)
    elseif charackterTab.oberteilfarbe==7 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 0, 255, 255, a end)
    elseif charackterTab.oberteilfarbe==8 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 0, 255, 0, a end)
    elseif charackterTab.oberteilfarbe==9 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 255, 255, 0, a end)
    elseif charackterTab.oberteilfarbe==10 then
      dataO:mapPixel(function(x, y, r, g, b, a) return 245, 217, 143, a end)
    end
    if charackterTab.oberteil == 1 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO1:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO1:refresh()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO1:refresh()
        end
      end
    elseif charackterTab.oberteil == 2 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO2:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO2:refresh()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO2:refresh()
        end
      end
    end
    charackterTab.oberteilGezeichnet=true
  elseif charackterTab.oberteil == 3 and not charackterTab.oberteilGezeichnet or charackterTab.oberteil == 4 and not charackterTab.oberteilGezeichnet or charackterTab.oberteil == 5 and not charackterTab.oberteilGezeichnet then
    if charackterTab.oberteil == 3 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO3:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO3:getData()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO3:getData()
        end
      end
    elseif charackterTab.oberteil == 4 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO4:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO4:getData()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO4:getData()
        end
      end
    elseif charackterTab.oberteil == 5 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO5:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO5:getData()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO5:getData()
        end
      end
    end
    if charackterTab.oberteilfarbe==1 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 0, 0, a end end)
    elseif charackterTab.oberteilfarbe==2 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 125, 125, 125, a end end)
    elseif charackterTab.oberteilfarbe==3 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 125, 0, 0, a end end)
    elseif charackterTab.oberteilfarbe==4 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 0, 0, a end end)
    elseif charackterTab.oberteilfarbe==5 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 0, 255, a end end)
    elseif charackterTab.oberteilfarbe==6 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 0, 255, a end end)
    elseif charackterTab.oberteilfarbe==7 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 255, 255, a end end)
    elseif charackterTab.oberteilfarbe==8 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 0, 255, 0, a end end)
    elseif charackterTab.oberteilfarbe==9 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 255, 255, 0, a end end)
    elseif charackterTab.oberteilfarbe==10 then
      dataO:mapPixel(function(x, y, r, g, b, a) if r == 255 and g == 255 and b == 255 then return 255, 255, 255, a else return 245, 217, 143, a end end)
    end
    if charackterTab.oberteil == 3 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO3:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO3:refresh()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO3:refresh()
        end
      end
    elseif charackterTab.oberteil == 4 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO4:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO4:refresh()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO4:refresh()
        end
      end
    elseif charackterTab.oberteil == 5 then
      if charackterTab.richtung=="V" then
        dataO = bilderC.VO5:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.geschlecht == "m" then
          dataO = bilderC.mSO5:refresh()
        elseif charackterTab.geschlecht == "f" then
          dataO = bilderC.fSO5:refresh()
        end
      end
    end
    charackterTab.oberteilGezeichnet=true
  end
  if charackterTab.haare == 1 and not charackterTab.haareGezeichnet or charackterTab.haare == 2 and not charackterTab.haareGezeichnet or charackterTab.haare == 3 and not charackterTab.haareGezeichnet or charackterTab.haare == 4 and not charackterTab.haareGezeichnet or charackterTab.haare == 5 and not charackterTab.haareGezeichnet then
    if charackterTab.haare == 1 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa1:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa1:getData()
      end
    elseif charackterTab.haare == 2 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa2:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa2:getData()
      end
    elseif charackterTab.haare == 3 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa3:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa3:getData()
      end
    elseif charackterTab.haare == 4 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa4:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa4:getData()
      end
    elseif charackterTab.haare == 5 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa5:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa5:getData()
      end
    end
    if charackterTab.haarefarbe==1 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 0, 0, 0, a end)
    elseif charackterTab.haarefarbe==2 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 125, 125, 125, a end)
    elseif charackterTab.haarefarbe==3 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 125, 0, 0, a end)
    elseif charackterTab.haarefarbe==4 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 255, 0, 0, a end)
    elseif charackterTab.haarefarbe==5 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 255, 0, 255, a end)
    elseif charackterTab.haarefarbe==6 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 0, 0, 255, a end)
    elseif charackterTab.haarefarbe==7 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 0, 255, 255, a end)
    elseif charackterTab.haarefarbe==8 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 0, 255, 0, a end)
    elseif charackterTab.haarefarbe==9 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 255, 255, 0, a end)
    elseif charackterTab.haarefarbe==10 then
      dataHa:mapPixel(function(x, y, r, g, b, a) return 245, 217, 143, a end)
    end
    if charackterTab.haare == 1 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa1:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa1:refresh()
      end
    elseif charackterTab.haare == 2 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa2:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa2:refresh()
      end
    elseif charackterTab.haare == 3 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa3:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa3:refresh()
      end
    elseif charackterTab.haare == 4 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa4:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa4:refresh()
      end
    elseif charackterTab.haare == 5 then
      if charackterTab.richtung=="V" then
        dataHa = bilderC.VHa5:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        dataHa = bilderC.SHa5:refresh()
      end
    end
    charackterTab.haareGezeichnet=true
  end
  if not charackterTab.hautfarbeGezeichnet then
    if charackterTab.geschlecht == "m" then
      if charackterTab.richtung=="V" then
        dataHau = bilderC.mannV:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataHau = bilderC.mannSA1:getData()
        elseif charackterTab.animation==2 then
          dataHau = bilderC.mannSA2:getData()
        elseif charackterTab.animation==3 then
          dataHau = bilderC.mannSA3:getData()
        elseif charackterTab.animation==4 then
          dataHau = bilderC.mannSA4:getData()
        end
      end
    elseif charackterTab.geschlecht == "f" then
      if charackterTab.richtung=="V" then
        dataHau = bilderC.frauV:getData()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataHau = bilderC.frauSA1:getData()
        elseif charackterTab.animation==2 then
          dataHau = bilderC.frauSA2:getData()
        elseif charackterTab.animation==3 then
          dataHau = bilderC.frauSA3:getData()
        elseif charackterTab.animation==4 then
          dataHau = bilderC.frauSA4:getData()
        end
      end
    end
    if charackterTab.hautfarbe==1 then
      dataHau:mapPixel(function(x, y, r, g, b, a) return 230, 153, 153, a end)
    elseif charackterTab.hautfarbe==2 then
      dataHau:mapPixel(function(x, y, r, g, b, a) return 204, 115, 102, a end)
    elseif charackterTab.hautfarbe==3 then
      dataHau:mapPixel(function(x, y, r, g, b, a) return 227, 176, 149, a end)
    elseif charackterTab.hautfarbe==4 then
      dataHau:mapPixel(function(x, y, r, g, b, a) return 199, 151, 120, a end)
    elseif charackterTab.hautfarbe==5 then
      dataHau:mapPixel(function(x, y, r, g, b, a) return 114, 32, 32, a end)
    end
    if charackterTab.geschlecht == "m" then
      if charackterTab.richtung=="V" then
        dataHau = bilderC.mannV:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataHau = bilderC.mannSA1:refresh()
        elseif charackterTab.animation==2 then
          dataHau = bilderC.mannSA2:refresh()
        elseif charackterTab.animation==3 then
          dataHau = bilderC.mannSA3:refresh()
        elseif charackterTab.animation==4 then
          dataHau = bilderC.mannSA4:refresh()
        end
      end
    elseif charackterTab.geschlecht == "f" then
      if charackterTab.richtung=="V" then
        dataHau = bilderC.frauV:refresh()
      elseif charackterTab.richtung=="L" or charackterTab.richtung=="R" then
        if charackterTab.animation==1 then
          dataHau = bilderC.frauSA1:refresh()
        elseif charackterTab.animation==2 then
          dataHau = bilderC.frauSA2:refresh()
        elseif charackterTab.animation==3 then
          dataHau = bilderC.frauSA3:refresh()
        elseif charackterTab.animation==4 then
          dataHau = bilderC.frauSA4:refresh()
        end
      end
    end
    charackterTab.hautfarbeGezeichnet=true
  end
end

function charackterZeichnung.draw(x, y)
  if charackterTab.richtung == "V" then
    if charackterTab.geschlecht=="m" then
       love.graphics.draw(bilderC.mannV, x, y, 0, 0.7, sx, bilderC.mannV:getWidth()/2, bilderC.mannV:getHeight()/2)
    end
    if charackterTab.geschlecht=="f" then
      love.graphics.draw(bilderC.frauV, x+5, y, 0, 0.7, sx, bilderC.frauV:getWidth()/2, bilderC.frauV:getHeight()/2)
    end
    if charackterTab.hoseundschuhe == 1 then
      love.graphics.draw(bilderC.VH1, x, y, 0, 0.7, sx, bilderC.VH1:getWidth()/2, bilderC.VH1:getHeight()/2)
    elseif charackterTab.hoseundschuhe == 2 then
      love.graphics.draw(bilderC.VH2, x, y, 0, 0.7, sx, bilderC.VH1:getWidth()/2, bilderC.VH1:getHeight()/2)
    elseif charackterTab.hoseundschuhe == 3 then
      love.graphics.draw(bilderC.VH3, x, y, 0, 0.7, sx, bilderC.VH1:getWidth()/2, bilderC.VH1:getHeight()/2)
    elseif charackterTab.hoseundschuhe == 4 then
      love.graphics.draw(bilderC.VH4, x, y, 0, 0.7, sx, bilderC.VH1:getWidth()/2, bilderC.VH1:getHeight()/2)
    elseif charackterTab.hoseundschuhe == 5 then
      love.graphics.draw(bilderC.VH5, x, y, 0, 0.7, sx, bilderC.VH1:getWidth()/2, bilderC.VH1:getHeight()/2)
    end
    if charackterTab.oberteil == 1 then
      love.graphics.draw(bilderC.VO1, x, y, 0, 0.7, sx, bilderC.VO1:getWidth()/2, bilderC.VO1:getHeight()/2)
    elseif charackterTab.oberteil == 2 then
      love.graphics.draw(bilderC.VO2, x, y, 0, 0.7, sx, bilderC.VO1:getWidth()/2, bilderC.VO1:getHeight()/2)
    elseif charackterTab.oberteil == 3 then
      love.graphics.draw(bilderC.VO3, x, y, 0, 0.7, sx, bilderC.VO1:getWidth()/2, bilderC.VO1:getHeight()/2)
    elseif charackterTab.oberteil == 4 then
      love.graphics.draw(bilderC.VO4, x, y, 0, 0.7, sx, bilderC.VO1:getWidth()/2, bilderC.VO1:getHeight()/2)
    elseif charackterTab.oberteil == 5 then
      love.graphics.draw(bilderC.VO5, x, y, 0, 0.7, sx, bilderC.VO1:getWidth()/2, bilderC.VO1:getHeight()/2)
    end
    if charackterTab.haare == 1 then
      love.graphics.draw(bilderC.VHa1, x, y, 0, 0.7, sx, bilderC.VHa1:getWidth()/2, bilderC.VHa1:getHeight()/2)
    elseif charackterTab.haare == 2 then
      love.graphics.draw(bilderC.VHa2, x, y, 0, 0.7, sx, bilderC.VHa1:getWidth()/2, bilderC.VHa1:getHeight()/2)
    elseif charackterTab.haare == 3 then
      love.graphics.draw(bilderC.VHa3, x, y, 0, 0.7, sx, bilderC.VHa1:getWidth()/2, bilderC.VHa1:getHeight()/2)
    elseif charackterTab.haare == 4 then
      love.graphics.draw(bilderC.VHa4, x, y, 0, 0.7, sx, bilderC.VHa1:getWidth()/2, bilderC.VHa1:getHeight()/2)
    elseif charackterTab.haare == 5 then
      love.graphics.draw(bilderC.VHa5, x, y, 0, 0.7, sx, bilderC.VHa1:getWidth()/2, bilderC.VHa1:getHeight()/2)
    end
  elseif charackterTab.richtung == "L" then
    if charackterTab.animation == 1 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA1, x, y, 0, groesse, sx, bilderC.mannSA1:getWidth()/2, bilderC.mannSA1:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA1, x, y, 0, groesse, sx, bilderC.frauSA1:getWidth()/2, bilderC.frauSA1:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A1, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A1, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A1, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A1, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A1, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 2 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA2, x, y, 0, groesse, sx, bilderC.mannSA2:getWidth()/2, bilderC.mannSA2:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA2, x, y, 0, groesse, sx, bilderC.frauSA2:getWidth()/2, bilderC.frauSA2:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A2, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A2, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A2, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A2, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A2, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 3 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA3, x, y, 0, groesse, sx, bilderC.mannSA3:getWidth()/2, bilderC.mannSA3:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA3, x, y, 0, groesse, sx, bilderC.frauSA3:getWidth()/2, bilderC.frauSA3:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A3, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A3, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A3, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A3, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A3, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 4 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA4, x, y, 0, groesse, sx, bilderC.mannSA4:getWidth()/2, bilderC.mannSA4:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA4, x, y, 0, groesse, sx, bilderC.frauSA4:getWidth()/2, bilderC.frauSA4:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A4, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A4, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A4, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A4, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A4, x, y, 0, groesse, sx, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="m" then
      if charackterTab.oberteil == 1 then
        love.graphics.draw(bilderC.mSO1, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 2 then
        love.graphics.draw(bilderC.mSO2, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 3 then
        love.graphics.draw(bilderC.mSO3, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 4 then
        love.graphics.draw(bilderC.mSO4, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 5 then
        love.graphics.draw(bilderC.mSO5, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="f" then
      if charackterTab.oberteil == 1 then
        love.graphics.draw(bilderC.fSO1, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 2 then
        love.graphics.draw(bilderC.fSO2, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 3 then
        love.graphics.draw(bilderC.fSO3, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 4 then
        love.graphics.draw(bilderC.fSO4, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 5 then
        love.graphics.draw(bilderC.fSO5, x, y, 0, groesse, sx, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="m" then
      if charackterTab.haare == 1 then
        love.graphics.draw(bilderC.SHa1, x, y+5, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 2 then
        love.graphics.draw(bilderC.SHa2, x, y+5, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 3 then
        love.graphics.draw(bilderC.SHa3, x, y+5, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 4 then
        love.graphics.draw(bilderC.SHa4, x, y+5, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 5 then
        love.graphics.draw(bilderC.SHa5, x, y+5, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      end
    elseif charackterTab.geschlecht=="f" then
      if charackterTab.haare == 1 then
        love.graphics.draw(bilderC.SHa1, x, y, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 2 then
        love.graphics.draw(bilderC.SHa2, x, y, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 3 then
        love.graphics.draw(bilderC.SHa3, x, y, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 4 then
        love.graphics.draw(bilderC.SHa4, x, y, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 5 then
        love.graphics.draw(bilderC.SHa5, x, y, 0, groesse, sx, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      end
    end
  elseif charackterTab.richtung == "R" then
    if charackterTab.animation == 1 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA1, x, y, 0, -groesse, groesse, bilderC.mannSA1:getWidth()/2, bilderC.mannSA1:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA1, x, y, 0, -groesse, groesse, bilderC.frauSA1:getWidth()/2, bilderC.frauSA1:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A1, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A1, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A1, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A1, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A1, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 2 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA2, x, y, 0, -groesse, groesse, bilderC.mannSA2:getWidth()/2, bilderC.mannSA2:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA2, x, y, 0, -groesse, groesse, bilderC.frauSA2:getWidth()/2, bilderC.frauSA2:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A2, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A2, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A2, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A2, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A2, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 3 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA3, x, y, 0, -groesse, groesse, bilderC.mannSA3:getWidth()/2, bilderC.mannSA3:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA3, x, y, 0, -groesse, groesse, bilderC.frauSA3:getWidth()/2, bilderC.frauSA3:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A3, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A3, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A3, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A3, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A3, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    elseif charackterTab.animation == 4 then
      if charackterTab.geschlecht=="m" then
        love.graphics.draw(bilderC.mannSA4, x, y, 0, -groesse, groesse, bilderC.mannSA4:getWidth()/2, bilderC.mannSA4:getHeight()/2)
      end
      if charackterTab.geschlecht=="f" then
        love.graphics.draw(bilderC.frauSA4, x, y, 0, -groesse, groesse, bilderC.frauSA4:getWidth()/2, bilderC.frauSA4:getHeight()/2)
      end
      if charackterTab.hoseundschuhe == 1 then
        love.graphics.draw(bilderC.SH1A4, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 2 then
        love.graphics.draw(bilderC.SH2A4, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 3 then
        love.graphics.draw(bilderC.SH3A4, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 4 then
        love.graphics.draw(bilderC.SH4A4, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      elseif charackterTab.hoseundschuhe == 5 then
        love.graphics.draw(bilderC.SH5A4, x, y, 0, -groesse, groesse, bilderC.SH1A1:getWidth()/2, bilderC.SH1A1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="m" then
      if charackterTab.oberteil == 1 then
        love.graphics.draw(bilderC.mSO1, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 2 then
        love.graphics.draw(bilderC.mSO2, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 3 then
        love.graphics.draw(bilderC.mSO3, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 4 then
        love.graphics.draw(bilderC.mSO4, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 5 then
        love.graphics.draw(bilderC.mSO5, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="f" then
      if charackterTab.oberteil == 1 then
        love.graphics.draw(bilderC.fSO1, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 2 then
        love.graphics.draw(bilderC.fSO2, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 3 then
        love.graphics.draw(bilderC.fSO3, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 4 then
        love.graphics.draw(bilderC.fSO4, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      elseif charackterTab.oberteil == 5 then
        love.graphics.draw(bilderC.fSO5, x, y, 0, -groesse, groesse, bilderC.mSO1:getWidth()/2, bilderC.mSO1:getHeight()/2)
      end
    end
    if charackterTab.geschlecht=="m" then
      if charackterTab.haare == 1 then
        love.graphics.draw(bilderC.SHa1, x, y+5, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 2 then
        love.graphics.draw(bilderC.SHa2, x, y+5, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 3 then
        love.graphics.draw(bilderC.SHa3, x, y+5, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 4 then
        love.graphics.draw(bilderC.SHa4, x, y+5, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 5 then
        love.graphics.draw(bilderC.SHa5, x, y+5, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      end
    elseif charackterTab.geschlecht=="f" then
      if charackterTab.haare == 1 then
        love.graphics.draw(bilderC.SHa1, x, y, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 2 then
        love.graphics.draw(bilderC.SHa2, x, y, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 3 then
        love.graphics.draw(bilderC.SHa3, x, y, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 4 then
        love.graphics.draw(bilderC.SHa4, x, y, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      elseif charackterTab.haare == 5 then
        love.graphics.draw(bilderC.SHa5, x, y, 0, -groesse, groesse, bilderC.SHa1:getWidth()/2, bilderC.SHa1:getHeight()/2)
      end
    end
  end
end

function charackterZeichnung.reset()
  groesse=0.4
  charackterTab={
    geschlecht="m";
    hautfarbe=1;
    hautfarbeGezeichnet=false;
    haare=1;
    haareGezeichnet=false;
    haarefarbe=1;
    oberteil=1;
    oberteilGezeichnet=false;
    oberteilfarbe=1;
    hoseundschuhe=1;
    hoseundschuheGezeichnet=false;
    hoseundschuhefarbe=1;
    richtung="";
    animation=0;
    animationVorher=0;
  }
  profil=0
end