---
# bucket lua
by paigeroid

<br>

A recreation of my Node.JS Stews package in Lua for use in projects

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
the way it's structured if you don't provide a key it'll default to its index<br>
despite this most of the functions distinguish between the types to make it work best
```lua
local bucket = Bucket.new({
    "a",
    { b = "val" }
})


bkt:IndexOf("a") -- 1

bkt:IndexOf("b") -- 2
```
for string stuff there's a unique syntax for it:
- (( )) = start and end of the bucket
- ( ) = another bucket
- { } = a table
- [  ] = a pair
- \* = a key

pairs are represented like this
```lua
[ *key => value ]
```
tables are represented like this
```lua
{ Table (lx) }
```
other buckets are represented like this
```lua
( Bucket (lx) )
```
