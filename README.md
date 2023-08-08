---
# bucket lua
by paigeroid

<br>

A recreation of my Node.JS Stews package in Lua for use in projects<br>
I'm too lazy to make actual documentation so look below

---

<br>

# Syntax
when making buckets you should structure them somewhat like this
```lua
local bucket = Bucket.new({
    "string", -- string
    123, -- number

    { key = "val" }, -- pair

    {
        "a", "b", "c" -- table
    }
})
```
this goes for adding and setting entries too
```lua
-- string
bucket:Push("abc")

-- number
bucket:Push(456)

-- pair
bucket:Push({ key2 = "val2" })

-- table
bucket:Push( { "d", "e", "f" } )
```
this is because interally most of it is set up like this:
```lua
{ index -> { key -> value } }
```
on top of this there are a few main things for each entry
- **Key:** what is used alternatively to get the value
- **Value:** the thing that's being stored
- **Index:** number that represents where something in the bucket is from 1-length
- **Type:** either "uni" or "pair", pairs are the key = value and unis are just the value
  
the key value and type can be found included in the actual entries and in things like ForEach<br>
the index is usually only gotten through functions
```lua
bucket:ForEach(function(Key, Value, Index, Type)
    -- stuff
end)
```



<br><br>

# Functions

> ## Bucket.new()
> - desc: makes a new bucket
> - returns: Bucket
> - args: Insides: `Table`
> <br>

<br>

> ## Bucket:Length()
> - desc: returns the length of the bucket
> - returns: `Number`
> - args: None
> <br>

<br>

> ## Bucket:Has()
> - desc: checks if it has a key
> - returns: `Boolean`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:HasVal()
> - desc: checks if it has a value
> - returns: `Boolean`
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:StartsWith()
> - desc: checks if it starts with a key
> - returns: `Boolean`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:EndsWith()
> - desc: checks if it ends with a key
> - returns: `Boolean`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:StartsWithVal()
> - desc: checks if it starts with a value
> - returns: `Boolean`
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:EndsWithVal()
> - desc: checks if it ends with a value
> - returns: `Boolean`
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:Get()
> - desc: returns the value of a key
> - returns: Value: `Object`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:At()
> - desc: returns the value at an index
> - returns: Value: `Object`
> - args: Index: `Number`
> <br>

<br>

> ## Bucket:Keys()
> - desc: returns all of the keys in a Bucket
> - returns: Keys: `Bucket`
> - args: None
> <br>

<br>

> ## Bucket:Values()
> - desc: returns all of the values in a Bucket
> - returns: Values: `Bucket`
> - args: None
> <br>

<br>

> ## Bucket:IndexOf()
> - desc: returns the first index of a key
> - returns: Index: `Number`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:IndexOfVal()
> - desc: returns the first index of a value
> - returns: Index: `Number`
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:LastIndexOf()
> - desc: returns the last index of a key
> - returns: Index: `Number`
> - args: Key: `String`
> <br>

<br>

> ## Bucket:LastIndexOfVal()
> - desc: returns the last index of a value
> - returns: Index: `Number`
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:KeyAt()
> - desc: returns the key at an index
> - returns: Key: `String`
> - args: Index: `Number`
> <br>

<br>

> ## Bucket:GetEntry()
> - desc: returns the entry of a key
> - returns: Entry: `Table`
> - args: Key: `String`
> - note: equivalent to doing this
> ```lua
> Bucket[ Bucket:IndexOf( Key ) ]
> ```

<br>

> ## Bucket:EntryAt()
> - desc: returns the entry at an index
> - returns: Entry: `Table`
> - args: Index: `Number`
> - note: equivalent to doing this
> ```lua
> Bucket[Index]
> ```

<br>

> ## Bucket:ForEach()
> - desc: loops through the insides and runs the action given
> - returns: None
> - args: `Function`
> <br>

<br>

> ## Bucket:Every()
> - desc: loops through the insides and checks if EVERY entry passes a given action 
> - returns: `Boolean`
> - args: `Function`
> <br>

<br>

> ## Bucket:Some()
> - desc: loops through the insides and checks if ONLY ONE entry passes a given action 
> - returns: `Boolean`
> - args: `Function`
> <br>

<br>

> ## Bucket:First()
> - desc: returns the first value
> - returns: Value: `Object`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

<br>

> ## Bucket:Last()
> - desc: returns the last value
> - returns: Value: `Object`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

<br>

> ## Bucket:FirstKey()
> - desc: returns the first key
> - returns: Key: `String`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

<br>

> ## Bucket:LastKey()
> - desc: returns the last key
> - returns: Key: `String`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

<br>

> ## Bucket:FirstEntry()
> - desc: returns the first entry
> - returns: Entry: `Table`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

<br>

> ## Bucket:LastEntry()
> - desc: returns the last entry
> - returns: Entry: `Table`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

<br>

> ## Bucket:Push()
> - desc: adds a new entry at the end
> - returns: None
> - args: Entry: `Object`
> <br>

<br>

> ## Bucket:Pull()
> - desc: adds a new entry at the start
> - returns: None
> - args: Entry: `Object`
> <br>

<br>

> ## Bucket:Append()
> - desc: adds a new entry at a given index
> - returns: None
> - args: Index: `Number`, Entry: `Object`
> <br>

<br>

> ## Bucket:Set()
> - desc: sets the value of a key
> - returns: None
> - args: Key: `String`, Value: `Object`
> <br>

<br>

> ## Bucket:SetAt()
> - desc: sets the value at an index
> - returns: None
> - args: Index: `Number`, Value: `Object`
> <br>

<br>

> ## Bucket:Rename()
> - desc: renames a given key
> - returns: None
> - args: Key: `String`, New: `String`
> <br>

<br>

> ## Bucket:RenameAt()
> - desc: renames the key of an index
> - returns: None
> - args: Index: `Number`, New: `String`
> <br>

<br>

> ## Bucket:Del()
> - desc: deletes the entry of a key
> - returns: None
> - args: Key: `String`
> <br>

<br>

> ## Bucket:DelVal()
> - desc: deletes the entry of a value
> - returns: None
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:DetAt()
> - desc: deletes the entry at an index
> - returns: None
> - args: Index: `Number`
> <br>

<br>

> ## Bucket:Pop()
> - desc: deletes the last entry
> - returns: None
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

<br>

> ## Bucket:Shift()
> - desc: deletes the first entry
> - returns: None
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

<br>

> ## Bucket:DelDNU()
> - desc: deletes the entry of a key without updating keys
> - returns: None
> - args: Key: `String`
> <br>

<br>

> ## Bucket:DelValDNU()
> - desc: deletes the entry of a value without updating keys
> - returns: None
> - args: Value: `Object`
> <br>

<br>

> ## Bucket:DetAtDNU()
> - desc: deletes the entry at an index without updating keys
> - returns: None
> - args: Index: `Number`
> <br>

<br>

> ## Bucket:ToString()
> - desc: turns it into a string
> - returns: `String`
> - args: None
> - note: equivalent to doing this
> ```lua
> tostring(Bucket)
> ```
> <br>

> ## Bucket:Join()
> - desc: joins the insides with a joiner
> - returns: `String`
> - args: Joiner: `String`
> <br>
