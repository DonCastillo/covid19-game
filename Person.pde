class Person extends Virus {
  
  PImage person = loadImage("person.png");
  PImage personMasked = loadImage("person-mask.png");
  PImage personVar;

  int w;
  int h;
  int x;
  int y;
  
  
  Person (int pX, int pY, int pW, int pH) {
     super(pX, pY, 0);
     x = pX;
     y = pY;
     w = pW;
     h = pH;
     personVar = person;
  }
  
  void display() {
    pushMatrix();
      imageMode(CENTER);
      image(personVar, x, y, w, h);
    popMatrix();
  }
  
  void addMask(){
      personVar = personMasked;
  }
  
}
