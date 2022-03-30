//https://medium.com/flutter-community/flutter-design-patterns-1-singleton-437f04e923ce
//https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart

//////////////
//SINGLETON
//////////////
//Crie uma única instância de um objeto. 
//Uma única mudança no código é refletido em todas as suas instâncias.


void main() {

var s1 = Singleton(); 
var s2 = Singleton(); 
s1.stateName = 'Carlos';
print(identical(s1, s2)); // true 
print(s1 == s2); // true
 print(s1.stateName);
 print(s2.stateName);

}

abstract class abstracao{
  late String initialName;
  late String stateName;
  String get currentText => stateName;
  
  void reset(){
    stateName = initialName;
  }
}

class Singleton extends abstracao{
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {   
    return _singleton;
  }

  Singleton._internal(){
    initialName = 'João';
    stateName = initialName;       
  }
}
