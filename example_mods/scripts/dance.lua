local active = false

function onCreate()
    makeAnimatedLuaSprite('dance', 'dance', 350, 80)
    addAnimationByPrefix('dance', 'start', 'start', 24, false)
    addAnimationByPrefix('dance', 'idle', 'idle', 24, true)
    setObjectCamera('dance', 'hud')

end


function onUpdatePost(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') and active == false then
        addLuaSprite('dance', true)
        objectPlayAnimation('dance', 'start', true)
        active = true
    end
    
    
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') then
        if active == true then
            characterPlayAnim('boyfriend', 'hey', true)
        end
        removeLuaSprite('dance', false)
        active = false
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TWO') then
        if active == true then
            characterPlayAnim('boyfriend', 'yeah', true)
        end
        removeLuaSprite('dance', false)
        active = false
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.THREE') then
        if active == true then
            characterPlayAnim('boyfriend', 'flip', true)
        end
        removeLuaSprite('dance', false)
        active = false
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.FOUR') then
        if active == true then
            characterPlayAnim('boyfriend', 'singy', true)
        end
        removeLuaSprite('dance', false)
        active = false
    end
end
