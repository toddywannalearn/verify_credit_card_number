import 'package:poo_playground_app/dado.dart';
import 'package:poo_playground_app/interfaces/formata_interface.dart';

class Cartao extends Dado implements IFormata {
  Cartao({required super.dado});

  @override
  bool validaLength() {
    return super.valorDado.length == 16;
  }

  @override
  bool validaDado() {
    return _isVerificadorValido();
  }

  @override
  String removeFormatacao({required String valor}) {
    return valor.replaceAll(RegExp(r'[^\d]'), '');
  }

  bool _isVerificadorValido() {
    List<int> list =
        _converteToIntList(valor: removeFormatacao(valor: super.valorDado));
    int verificador = list.last;

    if (verificador == _retornaMod10()) {
      return true;
    } else {
      return false;
    }
  }

  int _retornaMod10() {
    List<int> list =
        _converteToIntList(valor: removeFormatacao(valor: super.valorDado));
    int valorSoma = 0;
    int mod10 = 0;

    for (int index = 0; index < list.length - 1; index++) {
      if (index.isEven) {
        valorSoma = valorSoma +
            _verificaResultMultiplicacao(resultado: list[index] * 2);
      } else {
        valorSoma = valorSoma +
            _verificaResultMultiplicacao(resultado: list[index] * 1);
      }
    }

    mod10 = 10 - (valorSoma % 10);

    return mod10 == 10 ? 0 : mod10;
  }

  int _verificaResultMultiplicacao({required int resultado}) {
    if (resultado.toString().length > 1) {
      return _converteToIntList(valor: resultado.toString())
          .reduce((value, element) => value + element);
    } else {
      return resultado;
    }
  }

  List<int> _converteToIntList({required String valor}) {
    return valor.split('').map((e) => int.parse(e)).toList();
  }
}
