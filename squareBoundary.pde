class squareBoundary {
  PVector pa;
  PVector pb;
  PVector pc;
  PVector pd;

  squareBoundary(PVector a, PVector b, PVector c, PVector d) {
    pa = a;
    pb = b;
    pc = c;
    pd = d;
    boundaries.add(new boundary(pa.x, pa.y, pb.x, pb.y));
    boundaries.add(new boundary(pb.x, pb.y, pc.x, pc.y));
    boundaries.add(new boundary(pc.x, pc.y, pd.x, pd.y));
    boundaries.add(new boundary(pd.x, pd.y, pa.x, pa.y));
  }
  
  void show() {
    fill(255,0,0,100);
    beginShape();
    vertex(pa.x,pa.y);
    vertex(pb.x,pb.y);
    vertex(pc.x,pc.y);
    vertex(pd.x,pd.y);
    endShape(CLOSE);
  }
}
