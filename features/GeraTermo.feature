#language: pt
#utf-8

@GeraTermoSare


Funcionalidade: Gerar Termo
  Eu como usuario do sistema SARE
  Quero executar um roteiro automatizado
  Para criar Termos

@deslogar_sigam

  Cenario: Criar Termo
  	Dado que esteja tela de cadastro do Sare
  	Quando preencher todos os campos do projeto
  	Então o sistema criará o Projeto SARE