//overload the constructor for multiple types of boundaries

class boundary {
  PVector a; 
  PVector b;
  PVector pos;

  boundary(float x1, float y1, float x2, float y2) {
    a = new PVector(x1, y1);
    b = new PVector(x2, y2);
    pos = new PVector ((x1+x2)/2, (y1+y2)/2);
  }

  void show() {
    stroke(255, 0, 0);
    line(a.x,a.y, b.x, b.y);
  }
}
