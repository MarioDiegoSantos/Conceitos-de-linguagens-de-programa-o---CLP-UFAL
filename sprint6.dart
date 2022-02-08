import 'dart:io';
import 'dart:math';
import 'agendar.dart' as tempo;

// constante pra pegar todas as letras do alfabeto junto com os numeros.
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
// Bascimante estamos pegando todos os elementos da constante, unidos em uma só, e pegando um indice aleatorio dessa constante.

class Pagamentos {
  var now = new DateTime.now();
  late String agencia_cliente;
  late String nome_cliente;
  late String conta_cliente;
  late String cpf_cliente;

  late double num_valor;
  late double num_saldo;
  late double num_limite_debito;
  late double num_limite_credito;

  String get nome => nome_cliente;
  void set nome(String value) => nome_cliente = value;

  String get agencia => agencia_cliente;
  void set agencia(String value) => agencia_cliente = value;

  String get conta => conta_cliente;
  void set conta(String value) => conta_cliente = value;

  String get cpf => cpf_cliente;
  void set cpf(String value) => cpf_cliente = value;

  double get valor => num_valor;
  void set valor(double value) => num_valor = value;

  double get saldo => num_saldo;
  void set saldo(double value) => num_saldo = value;

  double get limite_debito => num_limite_debito;
  void set limite(double value) => num_limite_debito = value;

  double get limite_credito => num_limite_credito;
  void set limite_credito(double value) => num_limite_credito = value;

  void pagarboleto(int dia, List<int> number, double valor) {
    num_saldo -= num_valor;
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do boleto: ${num_valor}');
    print(
        'Número do boleto: 00197.${(now.day + now.month + now.year) - dia}7 ${number.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', '').replaceAll(' ', '')} 00219.$valor $conta_cliente.0007');
    print('Saldo após o efetuamento do boleto: ${num_saldo}');
    print("Pagamento do boleto efetuado com sucesso!");
    print("****************************************");
  }

  void gerarboleto(int dia, List<int> number, double valor) {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do boleto: ${num_valor}');
    print(
        'Número do boleto: 00197.${(now.day + now.month + now.year) - dia}7 ${number.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', '').replaceAll(' ', '')} 00219.$valor $conta_cliente.0007');
    print("boleto gerado com sucesso!");
    print("****************************************");
  }

  void pagarpix(aux) {
    (saldo == true) ? num_saldo -= num_valor : num_saldo += num_valor;
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do pix: ${num_valor}');
    print('Chave Pix: ${getRandomString(16)}');
    if (aux == true)
      print('Saldo após o pagamento pix: ${num_saldo - num_valor}');
    else
      print('Saldo após o deposito pix: ${num_saldo + num_valor}');
    print("****************************************");
  }

  void pagarted() {
    print('Agência: ${agencia_cliente}');
    print('Conta: ${conta_cliente}');
    print('CPF: ${cpf_cliente}');
    print('Banco: Oxebank');
    print("****************************************");
  }

  void pagarcredito() {
    print('Nome do cliente: ${nome_cliente}');
    print('Valor do crédito: ${num_valor}');
    print("Saldo apos o pagamento: ${num_saldo - num_valor}");
    print("****************************************");
  }
}

void deposito(Pagamentos cliente) {
  bool aux = false;
  int escolha;
  var rng = new Random();
  var l = new List.generate(11, (_) => rng.nextInt(9));

  print('Agendar => [1]');
  print('Agora => [2]');

  int pagamento = int.parse(stdin.readLineSync()!);

  if (pagamento == 1) {
    print('PIX => [1]');
    print('TED => [2]');
    print('Boleto => [3]');
    escolha = int.parse(stdin.readLineSync()!);

    int time = tempo.agendar(aux);

    switch (escolha) {
      case 1:
        print('Quanto você quer receber de deposito nesse Pix?');
        cliente.num_valor = double.parse(stdin.readLineSync()!);
        cliente.pagarpix(aux);
        break;
      case 2:
        cliente.pagarted();
        break;
      case 3:
        print('Quanto você quer receber de deposito nesse Boleto?');
        cliente.num_valor = double.parse(stdin.readLineSync()!);
        cliente.gerarboleto(time, l, cliente.valor);
        break;
    }
  } else {
    print('PIX => [1]');
    print('TED => [2]');
    print('Boleto => [3]');
    escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
      case 1:
        print('Quanto você quer receber de deposito nesse Pix?');
        cliente.num_valor = double.parse(stdin.readLineSync()!);
        cliente.pagarpix(aux);
        break;
      case 2:
        cliente.pagarted();
        break;
      case 3:
        print('Quanto você quer receber de deposito nesse Boleto?');
        cliente.num_valor = double.parse(stdin.readLineSync()!);
        cliente.gerarboleto(0, l, cliente.valor);
        break;
    }
  }
}

