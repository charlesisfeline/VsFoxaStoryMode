-- cmallrt made this code aaaaaaaaaaa

local mCombo = 0

function onCreate()
	makeLuaText('combo', 'Combo: 0', -1, 30, 289);  
	setObjectCamera('combo', 'hud');
	setTextSize('combo', 20);
	addLuaText('combo');
	setTextFont('combo', 'vcr.ttf')
	setTextAlignment('combo', 'left')
	
	makeLuaText('sick', 'Sicks: 0', -1, getProperty('combo.x'), getProperty('combo.y') + getProperty('combo.height'));  
	setObjectCamera('sick', 'hud');
	setTextSize('sick', 20);
	addLuaText('sick');
	setTextFont('sick', 'vcr.ttf')
	setTextAlignment('sick', 'left')

	makeLuaText('good', 'Goods: 0', -1, getProperty('combo.x'), getProperty('sick.y') + getProperty('sick.height'));    
	setObjectCamera('good', 'hud');
	setTextSize('good', 20);
	addLuaText('good');
	setTextFont('good', 'vcr.ttf')
	setTextAlignment('good', 'left')

	makeLuaText('bad', 'Bads: 0', -1, getProperty('combo.x'), getProperty('good.y') + getProperty('good.height'));    
	setObjectCamera('bad', 'hud');
	setTextSize('bad', 20);
	addLuaText('bad');
	setTextFont('bad', 'vcr.ttf')
	setTextAlignment('bad', 'left')

	makeLuaText('shit', 'Shits: 0', -1, getProperty('combo.x'), getProperty('bad.y') + getProperty('bad.height'));    
	setObjectCamera('shit', 'hud');
	setTextSize('shit', 20);
	addLuaText('shit');
	setTextFont('shit', 'vcr.ttf')
	setTextAlignment('shit', 'left')
	
	makeLuaText('miss', 'Misses: 0', -1, getProperty('combo.x'), getProperty('shit.y') + getProperty('shit.height'));    
	setObjectCamera('miss', 'hud');
	setTextSize('miss', 20);
	addLuaText('miss');
	setTextFont('miss', 'vcr.ttf')
	setTextAlignment('miss', 'left')
end

function onUpdate(elapsed)
	local combo = getProperty('combo')
	local sicks = getProperty('sicks')
	local goods = getProperty('goods')
	local bads = getProperty('bads')
	local shits = getProperty('shits')
	local misses = getProperty('songMisses')
	
	if combo > mCombo then
		mCombo = combo
	end
	
	setTextString('combo', 'Combo: '.. combo..' ('..mCombo..')')
	setTextString('sick', 'Sicks: '.. sicks)
	setTextString('good', 'Goods: '.. goods)
	setTextString('bad', 'Bads: '.. bads)
	setTextString('shit', 'Shits: '.. shits)
	setTextString('miss', 'Misses: '.. misses)
end