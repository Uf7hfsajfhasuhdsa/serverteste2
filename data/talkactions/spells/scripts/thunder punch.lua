local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10008)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -9.0, 0, -13.5, 0)



local arr = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 3, 0},
}

 
  local area = createCombatArea(arr)

setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