void pagamento(Pagamentos cliente) {
  int time, escolha;
  var rng = new Random();
  var l = new List.generate(11, (_) => rng.nextInt(9));
  bool aux = true;

  print('Pix => [1]');
  print('Boleto => [2]');
  print('Credito => [3]');

  int escolha_pagamento = int.parse(stdin.readLineSync()!);
  if (escolha_pagamento == 1) {
    print('Agendar => [1]');
    print('Agora => [2]');

    escolha = int.parse(stdin.readLineSync()!);

    if (escolha == 1) {
      print('Quanto você quer pagar nesse Pix?');
      cliente.num_valor = double.parse(stdin.readLineSync()!);
      time = tempo.agendar(aux);
      cliente.pagarpix(aux);
    } else {
      print('Quanto você quer pagar nesse Pix?');
      cliente.num_valor = double.parse(stdin.readLineSync()!);
      if (cliente.num_saldo - cliente.num_valor < -100)
        print(
            "Saldo insuficiente!, seu saldo após o pagamento ultrapassa o limite de -100!");
      else
        cliente.pagarpix(aux);
    }
  } else if (escolha_pagamento == 2) {
    print('Agendar => [1]');
    print('Agora => [2]');

    escolha = int.parse(stdin.readLineSync()!);

    if (escolha == 1) {
      print('Quanto você quer pagar nesse Boleto?');
      cliente.num_valor = double.parse(stdin.readLineSync()!);
      time = tempo.agendar(aux);
      cliente.pagarboleto(time, l, cliente.valor);
    } else {
      print('Quanto você quer pagar nesse Boleto?');
      cliente.num_valor = double.parse(stdin.readLineSync()!);
      if (cliente.num_saldo - cliente.num_valor < -100)
        print(
            "Saldo insuficiente!, seu saldo após o pagamento ultrapassa o limite de -100!");
      else
        cliente.pagarboleto(0, l, cliente.valor);
    }
  } else if (escolha_pagamento == 3) {
    print('Quanto você quer pagar no Crédito?');
    cliente.num_valor = double.parse(stdin.readLineSync()!);
    if (cliente.num_valor > cliente.limite_credito)
      print('você não pode fazer esse pagamento, pois ultrapassou seu limite!');
    else
      cliente.pagarcredito();
  }
}

void gerar_boleto(Pagamentos cliente) {
  var rng = new Random();
  var l = new List.generate(11, (_) => rng.nextInt(9));
  cliente.gerarboleto(0, l, cliente.valor);
}

void main() {
  Pagamentos cliente = new Pagamentos();

  cliente.nome = 'Rafael';
  cliente.valor = 0;
  cliente.saldo = 100;
  cliente.limite = -100;
  cliente.limite_credito = 500;
  cliente.agencia = '001';
  cliente.conta = '0010020-0';
  cliente.cpf = '321.879.674-63';

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
    print('PAGAMENTO=> [2]');
    print('DEPOSITO => [3]');
    print('ENCERRAR O PROGRAMA => [4]');

    int escolha = int.parse(stdin.readLineSync()!);
    switch (escolha) {
      case 1:
        gerar_boleto(cliente);
        break;
      case 2:
        pagamento(cliente);
        break;
      case 3:
        deposito(cliente);
        break;
      case 4:
        exit(exitCode);
    }
  }
}
