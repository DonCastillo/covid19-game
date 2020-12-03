class Person extends Virus {
  // original image
  PImage person = loadImage("person.png");
  // image with mask
  PImage personMasked = loadImage("person-mask.png");
  // image container
  PImage personVar;

  // x, y coordinate and dimension
  int w;
  int h;
  int x;
  int y;
  
  /*****************************************
 @desc: constructor
 *****************************************/
  Person (int pX, int pY, int pW, int pH) {
     super(pX, pY, 0);
     x = pX;
     y = pY;
     w = pW;
     h = pH;
     personVar = person;
  }
  
  /*****************************************
 @desc: displays image
 *****************************************/
  void display() {
    pushMatrix();
      imageMode(CENTER);
      image(personVar, x, y, w, h);
    popMatrix();
  }
  
  /*****************************************
 @desc: adds mask to the image
 *****************************************/
  void addMask(){
      personVar = personMasked;
  }
  
}
