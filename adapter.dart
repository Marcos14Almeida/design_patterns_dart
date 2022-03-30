//https://medium.com/flutter-community/flutter-design-patterns-2-adapter-3f05c02a7c84

//////////////////
//ADAPTER
//////////////////

void main() {

print(xml().getData());
print(json().getData());

}

abstract class adapter{
   String getData();
  
}

class xml implements adapter{

  @override
  String getData(){
    List lista = ['palavra'];
    return lista[0];
  }
  
}

class json implements adapter{
  
    @override
  String getData(){
    Map mapa = {'Quero':'palavra'};
    return mapa['Quero'];
  }
  
}
