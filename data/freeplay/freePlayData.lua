---@diagnostic disable
local frame = 150 -- write 1/3 the width of your icon image
local freePlaySongs = {
"exmilix",
"silver edge",
"shot head-old",
"darkHot-felixMix",
"Insane-remix",
"Lime",
"Spookeez"
}
local colors = {
  "E10142",
"7D5021",
"61FFE5",
"930028",
"61FFE5",
"9B8080",
"FFFFFF"
}
local freePlayPortrait = {
'exmix',
'sh',
'rayo',
'darka',
'rayo',
'nil',
'insanos'
}
local icons = {
  'exmix',
  'sh',
  'rayor',
  'elmariwano',
  'rayor',
  'face',
  'diego',
}
local curSelected = 1;
function onStartCountdown()
  if not allowCountdown then
    return Function_Stop
  end
  if allowCountdown then
    return Function_Continue
  end
end
function onCreate()
  local mal = getProperty('iconP1.animation.name')
local mal2 = getProperty('iconP2.animation.name')
  scr = 1
  playMusic("breakfast",0.4,true)
scaleObject("por", 0.66, 0.66)
  makeLuaSprite("bg","menumod/MenuFreeplay",-300,-100);
  addLuaSprite("bg");
  makeLuaSprite("splash","menumod/Base",-300,-100);
  addLuaSprite("splash");
  for i = 1, #freePlaySongs do
    id = 'song'..tonumber(i)
    makeLuaSprite(id,"freeplay/songs/"..freePlaySongs[i],-50,(i * 190)-100)
    scaleObject(id, 0.4, 0.4)
    updateHitbox(id)
    setObjectOrder(id, 10)
    addLuaSprite(id)
    setScrollFactor(id, 1, 1) 
    
end
for j = 1, #icons do 
  iconID = 'icon'..tonumber(j)
  makeAnimatedLuaSprite(iconID,nil, 380, (j * 190)-100)
    loadGraphic(iconID,'icons/icon-'..icons[j], frame,150)
setObjectOrder(iconID, 11)
addAnimation(iconID,'icons/icon-'..icons[j], {0, 1, 2}, 0, true)
addLuaSprite(iconID);
setProperty(iconID..'.animation.curAnim.curFrame', 3)
end
makeLuaSprite("dark", "", -200, 360)
makeGraphic("dark", 455, 25, "000000");
setProperty("dark.alpha", 0.8)
scaleObject("dark", 2.0, 2.0);
addLuaSprite("dark",true)
makeLuaText("instru", "Press 'enter' for start selected song, Press 'space' to select a random song, press 'escape' to exit to the FreePlay menu", 1500, -100, 690)
setTextSize("instru", 18)
addLuaText("instru")
changeSelection();
end
function onUpdate()
  if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then 
    restartSong(false);
end
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
exitSong()
end
if keyReleased('up') then
  changeSelection(-1)
  playSound("scrollMenu",1)
end
  if keyReleased('down') then
    changeSelection(1)
    playSound("scrollMenu",1)
  end
  if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
    playSound("confirmMenu")
    cameraFlash("hud", "FFFFFF", 1.2, false)
    runTimer("startSong",1);
  end
  if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
    songIndex = math.random(1,#freePlaySongs)
    sonic = freePlaySongs[songIndex]
    loadSong(sonic)
    debugPrint(sonic)
  end
  Song(freePlaySongs[curSelected],freePlayPortrait[curSelected],colors[curSelected])
  removeLuaSprite("gficon",true)
  removeLuaSprite("HealthFG",true)
end

function changeSelection(huh)
 -- playSound("scrollMenu",1)
  curSelected = curSelected + huh
  if (curSelected < 1) then
    curSelected = #freePlaySongs
  elseif (curSelected > #freePlaySongs) then
    curSelected = 1
  end

  -- Calcula la nueva posición 'y' para centrar la selección en la pantalla
  local centerOffset = 90 -- Ajusta este valor para centrar en tu pantalla
  local newY = centerOffset - (curSelected * 150) -- '150' es la altura de cada elemento

  for i = 1, #freePlaySongs do
    local id = 'song'..i
    local iconID = 'icon'..tonumber(i)
    -- Actualiza la posición 'y' de cada sprite de canción
    setProperty(id..".y", newY + (i * 150))
    setProperty(iconID..".y", newY + (i * 150))
    setProperty(id..".alpha", 0.6)
    setProperty(iconID..".alpha", 0.6)
    if (i == curSelected) then
      setProperty(id..".alpha", 1)
      setProperty(iconID..".alpha", 1)
    end
  end
end


function Song(icon,portrait,color)
  for i = 1, #freePlaySongs do
    local id = 'song'..i
      doTweenColor("b2", "bg", color, 0.4, "linear")
      doTweenColor("aaa", "splash", color, 0.4, "linear")
makeLuaSprite("por","freeplay/images/"..portrait,280,0)
scaleObject("por", 0.66, 0.66)
if curSelected == 2 then
  scaleObject("por", 1.1, 1.1)
  setProperty("por.x", getProperty("por.x")-200)
  setProperty("por.y", getProperty("por.y")-50)
end
addLuaSprite("por")
    end
  end

function onTimerCompleted(tag, loops, loopsLeft)
  if tag == "startSong" then
    loadSong(freePlaySongs[curSelected])
  end
end