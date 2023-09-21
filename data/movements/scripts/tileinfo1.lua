local storages = {13001} -- storages que ser�o verificadas

local message = [[

( Guia Nto Fun )

Voc� est� pronto para iniciar uma nova jornada ? !

1� Escreva !jutsu para verificar seus jutsus dispon�veis.
2� Procure por criaturas no subsolo de Konoha para adquirir experi�ncia.
3� N�o perca tempo, come�e j� suas miss�es com o NPC Naruto Task, para se tornar um Kage!!.
4� Utilize os nossos canais de comunica��o : Help, Chat!

]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0  then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13001, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end