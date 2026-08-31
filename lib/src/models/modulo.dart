enum Modulo {
  recebix,
  pdv,
  pedidos,
}

extension ModuloDisplay on Modulo {
  String get displayName {
    switch (this) {
      case Modulo.recebix:
        return 'Recebix';
      case Modulo.pdv:
        return 'PDV';
      case Modulo.pedidos:
        return 'Pedidos';
    }
  }
}
