//https://blog.flutterando.com.br/implementando-padr%C3%B5es-de-projetos-em-dart-parte-1-d604f6038460

////////////////////////////
//        STRATEGY
//Retira a necessidade de IFs
///////////////////////////

//PROBLEMA
class CalculadorImpostos {
  double CalculaImposto(String imposto, double valor) {
    if (imposto == "ICMS") {
      var imposto = ImpostoICMS();
      return imposto.CalculaICMS(valor);
    } else if (imposto == "IPTU") {
      var imposto = ImpostoIPTU();
      return imposto.CalculaIPTU(valor);
    } else if (imposto == "IRRF") {
      var imposto = ImpostoIRRF();
      return imposto.CalculaIRRF(valor);
    } else {
      return 0;
    }
  }
}


////////////////////////////////////////
//SOLUÇÃO STRATEGY
////////////////////////////////////////
abstract class Imposto {
  double Calcula(double valor);
}

//implementa a abstração pra cada tipo de imposto
class ImpostoICMS implements Imposto {
  @override
  double Calcula(double valor) {
    print("executa regra complexa de calculo de ICMS");
    return valor * 0.08;
  }
}

class ImpostoIPTU implements Imposto {
  @override
  double Calcula(double valor) {
    print("executa regra complexa de calculo de IPTU");
    return valor * 0.09;
  }
}

class ImpostoIRRF implements Imposto {
  @override
  double Calcula(double valor) {
    print("executa regra complexa de calculo de IRRF");
    return valor * 0.1;
  }
}
////////////////////////////////
//             RUN
////////////////////////////////
void main() {  

  double value = ImpostoICMS().Calcula(23);
  print(value);
  value = ImpostoIPTU().Calcula(23);
  print(value);
  value = ImpostoIRRF().Calcula(23);
  print(value);
  
}
