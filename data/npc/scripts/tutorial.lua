local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid)	end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)	end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()	npcHandler:onThink()	end
 
npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|. Quer Ajuda?. Basta dizer essas palavras {boss}, {hunts}, {tasks}, {events}, e tirar� todas suas d�vidas.")
 
keywordHandler:addKeyword({'boss'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voc� pode encontrar os BOSS colando este link em seu navegador {https://i.imgur.com/Ffd8xei.jpg}'})
keywordHandler:addKeyword({'hunts'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voc� pode encontrar as HUNTs colando este link em seu navegador {http://bit.ly/2iRs3B8}'})
keywordHandler:addKeyword({'tasks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voc� precisa pedir a miss�o para a {Hokage Tsunade}, para ver suas Miss�es dia {!task}'})
keywordHandler:addKeyword({'events'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'N�s temos eventos di�rios {invas�es as 20:00h hor�rio de bras�lia} e tamb�m {Castle War as 21:00 hor�rio de bras�lia} '})

npcHandler:addModule(FocusModule:new())