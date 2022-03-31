//https://dart.academy/creational-design-patterns-for-dart-and-flutter-prototype/

//////////////////////////
// PROTOTYPE
//////////////////////////
//Clona um objeto e todas suas propriedades,mesmo que ela tenha sido posteriormente modificada pelo usuario
//Ao contrario do Singleton ao modificar o objeto p1, p2 não é modificado automaticamente.
//Mas toda vez que p1 é clonado, p2 assume seu valor
class Point {
  int x;
  int y;

  Point(this.x, this.y);
  
  Point copyWith({int? x1, int? y1}) {
    return Point(
      x1 ?? this.x,
      y1 ?? this.y,
    );
  }

  Point clone() => copyWith(x1: x, y1: y);
}
void main(){
Point p1 = Point(5, 8);
  p1.x = 7;
Point p2 = p1.clone();
  print(p2.x); //7
  print(p2.y); //8
  p1.x = 10;
  print(p2.x); //7
  print(p2.y); //8
}
