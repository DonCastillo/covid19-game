/***********************
 Don Castillo, NMED 3380 B
 Project 3: 
 Last Modified: 10/24/2020 10:30PM 
 ************************/
 

/***********************
 @desc: Global Variables
 ************************/
PFont font;
PImage coronaBG, chinaMap;
int sceneIndicator = 0;
int TOTAL_SCENES = 6;

// scene 2 global variables
RedDot[] otherCases;
RedDot hubeiCase;
 
void setup(){
  size(1000, 600);
  background(0);
  
  // load text font
  font = loadFont("ProcessingSansPro-Semibold-48.vlw");
  
  // load all images
  coronaBG = loadImage("corona.jpg");
  chinaMap = loadImage("china.png");
  setSceneOne();
  setSceneTwo();
}


void draw() {
  sceneTwo();
  //switch(sceneIndicator) {
  //  case 0:
  //    sceneOne();
  //    println("scene0");
  //    break;
  //  case 1:
  //    sceneTwo();
  //    println("scene1");
  //    break;
  //  case 2:
  //    println("scene2");
  //    break;
  //  case 3:
  //    println("scene3");
  //    break;
  //  case 4:
  //    println("scene4");
  //    break;
  //  case 5:
  //    println("scene5");
  //    break;
  //  case 6:
  //    println("scene6");
  //    break;
  //}  
}

void mousePressed() {
  println("x: " + mouseX + " y: " + mouseY);
}

void keyPressed() {
  switch(keyCode) {
    case ' ':
      incrementScene();
      break;
  }
}


/***********************
 @desc: scene2
 ************************/
void setSceneTwo(){
  hubeiCase = new RedDot(440, 270, 10);
  //redDots = new RedDot[20];
  
  
}

void sceneTwo(){
  pushMatrix();
    // map
    background(193, 87, 66);
    tint(color(193, 87, 66));
    imageMode(CORNERS);
    image(chinaMap, 0, 0, 649, 427);
    
    // cases
    hubeiCase.display();    
  popMatrix();
}





/***********************
 @desc: scene1
 ************************/
void setSceneOne(){
  
}

void sceneOne(){
  pushMatrix();
    setBackground(coronaBG, color(193, 87, 66));
    textFont(font);
    textSize(60);
    fill(255);
    textAlign(CENTER, CENTER);
    text("FACTS ABOUT \nCOVID-19", width/2, height/2);
  popMatrix();
}















/***********************
 @desc: increments scene
 ************************/
void incrementScene() {
  sceneIndicator++;
  sceneIndicator = sceneIndicator % TOTAL_SCENES;
}


/***********************
 @desc: sets the scenes background image
 @params:  image to be displayed
 ************************/
void setBackground(PImage pImage, color pColor) {
  tint(pColor);
  imageMode(CENTER);
  image(pImage, width/2, height/2, width, height);
}
