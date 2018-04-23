require 'faker'
usuario = "55613853720"
link = "http://exec-dev01.sma.local/SMA-EST-CAR_test/"
Dado("que esteja na tela de cadastro do CAR") do
	visit(link)
	RealizaLogin.acesso(usuario)
end

Quando("preencher todas as informações") do
	InsereDados.inicio(nomeCAR = "Exc Fazenda " +  Faker::Name.first_name)
end

Então("o sistema criará o CAR") do
	find(:id, "__tab_ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBDeclaracao").click
	find(:id, "ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBDeclaracao_carDeclaracao_gvConsulta_ctl07_chkDeclara").click
	if link == "http://exec-dev01.sma.local/sigam-adequacao-test/"
	page.driver.browser.switch_to.alert.accept
	end
	InsereDados.DesenhaPropriedade
	InsereDados.NaoExiste
	InsereDados.DesenhaUC(usuario)
	InsereDados.final
	@numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Excedente criado com sucesso no ambiente de Teste e seu número é: " +  @numCar)
end