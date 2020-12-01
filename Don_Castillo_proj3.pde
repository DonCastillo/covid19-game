/***********************
 Don Castillo, NMED 3380 B
 Project 3: 
 Last Modified: 10/24/2020 10:30PM 
 ************************/
 

/***********************
 @desc: Global Variables
 ************************/
PFont font;
PImage coronaBG, chinaMap, person;
int sceneIndicator = 0;
int TOTAL_SCENES = 6;

// scene 2 global variables
RedDot[] otherCases;
RedDot initialCase;
boolean displayCases;

// scene 3
boolean displayVirus;
ArrayList<RedDot> particles;

// scene4
Person[] persons;
int numOfPress = 0;

 
void setup(){
  size(1000, 600);
  background(0);
  
  // load text font
  font = loadFont("ProcessingSansPro-Semibold-48.vlw");
  
  // load all images
  coronaBG = loadImage("corona.jpg");
  chinaMap = loadImage("china.png");
  person = loadImage("person.png");
  setSceneOne();
  setSceneTwo();
  setSceneThree();
  setSceneFour();
}


void draw() {
  //sceneTwo();
  //println(wave);
  switch(sceneIndicator) {
    case 0:
      //sceneOne();
      //println("scene0");
      break;
    case 1:
      //sceneTwo();
      //println("scene1");
      break;
    case 2:
      //sceneThree();
      //println("scene3");
      break;
    case 3:
      sceneFour();
      
      break;
    case 4:
      //println("scene4");
      break;
    case 5:
      //println("scene5");
      break;
    case 6:
      //println("scene6");
      break;
  }  
}

void mousePressed() {
    println("x: " + mouseX + " y: " + mouseY);
    /** scene 2 controls ********************/
    if (sceneIndicator == 1) {
      if ((mouseX >= 430 && mouseX <= 450) && (mouseY >= 260 && mouseY <= 280)) {
        cursor(HAND);
        println("HERE");
        displayCases = true;
      } else {
        cursor(ARROW);
      }
    }
    /** scene 3 controls ********************/
    if (sceneIndicator == 2) {
      displayVirus = true;
    }
}



void mouseMoved() {
    /** scene 2 controls ********************/
    if (sceneIndicator == 1) {
      if ((mouseX >= 430 && mouseX <= 450) && (mouseY >= 260 && mouseY <= 280)) {
        cursor(HAND);
      } else {
        cursor(ARROW);
      }
    }
    /** scene 2 controls ********************/
}


void keyPressed() {
  switch(keyCode) {
    case ' ':
      incrementScene();
      break;
  }
}

void keyReleased() {
  if (sceneIndicator == 3) {
    if (key == CODED) {
      if (keyCode == UP) {
          int movement = 20;
          numOfPress++;
          if (numOfPress <= 6) {
            persons[0].x = persons[0].x - movement;
            persons[0].y = persons[0].y - movement;
            
            persons[1].x = persons[1].x + movement;
            persons[1].y = persons[1].y - movement;
            
            persons[2].x = persons[2].x - movement;
            persons[2].y = persons[2].y + movement;
            
            persons[3].x = persons[3].x + movement;
            persons[3].y = persons[3].y + movement;
          } 
          println("here");
      }
    }
  }
}



/***********************
 @desc: scene 4
 ************************/
void setSceneFour(){
   persons = new Person[4];
   int offset = 20;
   int personWidth = 50;
   int personHeight = 120;
   persons[0] = new Person(width/3 - offset , height/2 - offset, personWidth, personHeight); // topleft
   persons[1] = new Person(width/3 + offset , height/2 - offset, personWidth, personHeight); // topright
   persons[2] = new Person(width/3 - offset , height/2 + offset, personWidth, personHeight); // bottomleft
   persons[3] = new Person(width/3 + offset , height/2 + offset, personWidth, personHeight); // bottomright
   
   
}
 
void sceneFour() {
  background(0, 255, 255);
  persons[0].display();
  persons[1].display();
  persons[2].display();
  persons[3].display();
  // textbox
  if (numOfPress >= 6) {
    String firstText = "Social distancing is they key\nto minimize the spread of COVID-19.";
    TextBox firstBox = new TextBox(556, 397, 400, 70, firstText, 24);
    firstBox.display();
  }
}
 /***********************
 @desc: End of scene 3
 ************************/



