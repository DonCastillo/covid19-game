class TextBox {

  PFont font = loadFont("ProcessingSansPro-Semibold-24.vlw");
  String text;
  int x;
  int y;
  int textBoxWidth;
  int textBoxHeight;
  int size;

  TextBox(int pX, int pY, int pW, int pH, String pText, int pSize) {
    x = pX;
    y = pY;
    textBoxWidth = pW;
    textBoxHeight = pH;
    text = pText;
    size = pSize;
  }

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
