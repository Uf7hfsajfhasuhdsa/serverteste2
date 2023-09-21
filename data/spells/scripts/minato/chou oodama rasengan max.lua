local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -32, 1, -34, 1)

function onCastSpell(cid, var)

local storage = 2
local time = 2.5
		if exhaustion.check(cid, storage) == false then
        exhaustion.set(cid, storage, time)
local player = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local enemypos = getCreaturePosition(target)

if target == isMonster or isCreature then
doTeleportThing(cid, enemypos)

local tPos = var.pos or getThingPos(var.number)
if tPos then
    tPos.x = tPos.x + 1
    tPos.y = tPos.y + 1
    doSendMagicEffect(tPos, 97)
end
end
return doCombat(cid, combat, var)
else
     doPlayerSendCancel(cid, "Exausted")
  end
end