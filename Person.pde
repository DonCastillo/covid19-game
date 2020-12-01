class Person extends RedDot {
  
  PImage person = loadImage("person.png");

  int w;
  int h;
  int x;
  int y;
  
  
  Person (int pX, int pY, int pW, int pH) {
     super(pX, pY, 0, 0.00);
     x = pX;
     y = pY;
     w = pW;
     h = pH;
  }
  
  void display() {
    pushMatrix();
      imageMode(CENTER);
      image(person, x, y, w, h);
    popMatrix();
  }
  
}
