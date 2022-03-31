//https://refactoring.guru/pt-br/design-patterns/factory-method
//https://medium.com/flutter-community/flutter-design-patterns-10-factory-method-c53ad11d863f

////////////////////////////////
//       FACTORY
////////////////////////////////
//PROBLEMA: ANTES SÓ TINHA CAMINHÃO, E AGORA QUER EXPANDIR PARA BARCOS
abstract class TransportAntes{
  deliver();
}

class CaminhaoAntes implements TransportAntes{
  @override
  deliver(){
    print('Entrega Caixa');
  }    
}

///////////////////////////////
//          SOLUÇÃO
///////////////////////////////
//Criar classe que retorna o objeto desejado
//Dentro do objeto existe a implementação do resultado esperado "deliver()"
//A fábrica "Logistics" retorna o produto: "createTransport()"
//Ao contrario do Abstract Factory, nesse design pattern a classe Logistics não é uma interface, mas uma classe abstrata
//Por isso ela pode ter métodos próprios escritos nela, nesse caso em: "Logistics" 
abstract class Logistics{
  createTransport();
  void planDelivery(){
    print('dia 10');
  }
}

class RoadDelivery extends Logistics{
  @override
 Caminhao createTransport(){
   return Caminhao();
 }
}

class SeaDelivery extends Logistics{
  @override
 Barco createTransport(){
   return Barco();
 }
}

abstract class Transport{
  deliver();
}

class Caminhao implements Transport{
  @override
  void deliver(){    
    print('Entrega Caixa');
  }    
}

class Barco implements Transport{
  @override
  void deliver(){
    print('Entrega Container');
  }    
}

////////////////////////////////
//          TEST
////////////////////////////////
void main(){

  Transport transporte = RoadDelivery().createTransport(); //Cria caminhao
  RoadDelivery().planDelivery();
  transporte.deliver(); //Entrega caixa
  transporte = SeaDelivery().createTransport(); //Cria navio
  transporte.deliver(); //Entrega container
  
}
