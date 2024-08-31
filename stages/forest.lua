local path = "BackGrounds/SirenHead/"
function onCreate()
    makeLuaSprite("bg", path.."bg", 0, 0)
    setScrollFactor("bg", 0.8, 0.8)
    makeLuaSprite("trees", path.."trees 2", 0, 0)
    makeLuaSprite("trees2", path.."trees back 2", 0, 0)
   -- setScrollFactor("trees2", 0.8, 0.8)
    makeLuaSprite("floor", path.."wall", 0, 400)
    makeLuaSprite("bg2",path.."bg front",0,0)
    setScrollFactor("bg2", 0.8, 0.8)
    
    addLuaSprite("bg")
    addLuaSprite("bg2")
    addLuaSprite("trees2")
    addLuaSprite("trees")
    addLuaSprite("floor")
end
function onCreatePost()
setProperty("gf.scale.x", 0.8)
setProperty("gf.scale.y", 0.8)
if boyfriendName == 'mariP1' then
    setProperty("boyfriend.y", getProperty("boyfriend.y")+160)
end
end