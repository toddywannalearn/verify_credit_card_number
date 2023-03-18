abstract class Dado {
  String _dado = '';

  Dado({required String dado}) {
    _dado = dado;
  }

  String get valorDado => _dado;

  bool validaLength();

  bool validaDado();

  @override
  String toString() {
    return _dado;
  }
}
