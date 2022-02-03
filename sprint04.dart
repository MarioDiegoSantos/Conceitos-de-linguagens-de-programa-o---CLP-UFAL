import 'dart:io';

class Pagamentos {
// implementação do caso de uso gerar boleto
  late String agencia_cliente;
  late String nome_cliente;
  late String conta_cliente;
  late String cpf_cliente;

  late int num_boleto;
  late double num_valor;
  late double num_saldo;
  late double num_limite;

  String get nome => nome_cliente;
  void set nome(String value) => nome_cliente = value;

  String get agencia => agencia_cliente;
  void set agencia(String value) => agencia_cliente = value;

  String get conta => conta_cliente;
  void set conta(String value) => conta_cliente = value;

  String get cpf => cpf_cliente;
  void set cpf(String value) => cpf_cliente = value;

  int get boleto => num_boleto;
  void set boleto(int value) => num_boleto = value;

  double get valor => num_valor;
  void set valor(double value) => num_valor = value;

  double get saldo => num_saldo;
  void set saldo(double value) => num_saldo = value;

  double get limite => num_limite;
  void set limite(double value) => num_limite = value;

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

  void pagarpix() {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do pix: ${num_valor}');
    print('Número do boleto: ${num_boleto}');
    print('Saldo após o pix ${num_saldo - num_valor}');
    print("Impressão do boleto feita com sucesso!");
    print("****************************************");
  }

  void pagarted() {
    print('Agência: ${agencia_cliente}');
    print('Conta: ${conta_cliente}');
    print('CPF ${cpf_cliente}');
    print('Banco: Oxebank ');
    print("Impressão do boleto feita com sucesso!");
    print("****************************************");
  }
}

void deposito(Pagamentos cliente) {
  int escolha;
  cliente.nome = 'Rafael';
  cliente.boleto = 0001;
  cliente.valor = 201;
  cliente.saldo = 100;
  cliente.limite = 1000;
  cliente.agencia = '001';
  cliente.conta = '0010020';
  cliente.cpf = '321.879.674-63';

  print('Agendar => [1]');
  print('Agora => [2]');

  int pagamento = int.parse(stdin.readLineSync()!);

  if (pagamento == 1) {
    print('PIX => [1]');
    print('TED => [2]');
    print('Boleto => [3]');
    escolha = int.parse(stdin.readLineSync()!);

    // 1: Pix.
    // 2: TED.
    // 3: Boleto

    switch (escolha) {
      case 1:
        ((cliente.saldo) - (cliente.valor) <= cliente.limite)
            ? print(
                "Você ultrapassou seu limite, infelizmente seu deposito não pode ser feito.")
            : cliente.pagarpix();
        break;
      case 2:
        cliente.pagarted();
        break;
      case 3:
        ((cliente.saldo) - (cliente.valor) <= cliente.limite)
            ? print(
                "Você ultrapassou seu limite, infelizmente seu deposito não pode ser feito.")
            : cliente.pagarboleto();
        break;
    }
    print("Escreva o horario que desejas fazer o pagamento: ");
    int horario = int.parse(stdin.readLineSync()!);
    print('horario: $horario');
  } else {
    print('PIX => [1]');
    print('TED => [2]');
    print('Boleto => [3]');
    escolha = int.parse(stdin.readLineSync()!);

    // 1: Pix.
    // 2: TED.
    // 3: Boleto.

    switch (escolha) {
      case 1:
        ((cliente.saldo) - (cliente.valor) <= cliente.limite)
            ? print(
                "Você ultrapassou seu limite, infelizmente seu deposito não pode ser feito.")
            : cliente.pagarpix();
        break;
      case 2:
        cliente.pagarted();
        break;
      case 3:
        ((cliente.saldo) - (cliente.valor) <= cliente.limite)
            ? print(
                "Você ultrapassou seu limite, infelizmente seu deposito não pode ser feito.")
            : cliente.pagarboleto();
        break;
    }
  }
}

void gerador_boleto(Pagamentos cliente) {
  // gerarboleto();
  // imprimirboleto();
}

void main() {
  Pagamentos cliente = new Pagamentos();

  // Conta -> ID, saldo, limite, Escolha.
  // Pix -> Chave pix unica.
  // Ted -> Agência, conta, cpf, Banco.
  // Boleto -> Numeração da barra de notas.
  // Devolver saldo da pessoa pos gasto, ID, efetuação.

  /*
    1 - Gerar boleto.
    2 - Imprimir boleto.
    3 - Pagar boleto.
    4 - Deposito
    5 - Sair do programa.

  */

  while (true) {
    print('GERAR BOLETO => [1]');
    print('IMPRIMIR BOLETO => [2]');
    print('PAGAR BOLETO => [3]');
    print('DEPOSITO => [4]');
    print('ENCERRAR O PROGRAMA => [5]');

    int escolha = int.parse(stdin.readLineSync()!);
    switch (escolha) {
      case 1:
        gerador_boleto(cliente);
        break;
      // case 2: imprime_boleto(); break;
      // case 3: pagar_boleto(); break;
      case 4:
        deposito(cliente);
        break;
      case 5:
        exit(exitCode);
    }
  }
}
