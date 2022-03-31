abstract class Imposto {
  double Calcula(Venda venda);
}

class IQ implements Imposto {
  double Calcula(venda) {
    if (venda.valorTotal < 100) {
      return venda.valorTotal * 0.2;
    }

    return venda.valorTotal * 0.3;
  }
}

class IK implements Imposto {
  double Calcula(Venda venda) {
    if (venda.itens.length > 3) {
      return venda.valorTotal * 0.1;
    }
    return venda.valorTotal * 0.05;
  }
}

abstract class ImpostoCondicional implements Imposto {
  double Calcula(Venda venda) {
    if (UsarValorMaximo(venda)) {
      return CalculaValorMaximo(venda);
    }

    return CalculaValorMinimo(venda);
  }

  bool UsarValorMaximo(Venda venda);
  double CalculaValorMaximo(Venda venda);
  double CalculaValorMinimo(Venda venda);
}

class IQ extends ImpostoCondicional {
  @override
  double CalculaValorMaximo(Venda venda) => venda.valorTotal * 0.3;

  @override
  double CalculaValorMinimo(Venda venda) => venda.valorTotal * 0.2;

  @override
  bool UsarValorMaximo(Venda venda) => venda.valorTotal >= 100;
}

class IK extends ImpostoCondicional {
  @override
  double CalculaValorMaximo(Venda venda) => venda.valorTotal * 0.1;

  @override
  double CalculaValorMinimo(Venda venda) => venda.valorTotal * 0.05;

  @override
  bool UsarValorMaximo(Venda venda) => venda.itens.length > 3;
}
