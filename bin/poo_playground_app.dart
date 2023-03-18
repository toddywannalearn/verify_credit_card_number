import 'package:poo_playground_app/model/cartao.dart';
import 'package:poo_playground_app/model/cpf.dart';

void main() {
  // print('Informe um CPF: ');
  // CPF cpf = CPF(dado: stdin.readLineSync() ?? '');

  CPF cpfBeto = CPF(dado: '40212773828');
  CPF cpfJunior = CPF(dado: '851.851.876-89');
  CPF cpfMicaela = CPF(dado: '3464564');

  print('==> Verificação de CPF\n');

  print(
      'O CPF ${cpfBeto.valorDado} ${retornaValidez(validacao: cpfBeto.validaDado())}');

  print(
      'O CPF ${cpfJunior.valorDado} ${retornaValidez(validacao: cpfJunior.validaDado())}');

  print(
      'O CPF ${cpfMicaela.valorDado} ${retornaValidez(validacao: cpfMicaela.validaDado())}');

  print('\n==> Verificação de Cartão\n');

  Cartao cartaoFabio = Cartao(dado: '4916641859369080');
  Cartao cartaoJulia = Cartao(dado: '5419 8250 0346 1210');

  print(
      'O Cartão ${cartaoFabio.valorDado} ${retornaValidez(validacao: cartaoFabio.validaDado())}');

  print(
      'O Cartão ${cartaoJulia.valorDado} ${retornaValidez(validacao: cartaoJulia.validaDado())}');
}

String retornaValidez({required bool validacao}) {
  if (validacao) {
    return 'é válido';
  } else {
    return 'não é válido';
  }
}
