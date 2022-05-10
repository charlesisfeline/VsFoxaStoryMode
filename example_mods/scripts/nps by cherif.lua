function onCreate()
    NPS = 0
    makeLuaText('NotePerSecond', "NPS",0,0,0)
    makeLuaText('NPST', NPS,0,0,0)
    setProperty('NPST.x', getProperty('NotePerSecond.x')+100) -- yeah idk what the x and y is do it urself
    addLuaText('NPST', true)
    addLuaText('NotePerSecond', true)
end

function onUpdate()
    setTextString('NPST', NPS)
end

function goodNoteHit(id)
    NPS = NPS+1
    runTimer('second', 1)
end

function onTimerCompleted(tag)
    if tag == 'second' then
        NPS = 0
    end
end