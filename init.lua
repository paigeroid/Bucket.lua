--[[

	Bucket
	@paigeroid

]]


--< Module >--
local Bucket = {}
Bucket.__index = Bucket



--< New >--
function Bucket.new(array)
	
	-- create the new thing
	local self = setmetatable( {}, Bucket )
    local length = 0
	
    if array then
    	for i, v in pairs(array) do
    	    local stuff
    	    local vl = 0
			local str = tostring(v)
    	    
    	    if type(v) == "table" then for _ in pairs(v) do vl = vl + 1 end end

			if string.sub(str,1,string.len("(("))=="((" then
				stuff = {
	    	        Key = i,
	    	        Value = v
	    	    }
    	    
			elseif type(v) == "table" and vl == 1 then
    	        for Key, Value in pairs(v) do
    	            stuff = {
    	                Key = Key,
    	                Value = Value
    	            }
					break
    	        end
    	    else
    	        stuff = {
    	            Key = i,
    	            Value = v
    	        }
    	    end
    	    
    		self[length+1] = stuff
    		
    		length = length + 1
    	end
    end
	
	return self
end



--< Length >--
function Bucket:Length()
    local length = 0
    for _ in pairs(self) do length = length + 1 end
    return length
end



--< UpdUp >--
function Bucket:UpdUp()
	local count = 1
    for i, v in pairs(self) do
        local key
        
        if type(v.Key) == "number" and v.Key == i+1 then
            key = v.Key-1
        else
            key = v.Key
        end
        
        self[count] = { Key = key, Value = v.Value }
        
        count = count + 1
        
    end
end



--< UpdDown >--
function Bucket:UpdDown()
	local count = 1
    for i, v in pairs(self) do
        local key
        
        if type(v.Key) == "number" and v.Key == i-1 then
            key = v.Key+1
        else
            key = v.Key
        end
        
        self[count] = { Key = key, Value = v.Value }
        
        count = count + 1
        
    end
end



--< Push >--
function Bucket:Push(Entry)
	local index = self:Length() + 1
	local l = 0

	if type(Entry) == "table" then for _ in pairs(Entry) do l = l + 1 end end
	
    if type(Entry) == "table" and l == 1 then
        for Key, Value in pairs(Entry) do
            stuff = {
                Key = Key,
                Value = Value
            }
        end
    else
        stuff = {
            Key = index,
            Value = Entry
        }
    end
    
    table.insert(self, index, stuff)
    self:UpdUp()
end



--< Pull >--
function Bucket:Pull(Entry)
	local l = 0
	if type(Entry) == "table" then for _ in pairs(Entry) do l = l + 1 end end
	
    if type(Entry) == "table" and l == 1 then
        for Key, Value in pairs(Entry) do
            stuff = {
                Key = Key,
                Value = Value
            }
        end
    else
        stuff = {
            Key = 1,
            Value = Entry
        }
    end
    
    table.insert(self, 1, stuff)
    self:UpdDown()
end



--< Insert >--
function Bucket:Append(Index, Entry)
	local l = 0
	if type(Entry) == "table" then for _ in pairs(Entry) do l = l + 1 end end
	
    if type(Entry) == "table" and l == 1 then
        for Key, Value in pairs(Entry) do
            stuff = {
                Key = Key,
                Value = Value
            }
        end
    else
        stuff = {
            Key = Index,
            Value = Entry
        }
    end
    
    table.insert(self, Index, stuff)
    self:UpdUp()
end



--< Get >--
function Bucket:Get(str)
    for i, v in pairs(self) do
        if v.Key == str then
            return v.Value
        end
    end
    
    return nil
end



--< GetEntry >--
function Bucket:GetEntry(str)
    for i, v in pairs(self) do
        if v.Key == str then
            return v
        end
    end
    
    return nil
end



--< At >--
function Bucket:At(index)
    for i, v in pairs(self) do
        if i == index then
            return v.Value
        end
    end

    return nil
end



--< KeyAt >--
function Bucket:KeyAt(index)
    for i, v in pairs(self) do
        if i == index then
            return v.Key
        end
    end

    return nil
end



