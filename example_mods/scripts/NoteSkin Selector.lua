function onCreate()
    makeLuaText('space', 'Press [SPACE] to Start', 0, 435);
    setTextSize('space', '30')
    setTextAlignment('space', 'middle')
    addLuaText('space', true)

    makeLuaText('b', 'Press [Y] to Check Note Splashes', 0, 435);
    setTextSize('b', '20')
    setTextAlignment('b', 'middle')
    addLuaText('b', true)

    makeLuaText('t', 'Press [T] to change NoteSkin', 0, 460);
    setTextSize('t', '20')
    setTextAlignment('t', 'middle')
    addLuaText('t', true)

    -- Note Text --

    Ny = 510
    Nx = 0

    makeLuaText('note0', 'NoteSkin: Normal', Nx, Ny)
    setTextSize('note0', '25')
    setTextAlignment('note0', 'middle')
    addLuaText('note0', true)

    makeLuaText('note1', 'NoteSkin: Tabi', Nx, Ny)
    setTextSize('note1', '25')
    setTextAlignment('note1', 'middle')
    addLuaText('note1', true)

    makeLuaText('note2', 'NoteSkin: Majin', Nx, Ny)
    setTextSize('note2', '25')
    setTextAlignment('note2', 'middle')
    addLuaText('note2', true)

    makeLuaText('note3', 'NoteSkin: Creepy', Nx, Ny)
    setTextSize('note3', '25')
    setTextAlignment('note3', 'middle')
    addLuaText('note3', true)

    -- Note Preview --

    PreY = 250
    PreX = 465

    makeLuaSprite('preview0', 'noteseen/normal notes', PreX, PreY)
    setObjectCamera('preview0','other')
    scaleObject('preview0', 0.5, 0.5)
    addLuaSprite('preview0', true)

    makeLuaSprite('preview1', 'noteseen/tabi notes', PreX, PreY)
    setObjectCamera('preview1', 'other')
    scaleObject('preview1', 0.5, 0.5)
    addLuaSprite('preview1', true)

    makeLuaSprite('preview2', 'noteseen/majin notes', PreX, PreY)
    setObjectCamera('preview2', 'other')
    scaleObject('preview2', 0.5, 0.5)
    addLuaSprite('preview2', true)

    makeLuaSprite('preview3', 'noteseen/creepy notes', PreX, PreY)
    setObjectCamera('preview3', 'other')
    scaleObject('preview3', 0.5, 0.5)
    addLuaSprite('preview3', true)

    -- Splash preview --

    makeAnimatedLuaSprite('Splashpre0', 'noteSplashes', PreX, PreY)
    setObjectCamera('Splashpre0', 'other')
    scaleLuaSprite('Splashpre0', 0.5, 0.5)
    addLuaSprite('Splashpre0', true)

    makeAnimatedLuaSprite('Splashpre1', 'notesplash/Majin_Splashes', PreX, PreY)
    setObjectCamera('Splashpre1', 'other')
    scaleLuaSprite('Splashpre1', 0.5, 0.5)
    addLuaSprite('Splashpre1', true)

    makeAnimatedLuaSprite('Splashpre2', 'notesplash/creepySplashes', PreX, PreY)
    setObjectCamera('Splashpre2', 'other')
    scaleLuaSprite('Splashpre2', 0.5, 0.5)
    addLuaSprite('Splashpre2', true)

    -- Splash prefixes --

    luaSpriteAddAnimationByPrefix('Splashpre0', 'blue1', 'note splash blue 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'green1', 'note splash green 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'purple1', 'note splash purple 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'red1', 'note splash red 1', 24, false);

    luaSpriteAddAnimationByPrefix('Splashpre0', 'blue2', 'note splash blue 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'green2', 'note splash green 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'purple2', 'note splash purple 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre0', 'red2', 'note splash red 2', 24, false);

    addAnimationByIndices('Splashpre0', 'blue1', 'note splash blue 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'green1', 'note splash green 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'purple1', 'note splash purple 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'red1', 'note splash red 1', '0,1,2,3', 24)

    addAnimationByIndices('Splashpre0', 'blue2', 'note splash blue 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'green2', 'note splash green 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'purple2', 'note splash purple 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre0', 'red2', 'note splash red 2', '0,1,2,3', 24)



    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-blue1', 'note splash blue 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-green1', 'note splash green 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-purple1', 'note splash purple 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-red1', 'note splash red 1', 24, false);

    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-blue2', 'note splash blue 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-green2', 'note splash green 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-purple2', 'note splash purple 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre1', 'majin-red2', 'note splash red 2', 24, false);

    addAnimationByIndices('Splashpre1', 'majin-blue1', 'note splash blue 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-green1', 'note splash green 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-purple1', 'note splash purple 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-red1', 'note splash red 1', '0,1,2,3', 24)

    addAnimationByIndices('Splashpre1', 'majin-blue2', 'note splash blue 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-green2', 'note splash green 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-purple2', 'note splash purple 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre1', 'majin-red2', 'note splash red 2', '0,1,2,3', 24)



    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-blue1', 'note splash blue 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-green1', 'note splash green 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-purple1', 'note splash purple 1', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-red1', 'note splash red 1', 24, false);

    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-blue2', 'note splash blue 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-green2', 'note splash green 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-purple2', 'note splash purple 2', 24, false);
    luaSpriteAddAnimationByPrefix('Splashpre2', 'creepy-red2', 'note splash red 2', 24, false);

    addAnimationByIndices('Splashpre2', 'creepy-blue1', 'note splash blue 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-green1', 'note splash green 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-purple1', 'note splash purple 1', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-red1', 'note splash red 1', '0,1,2,3', 24)

    addAnimationByIndices('Splashpre2', 'creepy-blue2', 'note splash blue 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-green2', 'note splash green 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-purple2', 'note splash purple 2', '0,1,2,3', 24)
    addAnimationByIndices('Splashpre2', 'creepy-red2', 'note splash red 2', '0,1,2,3', 24)

    -- Tweens --

    noteY = 170

    doTweenY('bY', 'b', 200, 0.1, 'linear')
    doTweenY('tY', 't', 230, 0.1, 'linear')
    doTweenY('spaceY', 'space', 360, 0.1, 'linear')

    doTweenY('noteY0', 'note0', noteY, 0.1, 'linear')
    doTweenY('noteY1', 'note1', noteY, 0.1, 'linear')
    doTweenY('noteY2', 'note2', noteY, 0.1, 'linear')
    doTweenY('noteY3', 'note3', noteY, 0.1, 'linear')

    doTweenY('SplashpreY0', 'Splashpre0', 1230, 0.001, 'linear')
    doTweenX('SplashpreX0', 'Splashpre0', 500, 0.001, 'linear')
    doTweenY('SplashpreY1', 'Splashpre1', 1230, 0.001, 'linear')
    doTweenX('SplashpreX1', 'Splashpre1', 500, 0.001, 'linear')
    doTweenY('SplashpreY2', 'Splashpre2', 1230, 0.001, 'linear')
    doTweenX('SplashpreX2', 'Splashpre2', 500, 0.001, 'linear')

    -- Visibility --

    setProperty('note0.visible', true)
    setProperty('note1.visible', false)
    setProperty('note2.visible', false)
    setProperty('note3.visible', false)

    setProperty('preview0.visible', true)
    setProperty('preview1.visible', false)
    setProperty('preview2.visible', false)
    setProperty('preview3.visible', false)

    -- Precaching --

    precacheImage('noteseen/normal notes')
    precacheImage('noteseen/tabi notes')
    precacheImage('noteseen/majin notes')
    precacheImage('noteseen/creepy notes')

    precacheImage('noteSplashes')
    precacheImage('notesplash/Majin_Splashes')
    precacheImage('notesplash/creepySplashes')
    
    precacheSound('scrollMenu')
end  

local Activate = true;
local allowCountdown = false;
function onStartCountdown()
    if not allowCountdown then -- Block the first countdown
        CheckNote = true;  
        allowCountdown = true; 
        return Function_Stop;
    end    
    return Function_Continue;
end  

function onSongStart()
    Activate = false;
    doTweenAlpha('bAlpha', 'b', 0, 0.1, 'linear')
    doTweenAlpha('tAlpha', 't', 0, 0.1, 'linear')
    doTweenAlpha('spaceAlpha', 'space', 0, 0.1, 'linear') 

    doTweenAlpha('noteAlpha0', 'note0', 0, 0.1, 'linear')
    doTweenAlpha('noteAlpha1', 'note1', 0, 0.1, 'linear')
    doTweenAlpha('noteAlpha2', 'note2', 0, 0.1, 'linear')
    doTweenAlpha('noteAlpha3', 'note3', 0, 0.1, 'linear')

    doTweenAlpha('previewAlpha0', 'preview0', 0, 0.1, 'linear')
    doTweenAlpha('previewAlpha1', 'preview1', 0, 0.1, 'linear')
    doTweenAlpha('previewAlpha2', 'preview2', 0, 0.1, 'linear')
    doTweenAlpha('previewAlpha3', 'preview3', 0, 0.1, 'linear')

    setProperty('Splashpre0.visible', false)
    setProperty('Splashpre1.visible', false)
    setProperty('Splashpre2.visible', false)           
end 

local BotPlay = false;
local Noteskin = 0;
local Notesplash = 0;
function onUpdate(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        startCountdown()
        doTweenAlpha('bAlpha', 'b', 0, 0.1, 'linear')
        doTweenAlpha('tAlpha', 't', 0, 0.1, 'linear')
        doTweenAlpha('spaceAlpha', 'space', 0, 0.1, 'linear')

        doTweenAlpha('noteAlpha0', 'note0', 0, 0.1, 'linear')
        doTweenAlpha('noteAlpha1', 'note1', 0, 0.1, 'linear')
        doTweenAlpha('noteAlpha2', 'note2', 0, 0.1, 'linear')
        doTweenAlpha('noteAlpha3', 'note3', 0, 0.1, 'linear')

        doTweenAlpha('previewAlpha0', 'preview0', 0, 0.1, 'linear')
        doTweenAlpha('previewAlpha1', 'preview1', 0, 0.1, 'linear')
        doTweenAlpha('previewAlpha2', 'preview2', 0, 0.1, 'linear')
        doTweenAlpha('previewAlpha3', 'preview3', 0, 0.1, 'linear')

        doTweenAlpha('SplashpreAlpha0', 'Splashpre0', 0, 0.1, 'linear')
        doTweenAlpha('SplashpreAlpha1', 'Splashpre1', 0, 0.1, 'linear')
        doTweenAlpha('SplashpreAlpha2', 'Splashpre2', 0, 0.1, 'linear')
    end 
    
    if Activate == false then
        runTimer('deley', 1.5)
    end   
end

function onUpdatePost(elapsed)
    if Activate == true then
        if Noteskin == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
            Noteskin = 1;
            playSound('scrollMenu', 1, false)

            setProperty('note0.visible', false)
            setProperty('note1.visible', true)
            setProperty('note2.visible', false)
            setProperty('note3.visible', false)

            setProperty('preview0.visible', false)
            setProperty('preview1.visible', true)
            setProperty('preview2.visible', false)
            setProperty('preview3.visible', false)
        elseif Noteskin == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then   
            Noteskin = 2;
            playSound('scrollMenu', 1, false)

            setProperty('note0.visible', false)
            setProperty('note1.visible', false)
            setProperty('note2.visible', true)
            setProperty('note3.visible', false)

            setProperty('preview0.visible', false)
            setProperty('preview1.visible', false)
            setProperty('preview2.visible', true)
            setProperty('preview3.visible', false)
        elseif Noteskin == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then   
            Noteskin = 3;
            playSound('scrollMenu', 1, false)

            setProperty('note0.visible', false)
            setProperty('note1.visible', false)
            setProperty('note2.visible', false)
            setProperty('note3.visible', true)

            setProperty('preview0.visible', false)
            setProperty('preview1.visible', false)
            setProperty('preview2.visible', false)
            setProperty('preview3.visible', true)
        elseif Noteskin == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then  
            Noteskin = 0;
            playSound('scrollMenu', 1, false)

            setProperty('note0.visible', true)
            setProperty('note1.visible', false)
            setProperty('note2.visible', false)
            setProperty('note3.visible', false) 

            setProperty('preview0.visible', true)
            setProperty('preview1.visible', false)
            setProperty('preview2.visible', false)
            setProperty('preview3.visible', false)
        end

        if Noteskin == 0 or Noteskin == 1 then
            setProperty('Splashpre0.visible', true)
            setProperty('Splashpre1.visible', false)
            setProperty('Splashpre2.visible', false)
            if Notesplash == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 1;
                objectPlayAnimation('Splashpre0', 'blue1', false)
                objectPlayAnimation('Splashpre0', 'blue2', false)
                doTweenX('SplashpreX0', 'Splashpre0', 500, 0.001, 'linear')
                doTweenY('SplashpreY0', 'Splashpre0', 230, 0.001, 'linear')
            elseif Notesplash == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 2;
                objectPlayAnimation('Splashpre0', 'green1', false)
                objectPlayAnimation('Splashpre0', 'green2', false)
                doTweenX('SplashpreX0', 'Splashpre0', 585, 0.001, 'linear')
            elseif Notesplash == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 3;
                objectPlayAnimation('Splashpre0', 'purple1', false)
                objectPlayAnimation('Splashpre0', 'purple2', false)
                doTweenX('SplashpreX0', 'Splashpre0', 420, 0.001, 'linear')
            elseif Notesplash == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 0;
                objectPlayAnimation('Splashpre0', 'red1', false)
                objectPlayAnimation('Splashpre0', 'red2', false)
                doTweenX('SplashpreX0', 'Splashpre0', 675, 0.001, 'linear')
            end 
        elseif Noteskin == 2 then
            setProperty('Splashpre0.visible', false)
            setProperty('Splashpre1.visible', true)
            setProperty('Splashpre2.visible', false)
            if Notesplash == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 1;
                objectPlayAnimation('Splashpre1', 'majin-blue1', false)
                objectPlayAnimation('Splashpre1', 'majin-blue2', false)
                doTweenX('SplashpreX1', 'Splashpre1', 500, 0.001, 'linear')
                doTweenY('SplashpreY1', 'Splashpre1', 230, 0.001, 'linear')
            elseif Notesplash == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 2;
                objectPlayAnimation('Splashpre1', 'majin-green1', false)
                objectPlayAnimation('Splashpre1', 'majin-green2', false)
                doTweenX('SplashpreX1', 'Splashpre1', 585, 0.001, 'linear')
            elseif Notesplash == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 3;
                objectPlayAnimation('Splashpre1', 'majin-purple1', false)
                objectPlayAnimation('Splashpre1', 'majin-purple2', false)
                doTweenX('SplashpreX1', 'Splashpre1', 420, 0.001, 'linear')
            elseif Notesplash == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 0;
                objectPlayAnimation('Splashpre1', 'majin-red1', false)
                objectPlayAnimation('Splashpre1', 'majin-red2', false)
                doTweenX('SplashpreX1', 'Splashpre1', 675, 0.001, 'linear')
            end 
        elseif Noteskin == 3 then  
            setProperty('Splashpre0.visible', false)
            setProperty('Splashpre1.visible', false)
            setProperty('Splashpre2.visible', true)   
            if Notesplash == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 1;
                objectPlayAnimation('Splashpre2', 'creepy-blue1', false)
                objectPlayAnimation('Splashpre2', 'creepy-blue2', false)
                doTweenX('SplashpreX2', 'Splashpre2', 500, 0.001, 'linear')
                doTweenY('SplashpreY2', 'Splashpre2', 230, 0.001, 'linear')
            elseif Notesplash == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 2;
                objectPlayAnimation('Splashpre2', 'creepy-green1', false)
                objectPlayAnimation('Splashpre2', 'creepy-green2', false)
                doTweenX('SplashpreX2', 'Splashpre2', 585, 0.001, 'linear')
            elseif Notesplash == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
                Notesplash = 3;
                objectPlayAnimation('Splashpre2', 'creepy-purple1', false)
                objectPlayAnimation('Splashpre2', 'creepy-purple2', false)
                doTweenX('SplashpreX2', 'Splashpre2', 420, 0.001, 'linear')
            elseif Notesplash == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then  
                Notesplash = 0;
                objectPlayAnimation('Splashpre2', 'creepy-red1', false)
                objectPlayAnimation('Splashpre2', 'creepy-red2', false)
                doTweenX('SplashpreX2', 'Splashpre2', 675, 0.001, 'linear')
            end 
        end        
    end        

    -- Note Skins --
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('notes', i, 'noteType') == '' then
            if Noteskin == 0 then
                getPropertyFromGroup('notes', i, 'texture');   
                getPropertyFromGroup('notes', i, 'noteSplashTexture'); 
            end
            if Noteskin == 1 then
                setPropertyFromGroup('notes', i, 'texture', 'noteskin/tabi_NOTE_assets');  
                setPropertyFromGroup('notes', i, 'noteSplashTexture', 'noteSplashes');
            end 
            if Noteskin == 2 then
                setPropertyFromGroup('notes', i, 'texture', 'noteskin/Majin_Notes');  
                setPropertyFromGroup('notes', i, 'noteSplashTexture', 'noteskin/Majin_Splashes');
            end    
            if Noteskin == 3 then
                setPropertyFromGroup('notes', i, 'texture', 'noteskin/creepy_assets');   
                setPropertyFromGroup('notes', i, 'noteSplashTexture', 'noteskin/creepySplashes');
            end 
        end
    end 
    
    -- Note Strums --
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('notes', i, 'noteType') == '' then
            if Noteskin == 0 then
                getPropertyFromGroup('playerStrums', i, 'texture');
                getPropertyFromGroup('opponentStrums', i, 'texture');
            end
            if Noteskin == 1 then
                setPropertyFromGroup('playerStrums', i, 'texture', 'noteskin/tabi_NOTE_assets');  
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskin/tabi_NOTE_assets');
            end 
            if Noteskin == 2 then
                setPropertyFromGroup('playerStrums', i, 'texture', 'noteskin/Majin_Notes');  
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskin/Majin_Notes');
            end    
            if Noteskin == 3 then
                setPropertyFromGroup('playerStrums', i, 'texture', 'noteskin/creepy_assets');   
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskin/creepy_assets');
            end 
        end
    end  
end

function onTimerCompleted(tags, loops, loopsLeft)
    if tag == 'deley' then
        removeLuaText('b', true);
        removeLuaText('t', true);
        removeLuaText('space', true);

        removeLuaText('note0', true);
        removeLuaText('note1', true);
        removeLuaText('note2', true);
        removeLuaText('note3', true);

        removeLuaSprite('preview0', true);
        removeLuaSprite('preview1', true);
        removeLuaSprite('preview2', true);
        removeLuaSprite('preview3', true);

        removeLuaSprite('Splashpre0', true);
        removeLuaSprite('Splashpre1', true);
        removeLuaSprite('Splashpre2', true);
    end      
end        