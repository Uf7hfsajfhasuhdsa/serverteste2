local min = 45000 -- dano minimo.
local max = 50000 -- dano m�ximo. 

local areaa = createCombatArea {         -- �rea da explos�o.
   {0, 0, 1, 0, 0},
   {0, 1, 1, 1, 0},
   {1, 1, 3, 1, 1},
   {0, 1, 1, 1, 0},
   {0, 0, 1, 0, 0}
}

local storage = 123654  -- A mesma storage do script anterior.

function onCastSpell(cid, var)
if getPlayerStorageValue(cid, storage) - os.time() >= 0 then
   for _, pid in ipairs(getCreatureSummons(cid)) do
     doAreaCombatHealth(cid, COMBAT_FIREDAMAGE, getCreaturePosition(pid), areaa, -min, -max, 15)
      doRemoveCreature(pid)
   end
end

return true
end