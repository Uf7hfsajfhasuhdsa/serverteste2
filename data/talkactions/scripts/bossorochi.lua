local t = {
    msgActive = "[Sala de Invasao] Orochimaru ira aparecer...",
    msgSpawn = "[Sala de Invasao] Orochimaru apareceu !!.",
    coolDown = 1,                    -- Tempo para nascer ap�s usar o comando.
    boss = "Orochimaru",                    -- Nome do boss.
    pos = {x = 1447, y = 839, z = 8}   -- Posi��o em que o boss ir� nascer.
}

function onSay(cid, words)
    local function summonBoss()
	doSendMagicEffect(t.pos, CONST_ME_TELEPORT)
        doCreateMonster(t.boss, t.pos)
        doBroadcastMessage(t.msgSpawn)
    end

    doBroadcastMessage(t.msgActive)
    addEvent(summonBoss, t.coolDown * 60 * 1000)

   return true
end