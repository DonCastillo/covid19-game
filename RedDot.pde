class RedDot {

  int x; 
  int y;
  int radius;
  float transparency = 0;
  color shade = color(227, 85, 57); 
  
  RedDot(int pX, int pY, int pRadius) {
    x = pX;
    y = pY;
    radius = pRadius;
  }

  void display() {
    pushStyle();
      fill(shade, transparency++);
      ellipseMode(CENTER);
      ellipse(x, y, radius, radius);
    popStyle();
  }


}
