class RedDot {

  int x; 
  int y;
  int radius;
  float transparency = 255.00;
  float angle = 0.00;
  int red;
  color shade = color(227, 85, 57);
  int directionTo;
  int speed = 20;
  PImage image = loadImage("virus.png");
  
  RedDot(int pX, int pY, int pRadius) {
    x = pX;
    y = pY;
    radius = pRadius;
    //red = 227; // initial shade of red
  }
  

  void display() {
    pushStyle();
      fill(shade, transparency);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x, y, radius, radius);
    popStyle();
  }
  
  void displayAsImage() {
      blendMode(BLEND);
      imageMode(CENTER);
      float rX = random(0.00, 20.00);
      float rY = random(0.00, 20.00);
      image(image, x + rX, y + rY, radius, radius);
  }
  
  void rotateClockwise() {
    pushMatrix();
    translate(x, y);
    float c = radians(angle);
    rotate(c);
    angle = angle + speed/2;
    displayAsImage();
    popMatrix();
  }
  
  void setTransparency(float pInitialTrans) {
    transparency = random(pInitialTrans, 0.00);
  }
  
  void increaseTransparency() {
    transparency++;
  }
  
  void decreaseTransparency() {
    transparency--;
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
