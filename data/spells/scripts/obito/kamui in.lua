local config = {
pos = {x=106, y=37, z=6}, -- posi��o que ser� teleportado
tempo = 20, -- tempo pra voltar
effect1 = 196, -- efeito ao ser teleportado
effect2 = 196, -- efeito ao voltar
storage = 19329, -- storage que fica guardado o cooldown
from = {x=75, y=18, z=6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=136, y=57, z=6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
cooldown = 40, --- tempo entre um uso e outro (ap�s usar a spell vc vai ficar X segundos sem poder usar ela novamente)
msg = "KAMUI OUT!" -- mensagem ao sair do kamui
}

local exceptions = {'trainer', 'obito', 'orochimaru', 'hachibi', 'kyuubi', 'bot afk', 'uchiha bunshin', 'hoshigaki bunshin', 'konoha elite jounnin', 'obito uchiha', 'tsunade lendary sannin', 'sasori', 'kisame', 'itachi', 'zabuza boss', 'orochimaru boss', 'kakashi boss', 'kimimaru boss', 'sasuke boss', 'naruto boss', 'tobirama boss', 'kazekage boss', 'yondaime boss', 'gaara boss', 'jiraya boss', 'raikage boss', 'sasuke akatsuki boss', 'tobi boss' , 'snake', 'wolf', 'gennin', 'chunnin', 'jounnin', 'haku', 'zabuza', 'joroubo', 'kidoumaro', 'tayuya', 'sakon', 'unknow', 'shinobi star', 'gamaken', 'anbu', 'suiton shinobi', 'cursed ghost', 'shinobi of the blades', 'mutant creature', 'black shinobi', 'red shaolin', 'sand jounin', 'black anbu', 'unknow akatsuki', 'kazuma', 'sword master', 'uchiha itachi', 'manda', 'perfect anbu', 'lider guard', 'master shinobi', 'white zetsu', 'black snake', 'jya', 'kyodai', 'kyodaijya', 'shukaku', 'gamakem', 'guruko', 'katsuyu', 'kuchyose manda', 'gama bunta', 'mokuton bunshin', 'raiton bunshin', 'mizu bunshin', 'kami bunshin', 'suiton bunshin', 'jibaku bunshin', 'sasori puppet', 'kuroari', 'karasu', 'sanshouo', 'kikai', 'kikaichuu', 'kikai muchidama', 'rinnegan one', 'rinnegan two', 'rinnegan three', 'rinnegan four', 'kuchyose black snake', 'pakkun', 'buru', 'clone', 'kage bunshin'} --- nome das criaturas que n�o poder�o ser levadas pro kamui (sempre em min�sculo e entre aspas)


function canEffect(pos, pz, proj) -- Night Wolf based on Nord
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTilePzInfo(pos) and not pz then return false end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end




function onCastSpell(cid, var)
if BlockRunesInArea(cid) then
doPlayerSendCancel(cid, "voc� n�o pode jogar runas nesta area.") return false
end
local pos = getPlayerPosition(cid)


if isInRange(pos, config.from, config.to) then
doPlayerSendCancel(cid, "You cannot use Kamui spell inside the Kamui!")
return false
end


if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
doPlayerSetStorageValue(cid, config.storage, os.time())
if isCreature(getCreatureTarget(cid)) then
target = getCreatureTarget(cid)
for i = 1, #exceptions do
if getCreatureName(target):lower() == exceptions[i] then
doPlayerSendCancel(cid, "You can't take ".. getCreatureName(target) .." to Kamui.")
return false
end
end
--------------- PLAYER-----------
addEvent(doTeleportThing, 1000*config.tempo, cid, pos, true)
addEvent(doCreatureSay, 1000*config.tempo, cid, config.msg, 20, false)
addEvent(doSendMagicEffect, 1000*config.tempo, pos, config.effect2)
doSendMagicEffect(pos, config.effect1)
doTeleportThing(cid, config.pos)
-------------------- OPONENTE ----------------
addEvent(doTeleportThing, 1000*config.tempo, target, getThingPos(target), true)
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(target), config.effect2)
doSendMagicEffect(getThingPos(target), config.effect1)
doTeleportThing(target, config.pos)
-------------------------------------
if isPlayer(target) and isCreature(cid) then
doPlayerSendTextMessage(target, 27, "You were teleported by ".. getCreatureName(cid) ..".")
end
if isPlayer(cid) and isCreature(target) then
doPlayerSendTextMessage(cid, 27, "You teleported ".. getCreatureName(target) .."!")
end
for i = 1,config.tempo  do
addEvent(function()
if isPlayer(target) then
doPlayerSendTextMessage(target,27,"You'll be back in " .. config.tempo -i +1 .. " second(s)")
end
if isPlayer(cid) then
doPlayerSendTextMessage(cid,27,"You'll be back in " .. config.tempo -i +1 .. " second(s)")
end
end, 1000*i)
end
else
---------- levar quem t� em volta do player ---------------
local teleportPosition = {
{x = pos.x, y = pos.y - 1, z = pos.z},
{x = pos.x, y = pos.y + 1, z = pos.z},
{x = pos.x - 1, y = pos.y, z = pos.z},
{x = pos.x + 1, y = pos.y, z = pos.z},
{x = pos.x - 1, y = pos.y + 1, z = pos.z},
{x = pos.x - 1, y = pos.y - 1, z = pos.z},
{x = pos.x + 1, y = pos.y - 1, z = pos.z},
{x = pos.x + 1, y = pos.y + 1, z = pos.z}
}


local mobas = {}
local checker = 0


 for _, tPos in ipairs(teleportPosition) do
doSendMagicEffect(tPos, config.effect2)
local mob = getTopCreature(tPos).uid
    if canEffect (tPos) and mob ~= 0 and (isMonster(mob) or isPlayer(mob)) then
for i = 1, #exceptions do
if getCreatureName(mob):lower() == exceptions[i] then
checker = 1
break
end
end
if checker ~= 1 then
table.insert(mobas, mob) 
end
end
end


if #mobas > 0 then
for _, pid in ipairs(mobas) do
addEvent(doTeleportThing, 1000*config.tempo, pid, getThingPos(pid), true)
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(pid), config.effect2)
doSendMagicEffect(getThingPos(pid), config.effect1)
doTeleportThing(pid, config.pos)
if isPlayer(pid) and isCreature(cid) then
doPlayerSendTextMessage(pid, 27, "You were teleported by ".. getCreatureName(cid) ..".")
end
for i = 1,config.tempo  do
addEvent(function()
if isPlayer(pid) then
doPlayerSendTextMessage(pid,25,"You'll be back in " .. config.tempo -i +1 .. " second(s)")
end
end, 1000*i)
end
end
end
----------------------------
addEvent(doTeleportThing, 1000*config.tempo, cid, pos, true)
addEvent(doCreatureSay, 1000*config.tempo, cid, config.msg, 20, false)
addEvent(doSendMagicEffect, 1000*config.tempo, pos, config.effect2)
doSendMagicEffect(pos, config.effect1)
doTeleportThing(cid, config.pos)
if isPlayer(cid) then
doPlayerSendTextMessage(cid, 27, "You teleported yourself.")
end
for i = 1,config.tempo do
addEvent(function()
if isPlayer(cid) then
doPlayerSendTextMessage(cid,25,"You'll be back in " .. config.tempo -i +1 .. " second(s)")
end
end, 1000*i)
end
end
else
doPlayerSendCancel(cid, "Your skill is in cooldown, you must wait "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." seconds.")
end
return true
end