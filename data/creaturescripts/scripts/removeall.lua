﻿function onDeath(cid, corpse, killer)

local M ={
["Sasori"] = {Pos = {x=696,y=558,z=8},id= 8475 ,time = 60},
["Obito Uchiha"] = {Pos = {x=908,y=691,z=6},id= 1025 ,time = 60},
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
				 doCreatureSay(cid, "A parede Será criada Novamente em "..x.time.." segundos.", TALKTYPE_ORANGE_1)
				addEvent(criar, x.time*1000)
		end
end
return TRUE
end