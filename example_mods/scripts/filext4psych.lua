--------------------------------------------------------------------------------
-- Filesystem access extensions for Psych Engine <= 0.5.2      ©DragShot - v1.0
--------------------------------------------------------------------------------
-- Usage in any mods is allowed as long as this header is kept intact. Also,
-- please give me credits somewhere.
-- In order to make use of it, paste this code at the beginning of your script.
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- The good stuff:
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- - Functions `readFile()` and `fileExists()` able to search for files inside
--   'mods/' or your mod's folder.
-- - Function `readLines()` for dumping all lines from a file into an array
--   table. Useful for walking over file contents line by line.
-- - Drop in replacement for `require` (unavailable in 0.5.2) able to load .lua
--   modules from 'mods/libs/' or 'mods/mymod/libs/'.
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Compatibility layer with Vs Selever (PE 0.5.1-xt) for Psych Engine
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function _pathSplice(limit)
	--Fetch the location of this script
	local path = string.sub(debug.getinfo(1).source, 2);
	local idx = 0;
	for i = 1, limit do
		idx, _ = string.find(path, '/', idx + 1, true);
	end
	path = string.sub(path, 1, idx);
	return path;
end

-- Returns the contents of a file inside 'mods/mymod/' or 'mods/'.
-- It's better to make sure it exists first before trying to read it.
function readFile(target)
	if (target == nil or target:contains('..', true)) then
		return nil; --Fuck off!
	end
	local str = nil;
	--Try with io package (<= 0.5.2)
	--i=2 -> Seach inside 'mods/modpack' folder
	--i=1 -> Seach inside 'mods' folder
	pcall(function()
		for i = 2, 1, -1 do 
			local path = _pathSplice(i);
			--debugPrint('Searching for '..path..target..'...');
			local stream = io.open(path..target, 'r');
			if (stream) then
				str = stream:read('*all');
				stream:close();
			end
		end
	end);
	--Try using the callback from 0.5.2
	if (not str) then
		pcall(function() str = getTextFromFile(target); end);
	end
	return str;
end

-- Returns `true` if a given file inside 'mods/mymod/' or 'mods/' exists and
-- it's readable, `false` otherwise.
function fileExists(target)
	if (target == nil or target:contains('..', true)) then
		return nil; --Fuck off!
	end
	local exists = false;
	pcall(function()
		for i = 2, 1, -1 do 
			local path = _pathSplice(i);
			--debugPrint('Searching for '..path..target..'...');
			local stream = io.open(path..target, 'r');
			if (stream) then
				exists = true;
				stream:close();
			end
		end
	end);
	return exists;
end

-- Do you have a text file with multiple lines? You can get them all neatly
-- bundled in an array table from here.
function readLines(file)
	local textData = readFile(file);
	local tlines = string.split(textData, '\n', true);
	for i = 1,#tlines,1 do
		local chr = string.len(tlines[i]);
		if (chr > 0 and string.sub(tlines[i], chr, chr) == '\r') then
			tlines[i] = string.sub(tlines[i], 1, chr-1);
		end
	end
	return tlines;
end

-- This `require` behaves like the one in the PR proposed by @cyn-8.
-- You can place any .lua modules you want to load inside 'mods/libs/',
-- 'mods/mymod/libs/' or next to where this script is.
-- In order to be able to use it, however, you must call the following
-- function once from `onCreate()`:
function deployRequire()
--if (not _G.require) then
	_G.require = function(moduleName)
		if (not moduleName) then
			return nil;
		end
		--If the thing has been loaded before, do not do it again.
		if (package.loaded[moduleName]) then
			return package.loaded[moduleName];
		end
		--Try and load it from the same folder this script is, using `io`
		local target = moduleName:gsub('%.', '%/');
		modTxt = nil;
		pcall(function()
			local paths = {
				string.sub(debug.getinfo(1).source, 2):match('@?(.*/)')..target..'.lua',
				string.sub(debug.getinfo(1).source, 2):match('@?(.*/)')..target..'/init.lua'
			};
			for i, path in ipairs(paths) do
				local stream = io.open(path, 'r');
				if (stream) then
					modTxt = stream:read('*all');
					stream:close();
				end
				if (modTxt) then break; end
			end
		end);
		--Try and load it using `readFile()`
		if (not modTxt) then
			modTxt = readFile('libs/'..target..'.lua');
		end
		if (not modTxt) then
			modTxt = readFile('libs/'..target..'/init.lua');
		end
		--If the module in question was found, load it
		if (modTxt) then
			package.loaded[moduleName] = loadstring(modTxt);
		end
		return package.loaded[moduleName];
	end
end
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Helper Functions
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function string.split(str, sep, noRegexp)
	sep = sep or ' ';
	noRegexp = noRegexp or false;
	local idx = 1;
	local length = string.len(str);
	local array = {};
	while (idx <= length) do
		local nid, nlen = string.find(str, sep, idx, noRegexp);
		if (nid) then
			table.insert(array, string.sub(str, idx, nid-1));
			idx = nlen + 1;
		else
			break;
		end
	end
	if (idx <= length) then
		table.insert(array, string.sub(str, idx));
	end
	return array;
end

function string.contains(str, text, noRegexp)
	if (text == nil or text:len() == 0) then
		return false;
	end
	noRegexp = noRegexp or false;
	local idx, slen = str:find(text, 1, noRegexp);
	if (idx) then
		return true;
	else
		return false;
	end
end
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Bootstrap
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function onCreate()
	deployRequire();
	--Put the rest of your init code here
	
end