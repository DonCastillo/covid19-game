class Virus {

  // x, y coordinate
  int x; 
  int y;
  // size
  int radius;
  // default transparency
  float transparency = 255.00;
  // initial angle
  float angle = 0.00;
  // default shade
  color shade = color(227, 85, 57);
  // default speed
  float speed = 20;
  // virus image
  PImage image = loadImage("virus.png");
  
  /*****************************************
 @desc: constructor
 *****************************************/
  Virus(int pX, int pY, int pRadius) {
    x = pX;
    y = pY;
    radius = pRadius;
  }
  
/*****************************************
 @desc: displays as a red dot
 *****************************************/
  void display() {
    pushStyle();
      fill(shade, transparency);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x, y, radius, radius);
    popStyle();
  }
  
  /*****************************************
 @desc: displays as an image
 *****************************************/
  void displayAsImage() {
      blendMode(BLEND);
      imageMode(CENTER);
      float rX = random(0.00, 20.00);
      float rY = random(0.00, 20.00);
      image(image, x + rX, y + rY, radius, radius);
  }

/*****************************************
 @desc: sets color
 *****************************************/
  void setColor(color pColor){
    shade = pColor;
  }
  
  /*****************************************
 @desc: rotates clockwise
 *****************************************/
  void rotateClockwise() {
    pushMatrix();
    translate(x, y);
    float c = radians(angle);
    rotate(c);
    angle = angle + speed/2;
    displayAsImage();
    popMatrix();
  }
  
  /*****************************************
 @desc: sets initial transparency
 *****************************************/
  void setTransparency(float pInitialTrans) {
    transparency = random(pInitialTrans, 0.00);
  }
  
  /*****************************************
 @desc: increases transparency
 *****************************************/
  void increaseTransparency() {
    transparency++;
  }
  
  /*****************************************
 @desc: decreases transparency
 *****************************************/
  void decreaseTransparency() {
    transparency--;
  }
  
  /*****************************************
 @desc: sets speed
 *****************************************/
  void setSpeed(float pSpeed){
    speed = pSpeed;
  }
  
  /*****************************************
 @desc: moves forward
 *****************************************/
  void forward() {
    x = x + ceil(speed);
  }
  
  /*****************************************
 @desc: moves backward
 *****************************************/
  void backward() {
    x = x - ceil(speed);
  }
  
  /*****************************************
 @desc: moves upward
 *****************************************/
  void ascend() {
    y = y - ceil(speed);
  }
  
/*****************************************
 @desc: moves downward
 *****************************************/
  void descend() {
    y = y + ceil(speed);
  }
  
/*****************************************
 @desc: moves to top right
 *****************************************/
  void toTopRight() {
    ascend();
    forward();
  }
  
/*****************************************
 @desc: moves to bottom right
 *****************************************/
  void toBottomRight() {
    descend();
    forward();
  }
  
/*****************************************
 @desc: moves to top left
 *****************************************/
  void toTopLeft() {
    ascend();
    backward();
  }
  
/*****************************************
 @desc: moves to bottom left
 *****************************************/
  void toBottomLeft() {
    descend();
    backward();
  }
}
