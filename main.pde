int cols, rows;
int scl = 20;
int nodeNum = 1;
ArrayList<node> nodes = new ArrayList<node>();
ArrayList<boundary> boundaries = new ArrayList<boundary>();
ArrayList<squareBoundary> squareBoundaries = new ArrayList<squareBoundary>();

int r = 10;

int lineBoundariesNum = 4;
flowFeild flowFeild;

void setup() {
  size(1200, 800);
  cols = int(width/scl)+2;
  rows = int(height/scl)+2;
  flowFeild = new flowFeild();
  generateNodes();
  //generateLineBoundaries();
  generateSquareBoundaries();
}

void draw() {
  background(255);
  flowFeild.show();
  nodeStuff();
  boundaryStuff();
}


void generateNodes() {
  for (int i = 0; i < nodeNum; i++) {
    nodes.add(new node(random(width), random(height)));
  }
}

void nodeStuff() {
  for (node n : nodes) {
    n.update();
    n.edges();
    n.show();
  }
}

void generateLineBoundaries() {
  //for (int i = 0; i < lineBoundariesNum; i++) {
  //  boundaries.add(new boundary(random(width), random(height), random(width), random(height)));
  //}
}

void generateSquareBoundaries() {
  for (int i = 0; i < 20; i++) {
    PVector center = new PVector(random(width-r), random(height-r));
    PVector a = new PVector(center.x-r/2, center.y+r/2);
    PVector b = new PVector(center.x-r/2, center.y-r/2);
    PVector c = new PVector(center.x+r/2, center.y-r/2);
    PVector d = new PVector(center.x+r/2, center.y+r/2);
    squareBoundaries.add(new squareBoundary(a, b, c, d));
  }
}

void boundaryStuff() {
  for (boundary b : boundaries) {
    b.show();
  }
  for (squareBoundary sB : squareBoundaries) {
    sB.show();
  }
}
