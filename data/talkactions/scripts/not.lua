function onSay(cid, words, param)
	local text = ""
	function addtext(texto)
		text = text .. "\n" .. texto
	end
	addtext("     Noticias e Atualiza��es")
	addtext("Reborn e Level 350")
	addtext("'Novas' transforms adicionado.")
	addtext("Para se transformar fale {transformar}")
	addtext("Para reverter e so deslogar.")
	addtext("\n     Comandos:")
	addtext("")
	addtext("spells - mostra as magias")
	addtext("comandos - mostra os comandos")
	addtext("transinfo - mostra os comandos de transforma��es")
	addtext("")
    doShowTextDialog(cid, 2175, text)
    return TRUE
end