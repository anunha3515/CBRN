require 'faker'
require "cpf_cnpj"
class PreencheSare

    def PreencheSare.cadastroInicial(nomeSare)
        find(:link, "Cadastrar projetos com dispensa de CAR").click
        #aba Cadastro
        select('Exigência da CETESB', :from => 'ctl00$conteudo$TabNavegacao$TBCadastro$ProjetoCadastroSemCar$ddlMotivo')
        fill_in("ctl00$conteudo$TabNavegacao$TBCadastro$ProjetoCadastroSemCar$nomProjeto", :with => nomeSare)
        anoProcesso = "2015"
        find(:id, "ctl00_conteudo_TabNavegacao_TBCadastro_ProjetoCadastroSemCar_PesqProcesso_cmdExibeGrid").click
        #preenche o grid secundário
        fill_in("ctl00$conteudo$TabNavegacao$TBCadastro$ProjetoCadastroSemCar$PesqProcesso$txtFiltroAnoProcesso", :with => anoProcesso)
        find(:link, "Pesquisar").click
        find(:id, "ctl00_conteudo_TabNavegacao_TBCadastro_ProjetoCadastroSemCar_PesqProcesso_gvConsulta_ctl02_rbRefDocumento").click
        numProcesso = find("#ctl00_conteudo_TabNavegacao_TBCadastro_ProjetoCadastroSemCar_PesqProcesso_txtNumProcesso").value
        puts("O processo vinculado é o : " + numProcesso)
        #Endereço
        fill_in("ctl00$conteudo$TabNavegacao$TBCadastro$ProjetoCadastroSemCar$txtEndereco", :with => "Rua Automatizada")
        select("GUARULHOS", :from => "ctl00$conteudo$TabNavegacao$TBCadastro$ProjetoCadastroSemCar$ddlMunicipio")
        find(:link, "Atualizar").click
    end

    def PreencheSare.Pessoa(nomPessoa,funcaoPessoa,tipoPessoa)
        find(:link, "Pessoas").click
        find("[title='Adiciona uma Nova Pessoa']").click
        cpfPessoa = CPF.generate
        cnpjPessoa = CNPJ.generate

        if tipoPessoa == "Física"
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$CPFCNPJ", :with => cpfPessoa)
        else
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$CPFCNPJ", :with => cnpjPessoa)
        end
        
        find(:link, "Confirmar").click
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$nomPessoa", :with => nomPessoa)
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$desEndereco", :with => "Rua Testes QA")
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$nomBairro", :with => "Alto de Pinheiros")
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$CEP", :with => "03259000")
        select("Guarulhos", :from => "ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$ddlMunicipio")
        select(funcaoPessoa, :from => "ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$ddlFuncao")
        emailPessoa = "lucas.koritar@globalweb.com.br"
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$Email", :with => emailPessoa)
        find(:link, "Cadastro Pessoas").click
        fill_in("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBCadastroPessoas$pesPessoa$EmailConfirma", :with => emailPessoa)

        if funcaoPessoa == "Representante legal"
        find("[title='Grava os dados da Pessoa']").click
        textoPopUp = page.driver.browser.switch_to.alert.text
        puts (textoPopUp)
        page.driver.browser.switch_to.alert.accept
        find(:link, "Compromissário(s) Representado(s)").click
        check("ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBRepresentanteLegal$responsavelTermo$gvCompromissarios$ctl02$chkCompromissario")
        sleep(3)
        find("[title='Adicionar compromissários']").click
        sleep(3)
        attach_file('ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBRepresentanteLegal$responsavelTermo$fileUpload$ctl02', 'C:\Projetos\CAR_SARE_PRA\anexos\Teste.pdf')
        sleep(10)
        find(:link, "Adicionar Anexos").click
        sleep(3)
        find("[title='Grava as alterações']").click
        find(:id, "ctl00_conteudo_TabNavegacao_TBPessoa_ProjetoPessoa_TabNavegacao_TBRepresentanteLegal_responsavelTermo_cmdFinaliza").click
        end

        if funcaoPessoa == "Compromissário"
        find("[title='Grava os dados da Pessoa']").click
        validaMensagem = find("#ctl00_conteudo_TabNavegacao_TBPessoa_ProjetoPessoa_TabNavegacao_TBCadastroPessoas_pesPessoa_lblMensagem").text
        puts(validaMensagem)
        find("[title='Salva os dados e retorna para a Consulta']").click
        end

    end
end