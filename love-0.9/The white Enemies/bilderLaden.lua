--Autor D.K.

module(..., package.seeall)

local charackterZeichnung = require "charackterZeichnung"
local gegner = require "gegner"
local menu = require "menu"
local overworld_module = require "overworld_module"
local schwerter = require "schwerter"
local level = require "level"

local bilderGeladen, bilderGesammt, laden, hintergrund, titel

function bilderLaden.load()
  bilderGeladen=0
  bilderGesammt=289
  laden=love.graphics.newImage("gfx/laden.png")
  hintergrund=love.graphics.newImage("gfx/menu/hintergrund.png")
  titelG=love.graphics.newImage("gfx/titelG.png")
end

function bilderLaden.draw()
  love.graphics.reset()
  love.graphics.draw(hintergrund, 0, 0)
  love.graphics.draw(titelG, 37.5, 10, 0, 0.25, sx)
  love.graphics.draw(laden, 37.5, 650, 0, 0.25, sx)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 100, 675, 800 / bilderGesammt * bilderGeladen, 75)
end

function bilderLaden.update(dt)
  if bilderGeladen == 0 then
    menu.bilderIni(1, love.graphics.newImage("gfx/menu/schildzurueck.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 1 then
    menu.bilderIni(2, love.graphics.newImage("gfx/menu/schwert.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 2 then
    menu.bilderIni(3, love.graphics.newImage("gfx/menu/schildoptionen.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 3 then
    menu.bilderIni(4, love.graphics.newImage("gfx/menu/sound100.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 4 then
    menu.bilderIni(5, love.graphics.newImage("gfx/menu/sound90.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 5 then
    menu.bilderIni(6, love.graphics.newImage("gfx/menu/sound80.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 6 then
    menu.bilderIni(7, love.graphics.newImage("gfx/menu/sound70.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 7 then
    menu.bilderIni(8, love.graphics.newImage("gfx/menu/sound60.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 8 then
    menu.bilderIni(9, love.graphics.newImage("gfx/menu/sound50.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 9 then
    menu.bilderIni(10, love.graphics.newImage("gfx/menu/sound40.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 10 then
    menu.bilderIni(11, love.graphics.newImage("gfx/menu/sound30.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 11 then
    menu.bilderIni(12, love.graphics.newImage("gfx/menu/sound20.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 12 then
    menu.bilderIni(13, love.graphics.newImage("gfx/menu/sound10.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 13 then
    menu.bilderIni(14, love.graphics.newImage("gfx/menu/sound0.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 14 then
    menu.bilderIni(15, love.graphics.newImage("gfx/menu/vollbild.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 15 then
    menu.bilderIni(16, love.graphics.newImage("gfx/menu/fenster.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 16 then
    menu.bilderIni(17, love.graphics.newImage("gfx/menu/ja.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 17 then
    menu.bilderIni(18, love.graphics.newImage("gfx/menu/nein.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 18 then
    menu.bilderIni(19, love.graphics.newImage("gfx/menu/profil1löschen.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 19 then
    menu.bilderIni(20, love.graphics.newImage("gfx/menu/profil2löschen.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 20 then
    menu.bilderIni(21, love.graphics.newImage("gfx/menu/profil3löschen.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 21 then
    menu.bilderIni(22, love.graphics.newImage("gfx/menu/frageprofil1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 22 then
    menu.bilderIni(23, love.graphics.newImage("gfx/menu/frageprofil2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 23 then
    menu.bilderIni(24, love.graphics.newImage("gfx/menu/frageprofil3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 24 then
    menu.bilderIni(25, love.graphics.newImage("gfx/menu/schwert1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 25 then
    menu.bilderIni(26, love.graphics.newImage("gfx/menu/schwert2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 26 then
    menu.bilderIni(27, love.graphics.newImage("gfx/menu/schwert3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 27 then
    menu.bilderIni(28, love.graphics.newImage("gfx/menu/schwert4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 28 then
    menu.bilderIni(29, love.graphics.newImage("gfx/menu/schwert5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 29 then
    menu.bilderIni(30, love.graphics.newImage("gfx/menu/schwertB.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 30 then
    menu.bilderIni(31, love.graphics.newImage("gfx/menu/schildR.png"))
    schwerter.bilderIni(10, love.graphics.newImage("gfx/menu/schildR.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 31 then
    menu.bilderIni(32, love.graphics.newImage("gfx/menu/schildL.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 32 then
    menu.bilderIni(33, love.graphics.newImage("gfx/menu/schildM.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 33 then
    menu.bilderIni(34, love.graphics.newImage("gfx/menu/schildW.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 34 then
    menu.bilderIni(35, love.graphics.newImage("gfx/menu/schildH.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 35 then
    menu.bilderIni(36, love.graphics.newImage("gfx/menu/schildH2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 36 then
    menu.bilderIni(37, love.graphics.newImage("gfx/menu/schildFarben.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 37 then
    menu.bilderIni(38, love.graphics.newImage("gfx/menu/schildO.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 38 then
    menu.bilderIni(39, love.graphics.newImage("gfx/menu/schildHS.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 39 then
    charackterZeichnung.bilderIni(1, love.graphics.newImage("gfx/mann/mannSA1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 40 then
    charackterZeichnung.bilderIni(2, love.graphics.newImage("gfx/mann/mannSA2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 41 then
    charackterZeichnung.bilderIni(3, love.graphics.newImage("gfx/mann/mannSA3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 42 then
    charackterZeichnung.bilderIni(4, love.graphics.newImage("gfx/mann/mannSA4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 43 then
    charackterZeichnung.bilderIni(5, love.graphics.newImage("gfx/frau/frauV.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 44 then
    charackterZeichnung.bilderIni(6, love.graphics.newImage("gfx/frau/frauSA1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 45 then
    charackterZeichnung.bilderIni(7, love.graphics.newImage("gfx/frau/frauSA2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 46 then
    charackterZeichnung.bilderIni(8, love.graphics.newImage("gfx/frau/frauSA3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 47 then
    charackterZeichnung.bilderIni(9, love.graphics.newImage("gfx/frau/frauSA4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 48 then
    charackterZeichnung.bilderIni(10, love.graphics.newImage("gfx/anziesachen/SH1A1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 49 then
    charackterZeichnung.bilderIni(11, love.graphics.newImage("gfx/anziesachen/SH2A1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 50 then
    charackterZeichnung.bilderIni(12, love.graphics.newImage("gfx/anziesachen/SH3A1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 51 then
    charackterZeichnung.bilderIni(13, love.graphics.newImage("gfx/anziesachen/SH4A1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 52 then
    charackterZeichnung.bilderIni(14, love.graphics.newImage("gfx/anziesachen/SH5A1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 53 then
    charackterZeichnung.bilderIni(15, love.graphics.newImage("gfx/anziesachen/SH1A2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 54 then
    charackterZeichnung.bilderIni(16, love.graphics.newImage("gfx/anziesachen/SH2A2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 55 then
    charackterZeichnung.bilderIni(17, love.graphics.newImage("gfx/anziesachen/SH3A2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 56 then
    charackterZeichnung.bilderIni(18, love.graphics.newImage("gfx/anziesachen/SH4A2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 57 then
    charackterZeichnung.bilderIni(19, love.graphics.newImage("gfx/anziesachen/SH5A2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 58 then
    charackterZeichnung.bilderIni(20, love.graphics.newImage("gfx/anziesachen/SH1A3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 59 then
    charackterZeichnung.bilderIni(21, love.graphics.newImage("gfx/anziesachen/SH2A3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 60 then
    charackterZeichnung.bilderIni(22, love.graphics.newImage("gfx/anziesachen/SH3A3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 61 then
    charackterZeichnung.bilderIni(23, love.graphics.newImage("gfx/anziesachen/SH4A3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 62 then
    charackterZeichnung.bilderIni(24, love.graphics.newImage("gfx/anziesachen/SH5A3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 63 then
    charackterZeichnung.bilderIni(25, love.graphics.newImage("gfx/anziesachen/SH1A4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 64 then
    charackterZeichnung.bilderIni(26, love.graphics.newImage("gfx/anziesachen/SH2A4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 65 then
    charackterZeichnung.bilderIni(27, love.graphics.newImage("gfx/anziesachen/SH3A4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 66 then
    charackterZeichnung.bilderIni(28, love.graphics.newImage("gfx/anziesachen/SH4A4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 67 then
    charackterZeichnung.bilderIni(29, love.graphics.newImage("gfx/anziesachen/SH5A4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 68 then
    charackterZeichnung.bilderIni(30, love.graphics.newImage("gfx/anziesachen/VH1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 69 then
    charackterZeichnung.bilderIni(31, love.graphics.newImage("gfx/anziesachen/VH2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 70 then
    charackterZeichnung.bilderIni(32, love.graphics.newImage("gfx/anziesachen/VH3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 71 then
    charackterZeichnung.bilderIni(33, love.graphics.newImage("gfx/anziesachen/VH4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 72 then
    charackterZeichnung.bilderIni(34, love.graphics.newImage("gfx/anziesachen/VH5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 73 then
    charackterZeichnung.bilderIni(35, love.graphics.newImage("gfx/anziesachen/VO1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 74 then
    charackterZeichnung.bilderIni(36, love.graphics.newImage("gfx/anziesachen/VO2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 75 then
    charackterZeichnung.bilderIni(37, love.graphics.newImage("gfx/anziesachen/VO3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 76 then
    charackterZeichnung.bilderIni(38, love.graphics.newImage("gfx/anziesachen/VO4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 77 then
    charackterZeichnung.bilderIni(39, love.graphics.newImage("gfx/anziesachen/VO5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 78 then
    charackterZeichnung.bilderIni(40, love.graphics.newImage("gfx/anziesachen/mSO1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 79 then
    charackterZeichnung.bilderIni(41, love.graphics.newImage("gfx/anziesachen/mSO2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 80 then
    charackterZeichnung.bilderIni(42, love.graphics.newImage("gfx/anziesachen/mSO3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 81 then
    charackterZeichnung.bilderIni(43, love.graphics.newImage("gfx/anziesachen/mSO4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 82 then
    charackterZeichnung.bilderIni(44, love.graphics.newImage("gfx/anziesachen/mSO5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 83 then
    charackterZeichnung.bilderIni(45, love.graphics.newImage("gfx/anziesachen/fSO1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 84 then
    charackterZeichnung.bilderIni(46, love.graphics.newImage("gfx/anziesachen/fSO2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 85 then
    charackterZeichnung.bilderIni(47, love.graphics.newImage("gfx/anziesachen/fSO3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 86 then
    charackterZeichnung.bilderIni(48, love.graphics.newImage("gfx/anziesachen/fSO4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 87 then
    charackterZeichnung.bilderIni(49, love.graphics.newImage("gfx/anziesachen/fSO5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 88 then
    charackterZeichnung.bilderIni(50, love.graphics.newImage("gfx/anziesachen/VHa1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 89 then
    charackterZeichnung.bilderIni(51, love.graphics.newImage("gfx/anziesachen/VHa2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 90 then
    charackterZeichnung.bilderIni(52, love.graphics.newImage("gfx/anziesachen/VHa3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 91 then
    charackterZeichnung.bilderIni(53, love.graphics.newImage("gfx/anziesachen/VHa4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 92 then
    charackterZeichnung.bilderIni(54, love.graphics.newImage("gfx/anziesachen/VHa5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 93 then
    charackterZeichnung.bilderIni(55, love.graphics.newImage("gfx/anziesachen/SHa1.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 94 then
    charackterZeichnung.bilderIni(56, love.graphics.newImage("gfx/anziesachen/SHa2.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 95 then
    charackterZeichnung.bilderIni(57, love.graphics.newImage("gfx/anziesachen/SHa3.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 96 then
    charackterZeichnung.bilderIni(58, love.graphics.newImage("gfx/anziesachen/SHa4.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 97 then
    charackterZeichnung.bilderIni(59, love.graphics.newImage("gfx/anziesachen/SHa5.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 98 then
    charackterZeichnung.bilderIni(60, love.graphics.newImage("gfx/mann/mannV.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 99 then
    gegner.bilderIni(1, love.graphics.newImage("gfx/mon1_ani/mon1_walk.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 100 then
    gegner.bilderIni(2, love.graphics.newImage("gfx/mon1_ani/mon1_walk.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 101 then
    gegner.bilderIni(3, love.graphics.newImage("gfx/mon1_ani/mon1_walk.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 102 then
    gegner.bilderIni(4, love.graphics.newImage("gfx/mon1_ani/mon1_walk.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 103 then
    gegner.bilderIni(5, love.graphics.newImage("gfx/mon1_ani/mon1_walk.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 104 then
    gegner.bilderIni(6, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 105 then
    gegner.bilderIni(7, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 106 then
    gegner.bilderIni(8, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 107 then
    gegner.bilderIni(9, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 108 then
    gegner.bilderIni(10, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 109 then
    gegner.bilderIni(11, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 110 then
    gegner.bilderIni(12, love.graphics.newImage("gfx/mon1_ani/mon1_attack.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 111 then
    gegner.bilderIni(13, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 112 then
    gegner.bilderIni(14, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 113 then
    gegner.bilderIni(15, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 114 then
    gegner.bilderIni(16, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 115 then
    gegner.bilderIni(17, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 116 then
    gegner.bilderIni(18, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 117 then
    gegner.bilderIni(19, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 118 then
    gegner.bilderIni(20, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 119 then
    gegner.bilderIni(21, love.graphics.newImage("gfx/mon1_ani/mon1_die.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 120 then
    gegner.bilderIni(22, love.graphics.newImage("gfx/mon2_ani/mon2_attack.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 121 then
    gegner.bilderIni(23, love.graphics.newImage("gfx/mon2_ani/mon2_attack.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 122 then
    gegner.bilderIni(24, love.graphics.newImage("gfx/mon2_ani/mon2_attack.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 123 then
    gegner.bilderIni(25, love.graphics.newImage("gfx/mon2_ani/mon2_attack.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 124 then
    gegner.bilderIni(26, love.graphics.newImage("gfx/mon2_ani/mon2_walk.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 125 then
    gegner.bilderIni(27, love.graphics.newImage("gfx/mon2_ani/mon2_walk.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 126 then
    gegner.bilderIni(28, love.graphics.newImage("gfx/mon2_ani/mon2_walk.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 127 then
    gegner.bilderIni(29, love.graphics.newImage("gfx/mon2_ani/mon2_walk.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 128 then
    gegner.bilderIni(30, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 129 then
    gegner.bilderIni(31, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 130 then
    gegner.bilderIni(32, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 131 then
    gegner.bilderIni(33, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 132 then
    gegner.bilderIni(34, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 133 then
    gegner.bilderIni(35, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 134 then
    gegner.bilderIni(36, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 135 then
    gegner.bilderIni(37, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 136 then
    gegner.bilderIni(38, love.graphics.newImage("gfx/mon2_ani/mon2_dead.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 137 then
    gegner.bilderIni(39, love.graphics.newImage("gfx/mon3_ani/mon3_attack.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 138 then
    gegner.bilderIni(40, love.graphics.newImage("gfx/mon3_ani/mon3_attack.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 139 then
    gegner.bilderIni(41, love.graphics.newImage("gfx/mon3_ani/mon3_attack.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 140 then
    gegner.bilderIni(42, love.graphics.newImage("gfx/mon3_ani/mon3_attack.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 141 then
    gegner.bilderIni(43, love.graphics.newImage("gfx/mon3_ani/mon3_attack.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 142 then
    gegner.bilderIni(44, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 143 then
    gegner.bilderIni(45, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 144 then
    gegner.bilderIni(46, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 145 then
    gegner.bilderIni(47, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 146 then
    gegner.bilderIni(48, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 147 then
    gegner.bilderIni(49, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 148 then
    gegner.bilderIni(50, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 149 then
    gegner.bilderIni(51, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 150 then
    gegner.bilderIni(52, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 151 then
    gegner.bilderIni(53, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 152 then
    gegner.bilderIni(54, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 153 then
    gegner.bilderIni(55, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 154 then
    gegner.bilderIni(56, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 155 then
    gegner.bilderIni(57, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 156 then
    gegner.bilderIni(58, love.graphics.newImage("gfx/mon3_ani/mon3_die.gif.ifl/IMG00009.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 157 then
    gegner.bilderIni(59, love.graphics.newImage("gfx/cat_ani_0/cat_walk.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 158 then
    gegner.bilderIni(60, love.graphics.newImage("gfx/cat_ani_0/cat_walk.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 159 then
    gegner.bilderIni(61, love.graphics.newImage("gfx/cat_ani_0/cat_walk.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 160 then
    gegner.bilderIni(62, love.graphics.newImage("gfx/cat_ani_0/cat_walk.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 161 then
    gegner.bilderIni(63, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 162 then
    gegner.bilderIni(64, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 163 then
    gegner.bilderIni(65, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 164 then
    gegner.bilderIni(66, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 165 then
    gegner.bilderIni(67, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 166 then
    gegner.bilderIni(68, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 167 then
    gegner.bilderIni(69, love.graphics.newImage("gfx/cat_ani_0/cat_die.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 168 then
    gegner.bilderIni(70, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 169 then
    gegner.bilderIni(71, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 170 then
    gegner.bilderIni(72, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 171 then
    gegner.bilderIni(73, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 172 then
    gegner.bilderIni(74, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 173 then
    gegner.bilderIni(75, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 174 then
    gegner.bilderIni(76, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 175 then
    gegner.bilderIni(77, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 176 then
    gegner.bilderIni(78, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 177 then
    gegner.bilderIni(79, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00009.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 178 then
    gegner.bilderIni(80, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00010.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 179 then
    gegner.bilderIni(81, love.graphics.newImage("gfx/cat_ani_0/cat_a2.gif.ifl/IMG00011.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 180 then
    gegner.bilderIni(82, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 181 then
    gegner.bilderIni(83, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 182 then
    gegner.bilderIni(84, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 183 then
    gegner.bilderIni(85, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 184 then
    gegner.bilderIni(86, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 185 then
    gegner.bilderIni(87, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 186 then
    gegner.bilderIni(88, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 187 then
    gegner.bilderIni(89, love.graphics.newImage("gfx/cat_ani_0/cat_a8.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 188 then
    gegner.bilderIni(90, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 189 then
    gegner.bilderIni(91, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 190 then
    gegner.bilderIni(92, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 191 then
    gegner.bilderIni(93, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 192 then
    gegner.bilderIni(94, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 193 then
    gegner.bilderIni(95, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 194 then
    gegner.bilderIni(96, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 195 then
    gegner.bilderIni(97, love.graphics.newImage("gfx/cat_assault_rifle/cat_walk.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 196 then
    gegner.bilderIni(98, love.graphics.newImage("gfx/cat_assault_rifle/cat_stand_shot.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 197 then
    gegner.bilderIni(99, love.graphics.newImage("gfx/cat_assault_rifle/cat_stand_shot.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 198 then
    gegner.bilderIni(100, love.graphics.newImage("gfx/cat_assault_rifle/cat_stand_shot.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 199 then
    gegner.bilderIni(101, love.graphics.newImage("gfx/cat_assault_rifle/cat_stand_shot.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 200 then
    gegner.bilderIni(102, love.graphics.newImage("gfx/cat_assault_rifle/cat_die.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 201 then
    gegner.bilderIni(103, love.graphics.newImage("gfx/cat_assault_rifle/cat_die.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 202 then
    gegner.bilderIni(104, love.graphics.newImage("gfx/cat_assault_rifle/cat_die.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 203 then
    gegner.bilderIni(105, love.graphics.newImage("gfx/cat_assault_rifle/cat_die.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 204 then
    gegner.bilderIni(106, love.graphics.newImage("gfx/cat_assault_rifle/cat_die.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 205 then
    gegner.bilderIni(107, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 206 then
    gegner.bilderIni(108, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 207 then
    gegner.bilderIni(109, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 208 then
    gegner.bilderIni(110, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 209 then
    gegner.bilderIni(111, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 210 then
    gegner.bilderIni(112, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 211 then
    gegner.bilderIni(113, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 212 then
    gegner.bilderIni(114, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 213 then
    gegner.bilderIni(115, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 214 then
    gegner.bilderIni(116, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00009.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 215 then
    gegner.bilderIni(117, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00010.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 216 then
    gegner.bilderIni(118, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00011.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 217 then
    gegner.bilderIni(119, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00012.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 218 then
    gegner.bilderIni(120, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00013.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 219 then
    gegner.bilderIni(121, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00014.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 220 then
    gegner.bilderIni(122, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00015.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 221 then
    gegner.bilderIni(123, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00016.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 222 then
    gegner.bilderIni(124, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00017.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 223 then
    gegner.bilderIni(125, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a1_sample.gif.ifl/IMG00018.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 224 then
    gegner.bilderIni(126, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 225 then
    gegner.bilderIni(127, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 226 then
    gegner.bilderIni(128, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 227 then
    gegner.bilderIni(129, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 228 then
    gegner.bilderIni(130, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 229 then
    gegner.bilderIni(131, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00005.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 230 then
    gegner.bilderIni(132, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00006.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 231 then
    gegner.bilderIni(133, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00007.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 232 then
    gegner.bilderIni(134, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00008.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 233 then
    gegner.bilderIni(135, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00009.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 234 then
    gegner.bilderIni(136, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00010.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 235 then
    gegner.bilderIni(137, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00011.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 236 then
    gegner.bilderIni(138, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00012.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 237 then
    gegner.bilderIni(139, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00013.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 238 then
    gegner.bilderIni(140, love.graphics.newImage("gfx/cat_addon_energyforcemaster/cat_a3_sample.gif.ifl/IMG00014.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 239 then
    gegner.bilderIni(141, love.graphics.newImage("gfx/mon1_ani/mon1_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 240 then
    gegner.bilderIni(142, love.graphics.newImage("gfx/mon1_ani/mon1_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 241 then
    gegner.bilderIni(143, love.graphics.newImage("gfx/mon1_ani/mon1_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 242 then
    gegner.bilderIni(144, love.graphics.newImage("gfx/mon1_ani/mon1_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 243 then
    gegner.bilderIni(145, love.graphics.newImage("gfx/mon2_ani/mon2_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 244 then
    gegner.bilderIni(146, love.graphics.newImage("gfx/mon2_ani/mon2_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 245 then
    gegner.bilderIni(147, love.graphics.newImage("gfx/mon2_ani/mon2_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 246 then
    gegner.bilderIni(148, love.graphics.newImage("gfx/mon2_ani/mon2_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 247 then
    gegner.bilderIni(149, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 248 then
    gegner.bilderIni(150, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 249 then
    gegner.bilderIni(151, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 250 then
    gegner.bilderIni(152, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 251 then
    gegner.bilderIni(153, love.graphics.newImage("gfx/mon3_ani/mon3_idle.gif.ifl/IMG00004.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 252 then
    gegner.bilderIni(154, love.graphics.newImage("gfx/cat_ani_0/cat_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 253 then
    gegner.bilderIni(155, love.graphics.newImage("gfx/cat_ani_0/cat_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 254 then
    gegner.bilderIni(156, love.graphics.newImage("gfx/cat_ani_0/cat_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 255 then
    gegner.bilderIni(157, love.graphics.newImage("gfx/cat_ani_0/cat_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 256 then
    gegner.bilderIni(158, love.graphics.newImage("gfx/cat_assault_rifle/cat_idle.gif.ifl/IMG00000.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 257 then
    gegner.bilderIni(159, love.graphics.newImage("gfx/cat_assault_rifle/cat_idle.gif.ifl/IMG00001.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 258 then
    gegner.bilderIni(160, love.graphics.newImage("gfx/cat_assault_rifle/cat_idle.gif.ifl/IMG00002.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 259 then
    gegner.bilderIni(161, love.graphics.newImage("gfx/cat_assault_rifle/cat_idle.gif.ifl/IMG00003.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 260 then
    menu.bilderIni(40, love.graphics.newImage("gfx/menu/hintergrund.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 261 then
    menu.bilderIni(41, love.graphics.newImage("gfx/menu/schwertH.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 262 then
    overworld_module.bilderIni(1, love.graphics.newImage("gfx/overworld_gfx/plains.png"))
    level.bilderIni(8, love.graphics.newImage("gfx/overworld_gfx/plains.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 263 then
    overworld_module.bilderIni(2, love.graphics.newImage("gfx/overworld_gfx/desert.png"))
    level.bilderIni(6, love.graphics.newImage("gfx/overworld_gfx/desert.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 264 then
    overworld_module.bilderIni(3, love.graphics.newImage("gfx/overworld_gfx/plains to desert.png"))
    level.bilderIni(9, love.graphics.newImage("gfx/overworld_gfx/plains to desert.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 265 then
    overworld_module.bilderIni(4, love.graphics.newImage("gfx/overworld_gfx/desert to plains.png"))
    level.bilderIni(7, love.graphics.newImage("gfx/overworld_gfx/desert to plains.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 266 then
    overworld_module.bilderIni(5, love.graphics.newImage("gfx/overworld_gfx/sea to plains.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 267 then
    overworld_module.bilderIni(6, love.graphics.newImage("gfx/overworld_gfx/beginnCity.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 268 then
    overworld_module.bilderIni(7, love.graphics.newImage("gfx/overworld_gfx/bigCity.png"))
    bilderGeladen=bilderGeladen+1
    overworld_module.mapLoad()
  elseif bilderGeladen == 269 then
    menu.bilderIni(42, love.graphics.newImage("gfx/menu/Titel.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 270 then
    schwerter.bilderIni(1, love.graphics.newImage("gfx/weapons/w_2hsword.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 271 then
    schwerter.bilderIni(2, love.graphics.newImage("gfx/weapons/w_katana.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 272 then
    schwerter.bilderIni(3, love.graphics.newImage("gfx/weapons/w_katana_fire.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 273 then
    schwerter.bilderIni(4, love.graphics.newImage("gfx/weapons/w_longsword02.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 274 then
    schwerter.bilderIni(5, love.graphics.newImage("gfx/weapons/w_mace.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 275 then
    schwerter.bilderIni(6, love.graphics.newImage("gfx/weapons/w_mace_dark.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 276 then
    schwerter.bilderIni(7, love.graphics.newImage("gfx/weapons/w_mace_fire.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 277 then
    schwerter.bilderIni(8, love.graphics.newImage("gfx/weapons/w_sword_roman.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 278 then
    schwerter.bilderIni(9, love.graphics.newImage("gfx/weapons/w_sword_roman_dark.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 279 then
    level.bilderIni(1, love.graphics.newImage("gfx/level/hinderniss_baum.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 280 then
    level.bilderIni(2, love.graphics.newImage("gfx/level/hinderniss_felsen.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 281 then
    level.bilderIni(3, love.graphics.newImage("gfx/level/hinderniss_kiste.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 282 then
    level.bilderIni(4, love.graphics.newImage("gfx/level/hinderniss_sand.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 283 then
    level.bilderIni(5, love.graphics.newImage("gfx/level/hinderniss_kaktus.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 284 then
    level.bilderIni(10, love.graphics.newImage("gfx/level/hintergrund_sand.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 285 then
    level.bilderIni(11, love.graphics.newImage("gfx/level/hintergrund_wiese.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 286 then
    level.bilderIni(12, love.graphics.newImage("gfx/level/hintergrund_sandZuWiese.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 287 then
    level.bilderIni(13, love.graphics.newImage("gfx/level/hintergrund_wieseZuSand.png"))
    bilderGeladen=bilderGeladen+1
  elseif bilderGeladen == 288 then
    schwerter.bilderIni(11, love.graphics.newImage("gfx/weapons/leiste.png"))
    bilderGeladen=bilderGeladen+1
  end
end
function bilderLaden.fertig()
  if bilderGeladen==bilderGesammt then
    return true
  else
    return false
  end
end