function onDeath(cid, corpse, killer)

local M ={
["Crystal Vilarejo"] = {Pos = {x=1721,y=1072,z=5},id= 1546 ,time = 60000},
}

local x = M[getCreatureName(cid)]
function criar()
local parede = getTileItemById(x.Pos, x.id)
doCreateItem(x.id, 1, x.Pos)
end
if x then
local parede = getTileItemById(x.Pos, x.id)
if parede then
doRemoveItem(parede.uid, 1)
doCreatureSay(cid, "A parede Ser� criada Novamente em "..x.time.." segundos.", TALKTYPE_ORANGE_1)
addEvent(criar, x.time*1000)
end
end
return TRUE
end