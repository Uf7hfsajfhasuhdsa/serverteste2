-- [( Script Criado Por Baiakzik Zonaxgames )] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Para conseguir avan�ar na sua gradua��o, basta voce concluir as miss�es do Naruto Task.",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)])
return TRUE
end