/***********************
 @desc: scene 3
 ************************/
 void setSceneThree(){
   displayVirus = false;
   particles = new ArrayList<RedDot>();
 }
 
 void sceneThree() {
  background(255);

  // add everytime
  if (displayVirus) {
    // add particles where mouse is pressed
    int offsetX = int(random(0.00, 50.00));
    int offsetY = int(random(0.00, 50.00));
    if (mousePressed) {
          particles.add(new RedDot(mouseX - offsetX, mouseY + offsetY, 20, -10));
          particles.add(new RedDot(mouseX + offsetX, mouseY + offsetY, 20, -10));
          particles.add(new RedDot(mouseX + offsetX, mouseY - offsetY, 20, -10));
          particles.add(new RedDot(mouseX - offsetX, mouseY - offsetY, 20, -10));
    }
    
    for(int i = 0; i < particles.size(); i++) {
      RedDot redDot = particles.get(i);
      int direction = i % 8;
      redDot.setSpeed(1);
      redDot.display();
      
      switch(direction) {
        case 0:
          redDot.ascend();
          break;
        case 1:
          redDot.descend();
          break;
        case 2:
          redDot.forward();
          break;
        case 3:
          redDot.backward();
          break;
        case 4:
          redDot.toBottomLeft();
          break;
        case 5:
          redDot.toBottomRight();
          break;
        case 6:
          redDot.toTopLeft();
          break;
        case 7:
          redDot.toTopRight();
          break;
      }
    }
  }
  // mouse image
  pushMatrix();
    imageMode(CENTER);
    image(person, mouseX, mouseY, 50, 120);
  popMatrix();
  
  // information
  String firstText = "The COVID-19 particles can\nspread through the air and\ninfect others.";
  TextBox firstBox = new TextBox(556, 397, 300, 100, firstText, 24);
  firstBox.display();
  String secondText = "Click anywhere in the screen.";
  TextBox secondBox = new TextBox(556, 500, 325, 35, secondText, 24);
  secondBox.display();
}
 /***********************
 @desc: End of scene 3
 ************************/



/***********************
 @desc: scene2
 ************************/
void setSceneTwo(){
  displayCases = false;
  initialCase = new RedDot(440, 270, 20, 0);
  otherCases = new RedDot[21];
  
  otherCases[0] = new RedDot(456, 229, 10, -50);
  otherCases[1] = new RedDot(418, 245, 10, -1);
  otherCases[2] = new RedDot(463, 290, 10, -11);
  otherCases[3] = new RedDot(478, 259, 10, -18);
  otherCases[4] = new RedDot(419, 240, 10, -24);
  otherCases[5] = new RedDot(445, 243, 10, -30);
  otherCases[6] = new RedDot(412, 332, 10, -70);
  otherCases[7] = new RedDot(395, 218, 10, -6);
  otherCases[8] = new RedDot(378, 244, 10, -67);
  otherCases[9] = new RedDot(269, 262, 10, -9);
  otherCases[10] = new RedDot(184, 232, 10, -68);
  otherCases[11] = new RedDot(368, 335, 10, -35);
  otherCases[12] = new RedDot(380, 285, 10, -7);
  otherCases[13] = new RedDot(487, 296, 10, -81);
  otherCases[14] = new RedDot(456, 229, 10, -51);
  otherCases[15] = new RedDot(505, 314, 10, -82);
  otherCases[16] = new RedDot(451, 330, 10, -74);
  otherCases[17] = new RedDot(259, 163, 10, -50);
  otherCases[18] = new RedDot(367, 172, 10, -23);
  otherCases[19] = new RedDot(217, 271, 10, -24);
  otherCases[20] = new RedDot(539, 284, 10, -66);
}

void sceneTwo(){
  pushMatrix();
    // map
    background(193, 87, 66);
    tint(color(193, 87, 66));
    imageMode(CORNERS);
    image(chinaMap, 0, 0, 649, 427);
    
    // textbox
    if (!displayCases) {
      String firstText = "The first cases of COVID-19\nwere first detected in Wuhan, China\nin late 2019.";
      String secondText = "Click the red button where\nthe city of Wuhan is.";
      TextBox firstBox = new TextBox(556, 397, 400, 100, firstText, 24);
      TextBox secondBox = new TextBox(556, 500, 250, 60, secondText, 20);
      firstBox.display();
      secondBox.display();
    }

    
    // initial case
    initialCase.display();
    
    // more cases
    // show everything here once the button is clicked
    if (displayCases) {
      for(RedDot c : otherCases)
        c.display(); 
      String thirdText = "It then spreads throughout the\nnearby cities and provinces\nprompting the authorities to\nlock them down.";
      TextBox thirdBox = new TextBox(556, 397, 340, 125, thirdText, 24);
      thirdBox.display();
    }
  popMatrix();
}
/***********************
 @desc: End of scene2
 ************************/





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
 @desc: End of scene1
 ************************/















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
