function onUpdatePost()
setProperty("iconP1.y", 505 + (getProperty("iconP1.scale.y") * 65))
setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.8 + 1)
setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)
setProperty("iconP2.y", 505 + (getProperty("iconP2.scale.y") * 65))

    if curBeat % 2 == 1 then

setProperty("iconP1.y", 505 + (getProperty("iconP1.scale.y") * 65))
setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 0.9) / -0.7 + 0.8)
setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 0.6) / -0.8 + 1.7)
setProperty("iconP2.y", 505 + (getProperty("iconP2.scale.y") * 75))
end
end

local turnvalue = 25
function onBeatHit()

turnvalue = 12
if curBeat % 2 == 0 then
turnvalue = -12
end

setProperty('iconP2.angle',-turnvalue)
setProperty('iconP1.angle',turnvalue)

doTweenAngle('iconTween1','iconP1',0,crochet/222,'circOut')
doTweenAngle('iconTween2','iconP2',0,crochet/222,'circOut')

end

also heres the one without the tweens that still bounces

function onUpdatePost()
setProperty("iconP1.y", 505 + (getProperty("iconP1.scale.y") * 65))
setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.8 + 1)
setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1.5 + 1)
setProperty("iconP2.y", 505 + (getProperty("iconP2.scale.y") * 65))

    if curBeat % 2 == 1 then

setProperty("iconP1.y", 505 + (getProperty("iconP1.scale.y") * 65))
setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 0.9) / -0.7 + 0.8)
setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 0.6) / -0.8 + 1.7)
setProperty("iconP2.y", 505 + (getProperty("iconP2.scale.y") * 75))
end
end