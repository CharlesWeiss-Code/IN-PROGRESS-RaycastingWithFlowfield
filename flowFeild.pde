class flowFeild {
  PVector[][] forces = new PVector[cols][rows];
  float strength = 3;
  float spacing = 1;
  float noiseSpeed = .05;
  
  flowFeild() {
    generate();
  }
  
  void generate() {
    float yoff = 0;
    for (int i = 0; i < cols; i++) {
      float xoff = 0;
      for (int j = 0; j < rows; j++) {
        xoff+=noiseSpeed;
        float a = map(noise(xoff,yoff),0,1,0,2*PI);
        forces[i][j] = PVector.fromAngle(a);
        forces[i][j].setMag(strength);
      }
      yoff+=noiseSpeed;
    }
  }
  
  void show() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float circleSize = spacing/3;
        push();
        translate(i*scl,j*scl);
        stroke(100);
        rotate(forces[i][j].heading());
        line(+spacing,0,scl-spacing,0);
        fill(100);
        noStroke();
        ellipse(scl-spacing,0,circleSize,circleSize);
        pop();
      }
    }
  }
}  
