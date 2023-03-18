import 'package:poo_playground_app/dado.dart';
import 'package:poo_playground_app/interfaces/formata_interface.dart';

const int primeiroDigito = 9;
const int segundoDigito = 10;

class CPF extends Dado implements IFormata {
  CPF({required super.dado});

  @override
  String removeFormatacao({required String valor}) {
    return valor.replaceAll(RegExp(r'[^\d]'), '');
  }

  @override
  bool validaLength() {
    return removeFormatacao(valor: super.valorDado).length == 11;
  }

  @override
  bool validaDado() {
    List<int> cpf =
        _converteToIntList(valor: removeFormatacao(valor: super.valorDado));

    if (!validaLength()) {
      return false;
    }

    bool isFirstDigitoValido =
        _retornaRestoDigito(digitoIndex: primeiroDigito) == cpf[primeiroDigito];
    bool isSecondDigitoValido =
        _retornaRestoDigito(digitoIndex: segundoDigito) == cpf[segundoDigito];

    if (isFirstDigitoValido && isSecondDigitoValido) {
      return true;
    } else {
      return false;
    }
  }

  int _retornaRestoDigito({required int digitoIndex}) {
    List<int> digitos =
        _converteToIntList(valor: removeFormatacao(valor: super.valorDado))
            .sublist(0, digitoIndex)
            .reversed
            .toList();

    int length = digitos.length;
    int valorSoma = 0;
    int multiplicador = 2;

    for (int index = 0; index < length; index++) {
      valorSoma = valorSoma + digitos[index] * multiplicador++;
    }

    return _validaResto(restoDivisao: valorSoma % 11);
  }

  int _validaResto({required int restoDivisao}) {
    if (restoDivisao < 2) {
      return 0;
    } else {
      return 11 - restoDivisao;
    }
  }

  List<int> _converteToIntList({required String valor}) {
    return valor.split('').map((e) => int.parse(e)).toList();
  }
}
