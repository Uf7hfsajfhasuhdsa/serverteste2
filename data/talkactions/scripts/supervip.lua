function onSay(cid, words, param)
if doPlayerRemoveItem(cid,2160,200) then
 	setPlayerStorageValue(cid,13700,1)
 	setPlayerStorageValue(cid,13700,1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MORTAREA)
doCreatureSay(cid, "VOC� SE TORNOU VIP UHU VOC� � FOD�O!!!", TALKTYPE_ORANGE_1)
else
doPlayerSendCancel(cid, 'voc� precisa de 200 gold bar para usar este comando.')
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FLAMEAREA)
end
end  