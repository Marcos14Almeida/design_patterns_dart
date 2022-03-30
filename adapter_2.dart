void main() {

Buraco hole = Buraco(15);
PinoRedondo pino =   PinoRedondo(14);
PinoQuadrado pinoSquare =   PinoQuadrado(6);
print(hole.fits(pino.getHoleSize()));
print(hole.fits(pinoSquare.getHoleSize()));    

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

abstract class Adapter{
   int getHoleSize();
}

class PinoQuadrado implements Adapter{
  int size;
  
  PinoQuadrado( this.size);
  
  @override
  int getHoleSize(){
    return size*2;
  }
  
}

class PinoRedondo implements Adapter{
  int radius;
  
  PinoRedondo(this.radius);
  
    @override
  int getHoleSize(){
    return radius;
  }
  
}
