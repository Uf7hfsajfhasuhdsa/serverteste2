local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 39)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -27, -28, -29, -30)

function onCastSpell(cid, var)

local storage = 2
local time = 1
		if exhaustion.check(cid, storage) == false then
        exhaustion.set(cid, storage, time)

local eff = 66 -- Efeito
local target = getCreatureTarget(cid)
local position = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
doSendMagicEffect(position, eff)

local eff = 74 -- Efeito
local target = getCreatureTarget(cid)
local position = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
doSendMagicEffect(position, eff)

return doCombat(cid, combat, var)
else
     doPlayerSendCancel(cid, "Exausted")
  end
end