local config = { 
storage = 3482101,
cooldown = 40,  --- tempo entre um uso e outro
duration = 5, --- dura��o
effect1 = 365 -- efeito que sai ao falar a spell
} 


local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration * 1000, false)


function onCastSpell(cid, var)
  
  if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
setPlayerStorageValue(cid, 55695, os.time())
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doCreatureSay(cid,"Inatingivel!", 19)
doAddCondition(cid, outfit)
doPlayerSendTextMessage(cid, 27, "You have now ".. config.duration .." seconds of invulnerability.")
else
doPlayerSendCancel(cid, "Your skill is in cooldown, you must wait "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." seconds.")
return false
end  
    return true
end