//https://medium.com/flutter-community/flutter-design-patterns-11-abstract-factory-7098112925d8

///////////////////////
// ABSTRACT FACTORY
///////////////////////
abstract class Fabrica{
	createChair(); 
  createSofa(); 
  createTable();
}
//FABRICAS
class Moderno implements Fabrica{
  @override
	ChairModerna createChair(){return ChairModerna();} 
  @override
  SofaModerno createSofa(){return SofaModerno();}
  @override
  TableModerna createTable(){return TableModerna();}
}

class Retro implements Fabrica{
  @override
	ChairRetro createChair(){return ChairRetro();} 
  @override
  SofaRetro createSofa(){return SofaRetro();}
  @override
  TableRetro createTable(){return TableRetro();}
}

//PRODUTOS
abstract class ChairParameters{
  color();
  length();
}
class ChairModerna implements ChairParameters{
  @override
	void color(){print("BLUE");}
  @override
	void length(){print(100);}
}
class ChairRetro implements ChairParameters{
  @override
	void color(){print("Vermelha");}
  @override
	void length(){print(300);}
}


abstract class SofaParameters{
  color();
  height();
}
class SofaModerno implements SofaParameters{
  @override
	void color(){print("Bonito");}
  @override
	void height(){print(50);}
}
class SofaRetro implements SofaParameters{
  @override
	void color(){print("Feio");}
  @override
	void height(){print(20);}
}


abstract class TableParameters{
  name();
  age();
}
class TableModerna implements TableParameters{
  @override
	void name(){print("Modernissimo");}
  @override
	void age(){print(25);}
}
class TableRetro implements TableParameters{
  @override
	void name(){print("Vintage");}
  @override
	void age(){print(25);}
}
////////////////////////////////
//              TEST
////////////////////////////////
void main(){
  ChairParameters cadeira = Moderno().createChair();
  cadeira.color(); //Bonito
  cadeira.length(); //50
  cadeira = Retro().createChair();
  cadeira.color(); //Feio
  cadeira.length(); //200
}