--< EntryAt >--
function Bucket:EntryAt(index)
    for i, v in pairs(self) do
        if i == index then
            return v
        end
    end

    return nil
end



--< First >--
function Bucket:First(Offset)
	if not Offset then Offset = 0 end
    
    local index = 1 + Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v.Value
    	end
    end
    
    return nil
end



--< FirstKey >--
function Bucket:FirstKey(Offset)
	if not Offset then Offset = 0 end
    
    local index = 1 + Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v.Key
    	end
    end
    
    return nil
end



--< FirstEntry >--
function Bucket:FirstEntry(Offset)
	if not Offset then Offset = 0 end
    
    local index = 1 + Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v
    	end
    end
    
    return nil
end



--< Last >--
function Bucket:Last(Offset)
	if not Offset then Offset = 0 end
    
    local index = self:Length() - Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v.Value
    	end
    end
    
    return nil
end



--< LastKey >--
function Bucket:LastKey(Offset)
	if not Offset then Offset = 0 end
    
    local index = self:Length() - Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v.Key
    	end
    end
    
    return nil
end



--< LastEntry >--
function Bucket:LastEntry(Offset)
	if not Offset then Offset = 0 end
    
    local index = self:Length() - Offset
    
    for i, v in pairs(self) do
    	if i == index then
    		return v
    	end
    end
    
    return nil
end



--< Set >--
function Bucket:Set(Key, Value)
	for i, v in pairs(self) do
		if v.Key == Key then
			self[i].Value = Value
			return
		end
	end
end



--< SetAt >--
function Bucket:SetAt(Index, Value)
	local before = self[Index].Value
	self[Index].Value = Value
	return before
end



--< Del >--
function Bucket:Del(Key)
    for i, v in pairs(self) do
        if v.Key == Key then
            table.remove(self, i)
            break
        end
    end

    self:UpdUp()
end


--< DelDNU >--
function Bucket:DelDNU(Key)
    for i, v in pairs(self) do
        if v.Key == Key then
            table.remove(self, i)
            break
        end
    end
end



--< DelVal >--
function Bucket:DelVal(Value)
    for i, v in pairs(self) do
        if v.Value == Value then
            table.remove(self, i)
            break
        end
    end

    self:UpdUp()
end



--< DelValDNU >--
function Bucket:DelValDNU(Value)
    for i, v in pairs(self) do
        if v.Value == Value then
            table.remove(self, i)
            break
        end
    end
end



--< DelAt >--
function Bucket:DelAt(Index)
    for i, v in pairs(self) do
        if i == Index then
            table.remove(self, Index)
            break
        end
    end
    
    self:UpdUp()
end



--< DelAtDNU >--
function Bucket:DelAtDNU(Index)
    for i, v in pairs(self) do
        if i == Index then
            table.remove(self, Index)
            break
        end
    end
end



--< Pop >--
function Bucket:Pop(Offset)
	if not Offset then Offset = 0 end
	local index = self:Length() - Offset
	
	return self:DelAt(index)
end



--< Shift >--
function Bucket:Shift(Offset)
	if not Offset then Offset = 0 end
	local index = 1 + Offset
	
	return self:DelAt(index)
end



--< ForEach >--
function Bucket:ForEach(func)
	for i, v in pairs(self) do
		func(v.Key, v.Value, i)
	end
end



--< tostring >--
function Bucket:__tostring()
	local thing = "(("
	
	self:ForEach(function(k, v, i)

		local str = tostring(v)
		local value

		-- if it's another bucket
		if string.sub(str,1,string.len("(("))=="((" then
		    value = '( Bucket ('..v:Length().."x) )"

		-- if it's a string
		elseif type(v) == "string" then
		    value = '"'..tostring(v)..'"'
		
		-- if it's a table	
		elseif type(v) == "table" then
		    local vl = 0
	        for _ in pairs(v) do vl = vl + 1 end
	        
		    value = '{ Table ('..vl.."x) }"
		
		-- if it's none of those	
		else
		    value = tostring(v)
		end
		
		-- if it's a pair
		if k ~= i then
			thing = thing.." [ *"..k.." => "..value.." ]"
		
		-- if it's just a normal entry
		else			
			thing = thing.." "..value
		end
		
		if i < self:Length() then
		    thing = thing..","
		end
		
	end)
	
	thing = thing.." ))"
	
	return thing
