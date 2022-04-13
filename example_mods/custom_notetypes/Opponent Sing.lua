function onCreatePost()
	for i = 0, getProperty("unspawnNotes.length") - 1 do
		if getPropertyFromGroup("unspawnNotes", i, "noteType") == "opponent" then
			setPropertyFromGroup("unspawnNotes", i, "noAnimation", true)
		end
	end
end

local opponent_singing = false
function onBeatHit()
	-- set to true when opponent is singing
end

local anim_counter = 0
function onStepHit()
	if anim_counter > 0 then
		anim_counter = anim_counter - 1
	elseif opponent_singing then
		if curStep % 8 == 0 then
			characterPlayAnim("dad", "idle", true)
		end
	end
end

function onUpdatePost()
	setProperty("dad.debugMode", opponent_singing and true or false)
end

local anims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, note_type, sustained)
	if opponent_singing then
		if note_type == "opponent_sing" then
			characterPlayAnim("dad", anims[direction + 1], true)
			anim_counter = sustained and 1 or 2
		end
	end
end
