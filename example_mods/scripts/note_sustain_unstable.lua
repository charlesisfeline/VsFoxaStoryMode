nice = true --toggles if you want the funy notes on or off
big = 0.8 --how big it gets
small = 0.35 --how small it gets
reach = 0 --how far it h
function onCreatePost()
  makeLuaSprite('lmao', '', 0.7, 0.7)
  addLuaSprite('lmao')
end
function onUpdate(elapsed)
  strength1 = 100
  strength2 = 2000
  offset = 350
  songPos = getSongPosition()
  local currentBeat = (songPos/5000)*(curBpm/60)
  --noteTweenY('penis', 4, (math.cos((currentBeat) - 0) * 100 ) + 100, 0.001)
  shitX = {defaultOpponentStrumX0,defaultOpponentStrumX1,defaultOpponentStrumX2,defaultOpponentStrumX3,defaultPlayerStrumX0,defaultPlayerStrumX1,defaultPlayerStrumX2,defaultPlayerStrumX3}
  shitY = {defaultOpponentStrumY0,defaultOpponentStrumY1,defaultOpponentStrumY2,defaultOpponentStrumY3,defaultPlayerStrumY0,defaultPlayerStrumY1,defaultPlayerStrumY2,defaultPlayerStrumY3}
  if nice then
    for i=0,6,2 do
      noteTweenX('penisX'..i, i, shitX[i+1] +(math.sin((currentBeat) + 0) * reach), 0.001)
      noteTweenY('penisY'..i, i, shitY[i+1] + (math.cos((currentBeat) + 0) * reach), 0.001)
    end
    for i=1,7,2 do
      noteTweenX('penisX'..i, i, shitX[i+1] +(math.sin((currentBeat) * -1) * reach), 0.001)
      noteTweenY('penisY'..i, i, shitY[i+1] + (math.cos((currentBeat) * -1) * reach), 0.001)
    end
  end
  --noteTweenX('cock', 4, defaultPlayerStrumX0 - strength1*math.sin((currentBeat+32)*math.pi/5), 0.001)
  for i=0,3,1 do
    setPropertyFromGroup('opponentStrums', i, 'scale.x', getProperty('lmao.x'));
    setPropertyFromGroup('opponentStrums', i, 'scale.y', getProperty('lmao.y'));

    setPropertyFromGroup('playerStrums', i, 'scale.x', getProperty('lmao.x'));
    setPropertyFromGroup('playerStrums', i, 'scale.y', getProperty('lmao.y'));

    setPropertyFromGroup('unspawnNotes', i, 'scale.x', getProperty('lmao.x'));
    setPropertyFromGroup('unspawnNotes', i, 'scale.y', getProperty('lmao.y'));
  end
end
function onTweenCompleted(tag)
  if tag == 'krunkhalfX' then
    doTweenX('krunkbigX', 'lmao', big, 1, 'linear')
    doTweenY('krunkhalfY', 'lmao', small, 1, 'linear')
  elseif tag == 'krunkbigX' then
    doTweenX('krunkhalfX', 'lmao', small, 1, 'linear')
    doTweenY('krunkbigY', 'lmao', big, 1, 'linear')
  end
end