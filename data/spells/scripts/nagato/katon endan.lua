local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 40)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -18, -19, -20, -21)
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end