-- [( Script Criado Por Baiakzik Zonaxgames )] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Acesse o link http://bit.ly/mapcaves para informa��es de caves, tasks, e quests",
"Site para informa��es do servidor > http://ntoabshelp.webnode.com"
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end




