class ray {
  PVector dir;
  PVector pos;
  PVector closest = null;
  float amp = 100;
  float distToBoundary = 0;
  int viewLength = 100;
  ray (float a, PVector loc) {
    dir = PVector.fromAngle(a);
    pos = loc;
  }

  void show() {
    push();
    stroke(0);
    if (closest != null && PVector.dist(pos,closest) < viewLength) {
      distToBoundary+=PVector.dist(pos,closest);
      line(pos.x, pos.y, closest.x, closest.y);
      pop();
    } 
  }

  void setPos(PVector loc) {
    pos.set(loc);
  }

  void collideWithBoundary(ArrayList<boundary> walls) {
    float record = 999999999;
    for (boundary b : walls) {
        PVector intPoint = null;
        float intPointx;
        float intPointy;

        float x1 = b.a.x;
        float y1 = b.a.y;
        float x2 = b.b.x;
        float y2 = b.b.y;

        float x3 = pos.x;
        float y3 = pos.y;
        float x4 = pos.x + dir.x;
        float y4 = pos.y + dir.y;

        float den = ((x1 - x2) * (y3 - y4)) - ((y1 - y2) * (x3 - x4));
        if (den == 0) {
          return;
        }

        float t = (((x1 -x3) * (y3-y4)) - ((y1 - y3) * (x3 - x4)))/den;
        float u = -(((x1-x2) * (y1-y3)) - ((y1 - y2) * (x1 - x3)))/den;

        if (t >= 0 && t <= 1 && u <= 1) {
          intPointx = x1 + t * (x2 - x1);
          intPointy = y1 + t * (y2 - y1); 
          intPoint = new PVector (intPointx, intPointy);
        } 
        if (intPoint != null) {
          float d = PVector.dist(pos, intPoint);
          if (d < record) {
            record = d;
            closest = intPoint;
          }
        }
      }
    }
  }
