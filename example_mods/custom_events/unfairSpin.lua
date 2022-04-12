function onEvent(name, value1, value2)
    if name == 'unfairSpin' then
function onUpdate(elapsed)songPos = getSongPosition()
    
    local currentBeat = (songPos/5000)*(curBpm/24)
    
    for i = 4,7 do
        noteTweenX('strumPlayerX' .. i, i, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (i - 4)) * 300), 0.001)
        noteTweenY('strumPlayerY' .. i, i, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (i - 4)) * 300), 0.001)
    end

    for i = 0,3 do
        noteTweenX('strumOpponentX' .. i, i, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (i + 4) * 2) * 300), 0.001)
        noteTweenY('strumOpponentY' .. i, i, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (i + 4) * 2) * 300), 0.001)
    end
end
end
end