end
function Bucket:ToString()
	return tostring(self)
end



--< tonumber
function Bucket:__tonumber()
    return self:Length()
end



--< Join >--
function Bucket:Join(joiner)
	if not joiner then joiner = "," end
		
	local thing = ""
	
	self:ForEach(function(k, v, i)
		
		local value
		local str = tostring(v)

		-- if it's another bucket
		if string.sub(str,1,string.len("(("))=="((" then
		    value = 'Bucket ('..v:Length().."x)"

		-- if it's a table
		elseif type(v) == "table" then
		    local vl = 0
	        for _ in pairs(v) do vl = vl + 1 end
	        
		    value = 'Table ('..vl.."x)"
		
		-- if it's none of those	
		else
		    value = tostring(v)
		end
		
		-- if it's a pair
		if k ~= i then
			thing = thing.."*"..k.." => "..value
		
		-- if it's just a normal entry
		else
			thing = thing..value
		end
		
		if i < self:Length() then
		    thing = thing..joiner
		end
		
	end)
	
	return thing
end


--< Every >--
function Bucket:Every(func)
	for i, v in pairs(self) do
		if not func(v.Key, v.Value, i) then
			return false
		end
	end

	return true
end



--< Some >--
function Bucket:Some(func)
	for i, v in pairs(self) do
		if func(v.Key, v.Value, i) then
			return true
		end
	end

	return false
end



--< Keys >--
function Bucket:Keys()
	local keys = {}
	
	for i, v in pairs(self) do
		table.insert(keys, v.Key)
	end

	return Bucket.new(keys)
end



--< Values >--
function Bucket:Values()
	local vals = {}
	
	for i, v in pairs(self) do
		table.insert(vals, v.Value)
	end

	return Bucket.new(vals)
end



--< IndexOf >--
function Bucket:IndexOf(Key)
	for i, v in pairs(self) do
		if v.Key == Key then
			return i
		end
	end

	return nil
end



--< IndexOf >--
function Bucket:IndexOfVal(Value)
	for i, v in pairs(self) do
		if v.Value == Value then
			return i
		end
	end

	return nil
end



--< LastIndexOf >--
function Bucket:LastIndexOf(Key)
	for i = self:Length(), 1, -1 do
		local v = self[i]
		
		if v.Key == Key then
			return i
		end
	end

	return nil
end



--< LastIndexOf >--
function Bucket:LastIndexOfVal(Value)
	for i = self:Length(), 1, -1 do
		local v = self[i]
		
		if v.Value == Value then
			return i
		end
	end

	return nil
end



--< Has >--
function Bucket:Has(...)
	for i0, v0 in ipairs(arg) do
		for i1, v1 in pairs(self) do
			if v1.Key == v0 then
				return true
			end
		end
	end

	return false
end



--< HasVal >--
function Bucket:HasVal(...)
	for i0, v0 in ipairs(arg) do
		for i1, v1 in pairs(self) do
			if v1.Value == v0 then
				return true
			end
		end
	end

	return false
end



--< StartsWith >--
function Bucket:StartsWith(...)
	for i0, v0 in ipairs(arg) do
		if self:FirstKey() == v0 then
			return true
		end
	end

	return false
end



--< StartsWithVal >--
function Bucket:StartsWithVal(...)
	for i0, v0 in ipairs(arg) do
		if self:First() == v0 then
			return true
		end
	end

	return false
end



--< EndsWith >--
function Bucket:EndsWith(...)
	for i0, v0 in ipairs(arg) do
		if self:LastKey() == v0 then
			return true
		end
	end

	return false
end



--< EndsWithVal >--
function Bucket:EndsWithVal(...)
	for i0, v0 in ipairs(arg) do
		if self:Last() == v0 then
			return true
		end
	end

	return false
end



--< Rename >--
function Bucket:Rename(Key, New)
	for i, v in pairs(self) do
		if v.Key == Key then
			v.Key = New
			break
		end
	end
end



return Bucket
