function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 20184) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou Ganhar a Kiba Sword")
local bag = doPlayerAddItem(cid, 7868, 1)
setPlayerStorageValue(cid, 20184, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return TRUE
end