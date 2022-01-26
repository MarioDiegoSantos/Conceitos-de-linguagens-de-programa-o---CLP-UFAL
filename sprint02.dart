
class Pagamentos {
// implementação do caso de uso gerar boleto
   late String nome_cliente;
   late int num_boleto;
   late double num_valor;
   late string data_pagamento;
   late string data_vencimento;

  String get nome => nome_cliente;
  void set nome(String value) => nome_cliente = value;

  int get boleto => num_boleto;
  void set boleto(int value) => num_boleto = value;

  double get  valor => num_valor;
  void set valor (double value) =>  num_valor = value;

  //sprint 01
  void pagarboleto() {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do boleto: ${num_valor}');
    print('Número do boleto: ${num_boleto}');
    print("Pagamento do boleto efetuado com sucesso!");
    print("****************************************");
  }
  void gerarboleto() {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do boleto: ${num_valor}');
    print('Número do boleto: ${num_boleto}');
    print("boleto gerado com sucesso!");
    print("****************************************");
  }

  void imprimirboleto() {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do boleto: ${num_valor}');
    print('Número do boleto: ${num_boleto}');
    print("Impressão do boleto feita com sucesso!");
    print("****************************************");
  }

  //sprint 02

   void agendarPagamento() {
     print('Nome do cliente: ${nome_cliente}');
     print('Valor do boleto: ${num_valor}');
     print('Número do boleto: ${num_boleto}');
     print('Número do boleto: ${data_pagamento}');
     print('Número do boleto: ${data_vencimento}');
     print("Agendamento do pagamento feito com sucesso!");
     print("****************************************");
   }
   
}

void main() {

  Pagamentos cliente = new Pagamentos();
  cliente.nome = 'Rafael';
  cliente.boleto = 0001;
  cliente.valor = 50;

  Pagamentos cliente2 = new Pagamentos();
  cliente2.nome = 'Marisa';
  cliente2.boleto = 0002;
  cliente2.valor = 150;

  cliente.pagarboleto();
  cliente.gerarboleto();
  cliente.imprimirboleto();
  cliente.agendarPagamento();

  cliente2.pagarboleto();
  cliente2.gerarboleto();
  cliente2.imprimirboleto();
  cliente2.agendarPagamento();

}
