songended = false

function onUpdatePost()
    if songended == false then
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Friday Night Funkin': Vs. Foxa [Story Mode] '..'SONG: '..getProperty('curSong')..' | '..getProperty('scoreTxt.text'))
    end
end
function onDestroy()
    songended = true
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Friday Night Funkin': Vs. Foxa [Story Mode] ')
end

function onGameOver()
    songended = true
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Friday Night Funkin': Vs. Foxa [Story Mode] '..' SONG: '..getProperty('curSong')..' | GAMEOVER')
    return Function_Continue
end