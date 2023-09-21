local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 233)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -8.0, 0, -9.0, 0)


function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end