class RedDot {

  int x; 
  int y;
  int radius;
  float transparency;
  color shade = color(227, 85, 57); 
  
  RedDot(int pX, int pY, int pRadius, float pRandom) {
    x = pX;
    y = pY;
    radius = pRadius;
    transparency = random(pRandom, 0.00);;
  }

  void display() {
    pushStyle();
      fill(shade, transparency++);
      ellipseMode(CENTER);
      ellipse(x, y, radius, radius);
    popStyle();
  }


}
