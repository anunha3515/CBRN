require 'faker'
class InsereDados
    def InsereDados.inicio(nomeCAR)
	find("[src='imagens/logo/CAR.png']").click
	#Validação para identificar se já possui CAR
	if assert_text("Cadastrar Nova Propriedade")
		find(:link, "Cadastrar Nova Propriedade").click
		puts("Já existe car para este usuário")
	else
		puts("Não existe CAR para este usuário, criando seu primeiro CAR")
	end
	#fim da validação
    find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBCadastro_carCadastro_rblTipo_0").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBCadastro_carCadastro_chkPropriedade_0").click
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$nomPropriedade', :with => nomeCAR)
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$desEndereco', :with => "Av Professor Frederico Hermann JR")
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$nomBairro', :with => "Alto de Pinheiros")
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$numCEP', :with => "03259000")
	select('ILHABELA', :from => 'ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$ddlMunicipio')
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$numArea', :with => "2702")
	fill_in('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBCadastro$carCadastro$area2008', :with => "2702")
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBCadastro_carCadastro_chkAtividade_1").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBCadastro_carCadastro_rblQualificacao_0").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBCadastro_carCadastro_cmdAtualiza").click
end
   
	def InsereDados.DesenhaPropriedade
	find(:link, "Mapa").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl02_btnGeo").click
	#Inicio da Iteração com Iframe
	page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
	find("[title='Desenhar forma']").click
	#map = o local onde será realizado o desenho
	map = find(:id, "ucCARAreaMapa_ucCARGMapSketch1_CarGMap").native
	page.driver.browser.action.move_to(map,565, 354).click.perform
	page.driver.browser.action.move_to(map,625, 343).click.perform
	page.driver.browser.action.move_to(map,623, 380).click.perform
	page.driver.browser.action.move_to(map,564, 359).click.perform
	#Fecha a iteração com o Iframe

	#clica na opção salvar
	find("[title='Clique para salvar o estado do mapa']").click
	sleep(10)
	page.driver.browser.switch_to.alert.accept
	find(:id, "ucCARAreaMapa_btnFechaMapaInclusao").click
	sleep(5)
    end

    def InsereDados.NaoExiste
    #seleciona as opções de "Não Existe"
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl03_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl05_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl06_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl07_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl08_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl09_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl10_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl12_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl13_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl14_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl15_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl16_chkNaoExiste").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl17_chkNaoExiste").click
#termino da selecão
    end

    def InsereDados.DesenhaUC(usuario)
    #desenhando área de UC
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_gvConsulta_ctl18_btnGeo").click
	page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
	find("[title='Desenhar forma']").click
	map = find(:id, "ucCARAreaMapa_ucCARGMapSketch1_CarGMap").native
	page.driver.browser.action.move_to(map,664, 236).click.perform
	page.driver.browser.action.move_to(map,748, 229).click.perform
	page.driver.browser.action.move_to(map,753, 276).click.perform
	page.driver.browser.action.move_to(map,669, 283).click.perform
	page.driver.browser.action.move_to(map,666, 241).click.perform
	sleep(10)
	#inicio da interação com o iframe de atributos
	page.driver.browser.switch_to.frame(0)
	#validacao para interagir com campos, caso seja o usuário da marianab
	if usuario == "marianab"
	processo = "1919501" #idProcesso EST-CAR: 1919501
	select("Cerrado", :from => "ctl01$ddlBioma")
	sleep(5)
	fill_in("ctl01$txtIdentificadorDoProcesso", :with => processo)
	sleep(5)
	find(:id, "ctl01_txtProcessoAno").click
	end
	sleep(5)
	find(:link, "Salvar Atributos").click
	sleep(10)
	#Fim da interação com o iframe de atributos
	#retorna para o iframe do desenho
	page.driver.browser.switch_to.frame(1)
	find(:link, "Sair do Mapa").click
	sleep(10)
    end

    def InsereDados.final
    #clica na aba Domínio
	find(:id, "__tab_ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBDominio").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBDominio_carDominio_TabDominio_TBMatricula_carMatricula_cmdInclui").click
	select("Guarulhos", :from =>"ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBDominio$carDominio$TabDominio$TBMatricula$carMatricula$ddlComarca")
	fill_in("ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBDominio$carDominio$TabDominio$TBMatricula$carMatricula$nomCartorio", :with => "1234")
	fill_in("ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBDominio$carDominio$TabDominio$TBMatricula$carMatricula$numMatricula", :with => "1234")
	fill_in("ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBDominio$carDominio$TabDominio$TBMatricula$carMatricula$livro", :with => "1234")
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBDominio_carDominio_TabDominio_TBMatricula_carMatricula_cmdAtualiza").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBFinaliza_spanFinalizar").click
	#aba Finaliza
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBFinaliza_carFinaliza_flaInformacao").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBFinaliza_carFinaliza_flaCiencia").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBFinaliza_carFinaliza_flaNotificaEmail").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBFinaliza_carFinaliza_cmdFinaliza").click
	sleep(5)
	page.driver.browser.switch_to.alert.accept
    sleep(5)
    end
end