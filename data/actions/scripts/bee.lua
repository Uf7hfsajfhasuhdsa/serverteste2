local voca = 12 -- Mude para a voca��o que quiser
function onUse(cid, item, frompos, item2, topos)
if not isPlayer(item2.uid) then
doPlayerSendCancel(cid, "Isto n�o e um player")
return false
end
if getCreatureName(item2.uid) ~= getCreatureName(cid) then
doPlayerSendCancel(cid, "Use a runa em voc�")
return false
end
doPlayerSetVocation(cid, voca)
doRemoveItem(item.uid)
doPlayerSendTextMessage(cid, 21, "Voc� ser� desconectado, para mudar sua voca��o.")
addEvent(doRemoveCreature, 5*1000, cid, true)
return true
end