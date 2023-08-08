---
# bucket lua
By paigeroid

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

<br><br>

# Functions

> ## Bucket.new()
> - desc: makes a new bucket
> - returns: Bucket
> - args: Insides: `Table`
> <br>

> ## Bucket:Length()
> - desc: returns the length of the bucket
> - returns: `Number`
> - args: None
> <br>

> ## Bucket:Get()
> - desc: returns the value of a key
> - returns: Value: `Object`
> - args: Key: `String`
> <br>

> ## Bucket:At()
> - desc: returns the value at an index
> - returns: Value: `Object`
> - args: Index: `Number`
> <br>

> ## Bucket:KeyAt()
> - desc: returns the key at an index
> - returns: Key: `String`
> - args: Index: `Number`
> <br>

> ## Bucket:GetEntry()
> - desc: returns the entry of a key
> - returns: Entry: `Table`
> - args: Key: `String`
> - note: equivalent to doing this
> ```lua
> Bucket[ Bucket:IndexOf( Key ) ]
> ```

> ## Bucket:EntryAt()
> - desc: returns the entry at an index
> - returns: Entry: `Table`
> - args: Index: `Number`
> - note: equivalent to doing this
> ```lua
> Bucket[Index]
> ```

> ## Bucket:First()
> - desc: returns the first value
> - returns: Value: `Object`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

> ## Bucket:Last()
> - desc: returns the last value
> - returns: Value: `Object`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

> ## Bucket:FirstKey()
> - desc: returns the first key
> - returns: Key: `String`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

> ## Bucket:LastKey()
> - desc: returns the last key
> - returns: Key: `String`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

> ## Bucket:FirstEntry()
> - desc: returns the first entry
> - returns: Entry: `Table`
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

> ## Bucket:LastEntry()
> - desc: returns the last entry
> - returns: Entry: `Table`
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

> ## Bucket:Push()
> - desc: adds a new entry at the end
> - returns: None
> - args: Entry: `Object`
> <br>

> ## Bucket:Pull()
> - desc: adds a new entry at the start
> - returns: None
> - args: Entry: `Object`
> <br>

> ## Bucket:Append()
> - desc: adds a new entry at a given index
> - returns: None
> - args: Index: `Number`, Entry: `Object`
> <br>

> ## Bucket:Set()
> - desc: sets the value of a key
> - returns: None
> - args: Key: `String`, Value: `Object`
> <br>

> ## Bucket:SetAt()
> - desc: sets the value at an index
> - returns: None
> - args: Index: `Number`, Value: `Object`
> <br>

> ## Bucket:Del()
> - desc: deletes the entry of a key
> - returns: None
> - args: Key: `String`
> <br>

> ## Bucket:DelVal()
> - desc: deletes the entry of a value
> - returns: None
> - args: Value: `Object`
> <br>

> ## Bucket:DetAt()
> - desc: deletes the entry at an index
> - returns: None
> - args: Index: `Number`
> <br>

> ## Bucket:Pop()
> - desc: deletes the last entry
> - returns: None
> - args: Offset: `Number`
> - note: you can offset it down
> <br>

> ## Bucket:Shift()
> - desc: deletes the first entry
> - returns: None
> - args: Offset: `Number`
> - note: you can offset it up
> <br>

> ## Bucket:DelDNU()
> - desc: deletes the entry of a key without updating keys
> - returns: None
> - args: Key: `String`
> <br>

> ## Bucket:DelVal()
> - desc: deletes the entry of a value without updating keys
> - returns: None
> - args: Value: `Object`
> <br>

> ## Bucket:DetAtDNU()
> - desc: deletes the entry at an index without updating keys
> - returns: None
> - args: Index: `Number`
> <br>
