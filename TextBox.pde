class TextBox {
 // default font
  PFont font = loadFont("ProcessingSansPro-Semibold-24.vlw");
  // text
  String text;
  // starting coor of the text
  int x;
  int y;
  // dimension of the black rect
  int textBoxWidth;
  int textBoxHeight;
  // font size
  int size;

/*****************************************
 @desc: constructor
 *****************************************/
  TextBox(int pX, int pY, int pW, int pH, String pText, int pSize) {
    x = pX;
    y = pY;
    textBoxWidth = pW;
    textBoxHeight = pH;
    text = pText;
    size = pSize;
  }
/*****************************************
 @desc: displays text
 *****************************************/
  void display() {
    pushMatrix();
    fill(0);
    strokeWeight(5);
    rect(x - 10, y - 10, textBoxWidth, textBoxHeight);
    noStroke();
    noFill();
    textFont(font);
    textSize(size);
    fill(255);
    textAlign(LEFT, TOP);
    text(text, x, y);
    noFill();
    popMatrix();
  } 
}
