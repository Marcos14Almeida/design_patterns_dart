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
abstract class Logistics{
  createTransport();
}

class RoadDelivery extends Logistics{
  @override
 createTransport(){
   return Caminhao();
 }
}

class SeaDelivery extends Logistics{
  @override
 createTransport(){
   return Barco();
 }
}

abstract class Transport{
  deliver();
}

class Caminhao implements Transport{
  @override
  deliver(){    
    print('Entrega Caixa');
  }    
}

class Barco implements Transport{
  @override
  deliver(){
    print('Entrega Container');
  }    
}

////////////////////////////////
//          TEST
////////////////////////////////
void main(){

  dynamic transporte = RoadDelivery().createTransport(); //Cria caminhao
  print(transporte.deliver()); //Entrega caixa
  transporte = SeaDelivery().createTransport(); //Cria navio
  print(transporte.deliver()); //Entrega container
  
}
