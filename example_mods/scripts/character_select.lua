local allowCountdown = false
inCharSelect = false --in char select
changeChar = false --change char when song start
json = {'bf', 'pico-player', 'senpai'} --json names
name = {'BoyFriend', 'Pico', 'Senpai'} --display names
page = 1 --don't change it
variation = 1 --don't change it too

function onStartCountdown() --enter selector mode
	if changeChar == true then
		triggerEvent('Change Character', 0, json[page]);
	end
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true);
 	   runTimer('charSelector', 0.8);
        setProperty('camHUD.visible', false);
        makeLuaSprite('bg', 'charSelectorBG', 0, 0);
        addLuaSprite('bg', true);
		setObjectCamera('bg', 'other')
		
        --separation :)
        makeAnimatedLuaSprite('iconGrid', 'iconGrid', 340, 60); --recommend 25 icons (7000x7000, icon: 600x600); if have more than 25, made a new iconGrid
        addAnimationByPrefix('iconGrid', 'bf', 'bf', 24, false);
		addAnimationByPrefix('iconGrid', 'bf-pixel', 'pixel', 24, false);
		addAnimationByPrefix('iconGrid', 'pico-player', 'pico', 24, false);
		addAnimationByPrefix('iconGrid', 'senpai', 'senpai', 24, false);
		addAnimationByPrefix('iconGrid', 'spirit', 'spirit', 24, false);
		addLuaSprite('iconGrid', true);
		setObjectCamera('iconGrid', 'other');
		screenCenter('iconGrid', 'xy')
		
        makeAnimatedLuaSprite('left', 'androidcontrols/virtualbuttons', 0, 588);
        addAnimationByPrefix('left', 'left', 'left', 24, false);
		addAnimationByPrefix('left', 'leftPress', 'leftPressed', 24, false);
		addLuaSprite('left', true);
		setObjectCamera('left', 'other')
		
		makeAnimatedLuaSprite('down', 'androidcontrols/virtualbuttons', 132, 588);
		addAnimationByPrefix('down', 'down', 'down', 24, false);
		addAnimationByPrefix('down', 'downPress', 'downPressed', 24, false);
		addLuaSprite('down', true);
		setObjectCamera('down', 'other')
		
		makeAnimatedLuaSprite('up', 'androidcontrols/virtualbuttons', 1016, 588);
		addAnimationByPrefix('up', 'up', 'up', 24, false);
		addAnimationByPrefix('up', 'upPress', 'upPressed', 24, false);
		addLuaSprite('up', true);
		setObjectCamera('up', 'other')
		
		makeAnimatedLuaSprite('right', 'androidcontrols/virtualbuttons', 1148, 588);
		addAnimationByPrefix('right', 'right', 'right', 24, false);
		addAnimationByPrefix('right', 'rightPress', 'rightPressed', 24, false);
		addLuaSprite('right', true);
		setObjectCamera('right', 'other')
		
		makeAnimatedLuaSprite('a', 'androidcontrols/virtualbuttons', 508, 588);
		addAnimationByPrefix('a', 'a', 'a', 24, false);
		addAnimationByPrefix('a', 'aPress', 'aPressed', 24, false);
		addLuaSprite('a', true);
		setObjectCamera('a', 'other')
		
		makeAnimatedLuaSprite('b', 'androidcontrols/virtualbuttons', 640, 588);
		addAnimationByPrefix('b', 'b', 'b', 24, false);
		addAnimationByPrefix('b', 'bPress', 'bPressed', 24, false);
		addLuaSprite('b', true);
		setObjectCamera('b', 'other')
		
		makeLuaText('char', 'BoyFriend', 0, 0, 110);
        addLuaText('char');
        setTextSize('char', 60);
        setObjectCamera('char', 'other');
        screenCenter('char', 'x')
        
        makeLuaText('name', 'CHARACTER SELECTOR', 0, 0, 0);
        addLuaText('name');
        setTextSize('name', 120);
        setObjectCamera('name', 'other');
        screenCenter('name', 'x')
        --end here
        
        --preloading
		addCharacterToList('bf', 'boyfriend');
		precacheImage('characters/BOYFRIEND');
		addCharacterToList('bf-pixel', 'boyfriend');
		precacheImage('characters/bfPixel');
		addCharacterToList('pico-player', 'boyfriend');
		precacheImage('characters/Pico_FNF_assetss');
		addCharacterToList('senpai', 'boyfriend');
		precacheImage('characters/senpai');
		addCharacterToList('spirit', 'boyfriend');
		precacheImage('characters/spirit');
		--end here

		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag)
	if tag == 'charSelector' then --in selector true
		inCharSelect = true
		playMusic('offsetSong', 1, true);
	end
