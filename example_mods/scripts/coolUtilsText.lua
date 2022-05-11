local coolutils = 0
local utilsTakingOver = {}
local stupidList = {}

local letters = { -- add here more symbols from alphabet.xml
    ["A"] = "A bold",
    ["B"] = "B bold",
    ["C"] = "C bold",
    ["D"] = "D bold",
    ["E"] = "E bold",
    ["F"] = "F bold", 
    ["G"] = "G bold",
    ["H"] = "H bold",
    ["I"] = "I bold",
    ["J"] = "J bold",
    ["K"] = "K bold",
    ["L"] = "L bold",
    ["M"] = "M bold",
    ["N"] = "N bold",
    ["O"] = "O bold",
    ["P"] = "P bold",
    ["Q"] = "Q bold",
    ["R"] = "R bold",
    ["S"] = "S bold",
    ["T"] = "T bold",
    ["U"] = "U bold",
    ["V"] = "V bold",
    ["W"] = "W bold",
    ["X"] = "X bold",
    ["Y"] = "Y bold",
    ["Z"] = "Z bold",
    ["<"] = "<",
    [">"] = ">",
    ["("] = "bold (",
    [")"] = "bold )",
    ["."] = "comma",
    ["0"] = "0",
    ["1"] = "1",
    ["2"] = "2",
    ["3"] = "3",
    ["4"] = "4",
    ["5"] = "5",
    ["6"] = "6",
    ["7"] = "7",
    ["8"] = "8",
    ["9"] = "9",
    ["-"] = "bold -"
}

local letterFuncs = { -- offset (or invisible) letters
    [' '] = function(name)
        setProperty(name..'.visible', false)
    end,
    ['-'] = function(name)
        setProperty(name..'.y', getProperty(name..'.y') + 15)
    end,
    ['.'] = function(name)
        setProperty(name..'.y', getProperty(name..'.y') + 20)
    end
}

function coolUtilText(spriteName, text, x, y, isCentered, size)
    local isCentered = isCentered or false
    local size = size or 1
    coolutils = coolutils + 1
    
    utilsTakingOver[spriteName] = {}
    utilsTakingOver[spriteName] = {
        xpos = x,
        ypos = y,
        center = isCentered,
        textSize = size,
        spriteGroupName = spriteName,
        utilText = text,
        sprites = {}
    }

    stupidList[coolutils] = spriteName

    for i=1, #text do

        makeAnimatedLuaSprite(coolutils..'letter'..i, 'alphabet', 0, y)
        addAnimationByPrefix(coolutils..'letter'..i, 'letter', letters[text:sub(i, i):upper()], 24, true)
        if letterFuncs[text:sub(i, i)] then
            letterFuncs[text:sub(i, i)](coolutils..'letter'..i)
        end

        local letterX
        if isCentered then
            letterX = x - (#text / 2 * (50 * size)) + (i * (50 * size)) - getProperty(coolutils..'letter'..i..'.width')
        else
            letterX = x + (i-1) * (50 * size)
        end

        setProperty(coolutils..'letter'..i..'.x', letterX)

        setObjectCamera(coolutils..'letter'..i, 'camHUD')
        scaleObject(coolutils..'letter'..i, size, size)

        addLuaSprite(coolutils..'letter'..i, true)
        objectPlayAnimation(coolutils..'letter'..i, 'letter')

        table.insert(utilsTakingOver[spriteName].sprites, coolutils..'letter'..i)
    end
end

function removeCoolUtil(name)
    aName = name
    if type(name) == 'number' then
        aName = stupidList[name]
    end
    
    if not utilsTakingOver[aName] then return end

    for i, item in pairs(utilsTakingOver[aName].sprites) do
        removeLuaSprite(item, true)
    end

    utilsTakingOver[aName] = nil

    stupidList[tostring(name)] = nil
end

function renameCoolUtil(name, newName)

    if type(name) == 'number' then
        name = stupidList[name]
    end

    if not utilsTakingOver[name] then return debugPrint('error') end

    local stupidUtil = name
    local stupidX = utilsTakingOver[name].xpos
    local stupidY = utilsTakingOver[name].ypos
    local size = utilsTakingOver[name].textSize
    local isCentered = utilsTakingOver[name].center

    for i, item in pairs(utilsTakingOver[name].sprites) do
        removeLuaSprite(item, true)
    end

    utilsTakingOver[name].sprites = {}

    for i=1, #newName do

        makeAnimatedLuaSprite(stupidUtil..'letter'..i, 'alphabet', 0, stupidY)
        addAnimationByPrefix(stupidUtil..'letter'..i, 'letter', letters[newName:sub(i, i):upper()], 24, true)
        if letterFuncs[newName:sub(i, i)] then
            letterFuncs[newName:sub(i, i)](stupidUtil..'letter'..i)
        end

        local letterX
        if isCentered then
            letterX = stupidX - (#newName / 2 * (50 * size)) + (i * (50 * size)) - getProperty(stupidUtil..'letter'..i..'.width')
        else
            letterX = stupidX + (i-1) * (50 * size)
        end

        setProperty(stupidUtil..'letter'..i..'.x', letterX)

        setObjectCamera(stupidUtil..'letter'..i, 'camHUD')
        scaleObject(stupidUtil..'letter'..i, size, size)

        addLuaSprite(stupidUtil..'letter'..i, true)
        objectPlayAnimation(stupidUtil..'letter'..i, 'letter')

        table.insert(utilsTakingOver[name].sprites, stupidUtil..'letter'..i)

    end

    stupidList[name] = newName
end

function onCreate()
    precacheImage('alphabet')
    coolUtilText('util1', 'amogus', 30, 30, false, 0.5)
    removeCoolUtil(1)
end