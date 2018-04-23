require 'faker'
Dado("que esteja tela de cadastro do Sare") do
   link = "http://exec-dev01.sma.local/SMA-EST-CAR_test/"
   visit(link)
   RealizaLogin.acesso(usuario = "leilacm")
   find("[src='imagens/logo/SARE.png']").click
   find(:id, "ctl00_conteudo_ctl00_rptrMenu_ctl00_imgLogo").click
  end
  
  Quando("preencher todos os campos do projeto") do
    PreencheSare.cadastroInicial(nomeSare = "Projeto " +  Faker::Name.first_name)
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Jurídica")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Física")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Representante legal", tipoPessoa = "Física")
  
    find(:id, "__tab_ctl00_conteudo_TabNavegacao_TBArea").click
    find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_cmdInclui").click
    fill_in("ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$nomArea", :with => "Projeto SARE Automatizado")
    find("[value='ATLANTICA']").click
    sleep(5)
    select("Florestas Ombrófilas ou Estacionais", :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlFitofisionomia")
    select("Unidade de Conservação Estadual", :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlTipologia")
    fill_in("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBCadastroSemCar_areaCadastroSemCar_dpUC_txtText_Input", :with => "APA CABREUVA")
    sleep(5)
    find(:id, "__tab_ctl00_conteudo_TabNavegacao_TBArea").click
    select("GUARULHOS", :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlMunicipio")
    sleep(5)
    find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBCadastroSemCar_areaCadastroSemCar_cmdAtualiza").click
    find(:link, "Mapa").click
    find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl02_btnGeo").click
    page.driver.browser.switch_to.frame("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_ifrmMapa")
    find("[title='Desenhar forma']").click
    map = find(:id, "GMap").native
    page.driver.browser.action.move_to(map,565, 354).click.perform
  	page.driver.browser.action.move_to(map,625, 343).click.perform
	  page.driver.browser.action.move_to(map,623, 380).click.perform
    page.driver.browser.action.move_to(map,564, 359).click.perform
    sleep(5)

    binding.pry
    page.driver.browser.switch_to.frame(0)
    find('#txtNome').set('Propriedade Automatizada')
    find('#txtEndereco').set("Av Professor Hermann Jr")
    find("#txtComplemento").set("Sobrado - Teste Automatizado")
    find('#txtBairro').set("Alto de Pinheiros")
    find('#txtCep').set("03259000")
    find('#txtReferencia').set("Teste Automatizado do Koritar")
    find(:link,"Adicionar Dominialidade").click
    select("Amparo", :from => "ddlComarca")
    fill_in("txtCartorio", :with => "12345")
    fill_in("txtNumMatricula", :with => "1234")
    find("#rblPosse_0").click
    fill_in("txtPosse", :with => "12345")
    find(:link, "Adicionar").click
    find(:link, "Salvar Atributos").click
    sleep(3)
    page.driver.browser.switch_to.frame("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_ifrmMapa")
    find("[title='Clique para salvar o estado do mapa']").click
    sleep(10)
    textoSalvaMapa = page.driver.browser.switch_to.alert.text
    puts(textoSalvaMapa)
    page.driver.browser.switch_to.alert.dismiss
    find(:link, "Fechar").click
    sleep(5)

    #marca nao existe

    check("ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBMapa$MapaAreaSemCar$gvConsulta$ctl03$chkNaoExiste")
    check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl04_chkNaoExiste")
    check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl05_chkNaoExiste")
    check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl06_chkNaoExiste")
    check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl07_chkNaoExiste")

    find("#ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl08_btnGeo").click

    page.driver.browser.switch_to.frame("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_ifrmMapa")
    find("[title='Desenhar forma']").click
    map = find(:id, "GMap").native
    page.driver.browser.action.move_to(map,664, 236).click.perform
    page.driver.browser.action.move_to(map,748, 229).click.perform
    page.driver.browser.action.move_to(map,753, 276).click.perform
    page.driver.browser.action.move_to(map,669, 283).click.perform
    page.driver.browser.action.move_to(map,666, 241).click.perform
    
    sleep(5)

    find("[title='Clique para salvar o estado do mapa']").click
    page.driver.browser.switch_to.alert.dismiss
    find(:link, "Fechar").click
    sleep(5)

  end
  Então("o sistema criará o Projeto SARE") do
    #
  end