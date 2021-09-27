class node {
  ArrayList<ray> view = new ArrayList<ray>();
  PVector pos;
  float r = 20;
  PVector vel = new PVector(0, 0);
  float accDir;
  float speed = 3;
  int indexY;
  int indexX;
  float rayCount = 360/36;
  float safteyDistance = 100;
  float lerpAmmount;
  float totalDist = 0;


  node(float x, float y) {
    pos = new PVector(x, y);
    generateRays();
  }

  void update() {
    /*
      it realizes that it's too close something about the turning is wrong.
    */ 
    float totalAngle = 0;
    for (ray r : view) {
      r.setPos(pos);
      r.collideWithBoundary(boundaries);
      if (r.closest != null) {
        if (PVector.dist(pos, r.closest) < safteyDistance) {
          totalAngle+=r.closest.heading();
          totalDist+=PVector.dist(pos,r.closest);
        }
      }
    }
    indexY = int(pos.y/scl);
    indexX = int(pos.x/scl);
    
    float desiredDir = (totalAngle/view.size()) + PI;
    float flowFeildDir = flowFeild.forces[indexX][indexY].heading();
    float lerpAmmount = map(totalDist,0,safteyDistance*rayCount,1,0);
    PVector acc = PVector.fromAngle(lerp(flowFeildDir, desiredDir, lerpAmmount));
    vel.add(acc);
    vel.setMag(speed);
    pos.add(vel);
    if (lerpAmmount > 0) {
      print("TURN");
    }
    totalDist = 0;
  }

  void show() {
    noStroke();
    fill(0, 0, 255, 200);
    ellipse(pos.x, pos.y, r, r);
    for (ray r : view) {
      if (r.closest != null && PVector.dist(pos, r.closest) < r.viewLength) {
        stroke(0);
        line(pos.x, pos.y, r.closest.x, r.closest.y);
      }
    }
  }
  void edges() {
    if (pos.x >= width-r) {
      pos.x = r;
    } else if (pos.x <= r) {
      pos.x = width-r;
    } else if (pos.y >= height-r) {
      pos.y = r;
    } else if (pos.y <= r) {
      pos.y = height-r;
    }
  }

  void generateRays() {
    for (float i = 0; i < (2*PI); i+= radians(rayCount)) {
      view.add(new ray(i, pos));
    }
  }
}
