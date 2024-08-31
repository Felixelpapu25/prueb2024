local frame = 130;

function onCreate()
iconp2x = getProperty("iconP2.x")
     iconp2y = getProperty("iconP2.y")
    mal2 = getProperty('iconP2.animation.name')
    makeAnimatedLuaSprite("icon","",0,0);
    loadGraphic("icon", "icons/icon-diego",frame,150);
	addAnimation('icon','icons/icon-diego', {0, 1, 2}, 0, true)
    setObjectCamera('icon', 'hud')
    setObjectOrder('icon', getObjectOrder('iconP2') + 5)
	addLuaSprite('icon', true)
end
function onUpdate()
    setProperty("icon.angle", getProperty("iconP2.angle"))
    setProperty("icon.scale.x", getProperty("iconP2.scale.x"))
    setProperty("icon.scale.y", getProperty("iconP2.scale.y")) 
if getProperty('health') > 1.6 then
    setProperty('icon.animation.curAnim.curFrame', 1)
end
if getProperty('health') < 1.6 and getProperty('health') > 0.4 then
    setProperty('icon.animation.curAnim.curFrame', 0)
end
if getProperty('health') < 0.4 then
    setProperty('icon.animation.curAnim.curFrame', 2)
end
setProperty('icon.x', getProperty('iconP2.x')-120)
setProperty("icon.y", iconp2y)
end