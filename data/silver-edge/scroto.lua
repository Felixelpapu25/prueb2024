function onCreatePost()
    makeLuaSprite('Health', 'CChealth2 - copia',0,-300)
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	scaleObject('Health', 0.33,0.3)
	setObjectOrder('Health', getObjectOrder('healthBar') + 3)
	setProperty('healthBar.visible', true)
end
function onUpdatePost()
	setProperty("Health.y", getProperty("healthBar.y")-65)
	setProperty("Health.x", getProperty("healthBar.x")-40)
end