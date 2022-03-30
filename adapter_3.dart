void main() {

Buraco hole = Buraco(15);
PinoRedondo pino =   PinoRedondo(14);
PinoQuadrado pinoSquare =   PinoQuadrado(6);
Adapter adaptador = Adapter(pinoSquare);  
print(hole.fits(pino.getRadius()));
print(hole.fits(adaptador.getRadius()));    

}

class Buraco{
  int radius;
  
  Buraco(this.radius);
 
  
  fits(int value){
    if(radius<value){
      return false;      
    }else{
      return true;      
    }
  }
}

class Adapter{
  PinoQuadrado pino;
  
  Adapter(this.pino);
  
   int getRadius(){
     return pino.getWidth()*2;
   }
}

//CLASSE PINO QUADRADO NÃO TEM O MÉTODO GETRADIUS
//SOLUÇÃO CRIAR UMA CLASSE ADAPTADORA

class PinoQuadrado{
  int size;
  
  PinoQuadrado( this.size);
  
  int getWidth(){
    return size;
  }
  
}

class PinoRedondo{
  int radius;
  
  PinoRedondo(this.radius);
  
  int getRadius(){
    return radius;
  }
  
}
