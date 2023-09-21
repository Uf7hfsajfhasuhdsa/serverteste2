--[[Script By Vodkart]]--

function onSay(cid, words, param)

local config = {
pz = true, -- players precisam estar em protection zone para usar? (true or false)
battle = false, -- players deve estar sem battle (true or false)
custo = false, -- se os teleport ir�o custa (true or false)
need_level = false, -- se os teleport ir�o precisar de level (true or false)
premium = true -- se precisa ser premium account (true or false)
}

--[[ Config lugares]]--
local lugar = {
["konohagakure"] = { -- nome do lugar
pos = {x=1026, y=910, z=7},level = 5,price = 1000},
["sunagakure"] = { -- nome do lugar
pos = {x=509, y=961, z=7},level = 10, price = 2000},
["nami no kuni"] = { -- nome do lugar
pos = {x=247, y=1176, z=6},level = 10, price = 2000},
["kawa no kuni"] = { -- nome do lugar
pos = {x=1063, y=1308, z=7},level = 10, price = 2000},
["umi no kuni"] ={ -- nome do lugar
pos = {x=1213, y=1201, z=7},level = 20,price = 4000}
}

--[[ Lista de Viagem (N�o mexa) ]]--
if (param == "lista") then
local str = ""
str = str .. "lista de viagem :\n\n"
for name, pos in pairs(lugar) do
str = str..name.."\n"
end
str = str .. ""
doShowTextDialog(cid, 6579, str)
return TRUE
end


local a = lugar[param]
if not(a) then
doPlayerSendTextMessage(cid, 22, "desculpe,este lugar n�o existe")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.pz == true and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"voc� precisa estar em protection zone pra poder teleportar.")
return TRUE
elseif config.premium == true and not isPremium(cid) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas players com premium account podem teleportar.")
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voc� precisa estar sem battler pra poder teleportar.")
return TRUE
elseif config.need_level == true and getPlayerLevel(cid) < a.level then
doPlayerSendTextMessage(cid, 22, "Desculpe,Voce n�o tem level. voce precisa "..a.level.." level ou mais para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.custo == true and doPlayerRemoveMoney(cid, a.price) == FALSE then
doPlayerSendTextMessage(cid, 22, "Desculpe,voce nao tem dinheiro suficiente. Voce precisa "..a.price.." gp para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end
doTeleportThing(cid, a.pos)
doSendMagicEffect(a.pos, CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid, 22, "" .. getPlayerName(cid) .. " foi teleportado para: \n " .. param .. ".")
return TRUE
end