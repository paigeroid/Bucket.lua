---
# bucket lua
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

    { key = "val" } -- pair

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

> ## Bucket:Get()
> - desc: returns the value of a key
> - returns: Value: `Object`
> - args: Key: `String`

> ## Bucket:Length()
> - desc: returns the length of the bucket
> - returns: `Number`
> - args: None
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
