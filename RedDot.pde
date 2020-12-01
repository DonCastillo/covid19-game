class RedDot {

  int x; 
  int y;
  int radius;
  float transparency;
  color shade = color(227, 85, 57);
  int directionTo;
  int speed = 20;
  
  RedDot(int pX, int pY, int pRadius, float pRandom) {
    x = pX;
    y = pY;
    radius = pRadius;
    transparency = random(pRandom, 0.00);
  }

  void display() {
    pushStyle();
      fill(shade, transparency++);
      ellipseMode(CENTER);
      ellipse(x, y, radius, radius);
    popStyle();
  }
  
  void setSpeed(int pSpeed){
    speed = pSpeed;
  }
  
  void forward() {
    x = x + speed;
  }
  
  void backward() {
    x = x - speed;
  }
  
  void ascend() {
    y = y - speed;
  }
  
  void descend() {
    y = y + speed;
  }
  
  void toTopRight() {
    ascend();
    forward();
  }
  
  void toBottomRight() {
    descend();
    forward();
  }
  
  void toTopLeft() {
    ascend();
    backward();
  }
  
  void toBottomLeft() {
    descend();
    backward();
  }
}