end

function onUpdate()
	if inCharSelect == true then
		screenCenter('char', 'x');
		setTextString('char', name[page]);
		objectPlayAnimation('iconGrid', json[page], false); 
		if (getMouseX('camHUD') > 1148 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('right') then
			objectPlayAnimation('right', 'rightPress', false);
			playSound('scrollMenu', 1);
			page = page+1
		else
			objectPlayAnimation('right', 'right', true);
		end
		if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('left') then
			objectPlayAnimation('left', 'leftPress', false);
			playSound('scrollMenu', 1);
			page = page-1
		else
			objectPlayAnimation('left', 'left', true);
		end
		if (getMouseX('camHUD') > 132 and getMouseX('camHUD') < 264) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('down') then
			objectPlayAnimation('down', 'downPress', false);
			playSound('scrollMenu', 1);
			variation = variation-1
		else
			objectPlayAnimation('down', 'down', true);
		end
		if (getMouseX('camHUD') > 1016 and getMouseX('camHUD') < 1148) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('up') then
			objectPlayAnimation('up', 'upPress', false);
			playSound('scrollMenu', 1);
			variation = variation+1
		else
			objectPlayAnimation('up', 'up', true);
		end
		if (getMouseX('camHUD') > 508 and getMouseX('camHUD') < 640) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('accept') then
			objectPlayAnimation('a', 'aPress', false);
			changeChar = true
			setProperty('camHUD.visible', true);
			removeLuaSprite('bg', false);
			removeLuaSprite('iconGrid', false);
			removeLuaSprite('left', false);
			removeLuaSprite('down', false);
			removeLuaSprite('up', false);
			removeLuaSprite('right', false);
			removeLuaSprite('a', false);
			removeLuaSprite('b', false);
			removeLuaText('char', false);
			removeLuaText('name', false);
			soundFadeOut('offsetSong', 0.5, 0);
			playSound('confirmMenu', 1);
			startCountdown()
			inCharSelect = false
		else
			objectPlayAnimation('a', 'a', true);
		end
		if (getMouseX('camHUD') > 640 and getMouseX('camHUD') < 772) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('back') then
			objectPlayAnimation('b', 'bPress', false);
			changeChar = false
			setProperty('camHUD.visible', true);
			removeLuaSprite('bg', false);
			removeLuaSprite('iconGrid', false);
			removeLuaSprite('left', false);
			removeLuaSprite('down', false);
			removeLuaSprite('up', false);
			removeLuaSprite('right', false);
			removeLuaSprite('a', false);
			removeLuaSprite('b', false);
			removeLuaText('char', false);
			removeLuaText('name', false);
			soundFadeOut('offsetSong', 0.5, 0);
			playSound('cancelMenu', 1);
			startCountdown()
			inCharSelect = false
		else
			objectPlayAnimation('b', 'b', true);
		end
	end
end

function onUpdatePost(elapsed)
	if inCharSelect == true then
		if variation == 1 then --change variation
			json = {'bf', 'pico-player', 'senpai'}
			name = {'BoyFriend', 'Pico', 'Senpai'}
		end
		if variation == 2 then --change variation
			json = {'bf-pixel', 'pico-player', 'spirit'}
			name = {'Pixel BoyFriend', 'Pico', 'Spirit'}
		end
		if variation < 1 then --variation cycle
			variation = 2
		end
		if variation > 2 then
			variation = 1
		end
		if page < 1 then --page cycle
			page = 3
		end
		if page > 3 then
			page = 1
		end
	end
end
--script by TerrorGaming473