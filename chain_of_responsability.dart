//https://blog.flutterando.com.br/implementando-padr%C3%B5es-de-projetos-em-dart-parte-1-d604f6038460

/////////////////////////////////
// CHAIN OF RESPONSABILITY
/////////////////////////////////
//PROBLEMA
//Para cada tipo de desconto cria-se uma classe de desconto seguindo o Strategy
//Porém a classe ainda não tem coesão
class Venda {
  double valorTotal;
  List<Item> itens;

  Venda() {
    valorTotal = 0;
    itens = List<Item>();
  }

  AdicionarItem(Item item) {
    itens.add(item);
    valorTotal += item.valor;
    }
}

class Item {
  String nome;
  double valor;
  Item(this.nome, this.valor);
}

class CalculadorDesconto {
  double Calcula(Venda venda) {
    double valorDesconto = DescontoValorAPartirDe1000().Calcula(venda);
    if (valorDesconto == 0) {
      valorDesconto = DescontoValorAPartirDe100().Calcula(venda);
    }
    if (valorDesconto == 0) {
      valorDesconto = DescontoMaisDe3Itens().Calcula(venda);
    }
    return 0;
  }
}

class DescontoMaisDe3Itens {
  double Calcula(Venda venda) {
    if (venda.itens.length >= 3) {
      return venda.valorTotal * 0.02;
    }
    return 0;
  }
}

class DescontoValorAPartirDe100 {
  double Calcula(Venda venda) {
    if (venda.valorTotal >= 100) {
      return venda.valorTotal * 0.03;
    }
    return 0;
  }
}

class DescontoValorAPartirDe1000 {
  double Calcula(Venda venda) {
    if (venda.valorTotal >= 1000) {
      return venda.valorTotal * 0.04;
    }
    return 0;
  }
}

////////////////////////////
//SOLUÇÃO
///////////////////////////
//Criar uma interface Desconto que possui um método Calcula() e um próximo desconto
//Para executar é só colocar cada função de maneira sequencial
//Atribuir a próxima função desejada
//Executar a 1ªtarefa
class CalculadorDesconto {
  double Calcula(Venda venda) {
    var desconto1 = DescontoValorAPartirDe1000();
    var desconto2 = DescontoValorAPartirDe100();
    var desconto3 = DescontoMaisDe3Itens();
    var desconto4 = SemDesconto();
    desconto3.proximo = desconto4;
    desconto2.proximo = desconto3;
    desconto1.proximo = desconto2;
    return desconto1.Calcula(venda);
  }
}

//
abstract class Desconto {
  double Calcula(Venda venda);
  Desconto proximo;
}

class DescontoMaisDe3Itens implements Desconto {
  double Calcula(Venda venda) {
    if (venda.itens.length >= 3) {
      return venda.valorTotal * 0.02;
    }
    return proximo.Calcula(venda);
  }

  @override
  Desconto proximo;
}

class DescontoValorAPartirDe100 implements Desconto {
  double Calcula(Venda venda) {
    if (venda.valorTotal >= 100) {
      return venda.valorTotal * 0.03;
    }
    return proximo.Calcula(venda);
  }

  @override
  Desconto proximo;
}

class DescontoValorAPartirDe1000 implements Desconto {
  double Calcula(Venda venda) {
    if (venda.valorTotal >= 1000) {
      return venda.valorTotal * 0.04;
    }
    return proximo.Calcula(venda);
  }

  @override
  Desconto proximo;
}

class SemDesconto implements Desconto {
  @override
  Desconto proximo;

  @override
  double Calcula(Venda venda) {
    return 0;
  }
}
