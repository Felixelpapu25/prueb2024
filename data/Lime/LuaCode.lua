function onCreate()
    setProperty('skipCountdown', true)
    setProperty('camHUD.alpha', 0)
    setProperty('gf.alpha', 0)
    setProperty('comboGroup.alpha', 0)

    makeLuaSprite("black", null, -100, 0)
    makeGraphic("black", 3000, 3000, "000000")
    addLuaSprite("black", false)

    makeAnimatedLuaSprite('logobump', 'InsaneLogo', 150, 3000)
    scaleObject('logobump', 1.5, 1.5)
    addAnimationByPrefix('logobump', 'logo bumpin', 'logo bumpin', 24, false)
    addLuaSprite('logobump', false)

    makeLuaSprite("overlayBlack", null, -100, 0)
    makeGraphic("overlayBlack", 3000, 3000, "000000")
    addLuaSprite("overlayBlack", true)

    makeLuaSprite('cutsceneEater', 'cutsceneEater')
    setObjectCamera('cutsceneEater', 'camOther')
    addLuaSprite('cutsceneEater')
    
    setProperty('cutsceneEater.visible', false)
end
function onBeatHit()
    if curBeat % 1 == 0 then 
        playAnim('logobump', 'logo bumpin', true)
    end
    
    if curBeat == 16 then
        setProperty('cutsceneEater.visible', false)
        doTweenAlpha('blackOut', 'overlayBlack', 0, 0.8, 'quartOut')
        doTweenAlpha('welcomeBoys', 'camHUD', 1, 0.8, 'quartOut')
    end

    if curBeat == 48 then
        doTweenAlpha('sheAppears', 'gf', 1, 1.6, 'quartOut')
        doTweenAlpha('titleAppears', 'logobump', 1, 1.6, 'quartOut')
        doTweenY('sheAscends', 'gf', 325, 1.6, 'quartOut')
        doTweenY('titleAscends', 'logobump', -950, 1.6, 'quartOut')
    end

    if curBeat == 312 then
        doTweenZoom('zoomAway', 'camGame', 0.1, 1.6, 'quartOut')
        doTweenAlpha('fadeAway', 'overlayBlack', 1, 1.6, 'quartOut')
        doTweenAlpha('hudFadeAway', 'camHUD', 0, 1.6, 'quartOut')
        runTimer('camZomShit', 1.6, 1)
    end
end

---
--- @param tag string
--- @param loops integer
--- @param loopsLeft integer
---
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'camZomShit' then
        setProperty('defaultCamZoom', 0.1)
    end
end
function onCreatePost()
    setProperty("dad.x", getProperty("dad.x") - 120)
end