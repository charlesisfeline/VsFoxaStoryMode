singDir = {'LEFT','DOWN','UP','RIGHT'}

function onCreate()
	for i = 0,getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'I Vowel Note' then
			setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'I Vowel Note' then
		characterPlayAnim('boyfriend','sing'..singDir[direction+1]..'-i',true)
		setProperty('boyfriend.specialAnim',true)
	end
end