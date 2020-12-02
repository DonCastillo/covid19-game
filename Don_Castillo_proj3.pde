/***********************
 Don Castillo, NMED 3380 B
 Project 3: 
 Last Modified: 10/24/2020 10:30PM 
 ************************/
 

/***********************
 @desc: Global Variables
 ************************/
PFont font;
PImage coronaBG, chinaMap, person, crowd, office, desk, closeCorona, hand;
PGraphics zoom;
int sceneIndicator = 0;
int TOTAL_SCENES = 6;
int PERSON_WIDTH = 200, PERSON_HEIGHT = 150;
int PARTICLE_SIZE = 20;

// scene 2 global variables
ArrayList<RedDot> otherCases;
RedDot initialCase;
boolean displayCases;

// scene 3
boolean displayVirus;
ArrayList<RedDot> particles;

// scene4
ArrayList<Person> persons;
int numOfPress = 0;
boolean showMask;

// scene 4
RedDot[] droplets;

// scene 5
ArrayList<RedDot> handVirus;

 
void setup(){
  size(1000, 600);
  background(0);
  
  // load text font
  font = loadFont("ProcessingSansPro-Semibold-48.vlw");
  
  // load all images
  coronaBG = loadImage("corona.jpg");
  chinaMap = loadImage("china.png");
  person = loadImage("person.png");
  crowd = loadImage("crowd.jpg");
  office = loadImage("office.jpg");
  desk = loadImage("desktop.jpg");
  closeCorona = loadImage("virus.png");
  hand = loadImage("hand.jpg");
  setSceneOne();
  setSceneTwo();
  setSceneThree();
  setSceneFour();
  setSceneSix();
}


void draw() {
  //sceneTwo();
  //println(wave);
  sceneSix();
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
      //sceneFour();
      break;
    case 4:
      //sceneFive();
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
            persons.get(0).x = persons.get(0).x - movement;
            persons.get(0).y = persons.get(0).y - movement;
            
            persons.get(1).x = persons.get(1).x + movement;
            persons.get(1).y = persons.get(1).y - movement;
            
            persons.get(2).x = persons.get(2).x - movement;
            persons.get(2).y = persons.get(2).y + movement;
            
            persons.get(3).x = persons.get(3).x + movement;
            persons.get(3).y = persons.get(3).y + movement;
          } 
          println("here");
      }
    }
    if (key == 'M' || key == 'm') {
      showMask = true;
    }
  }
}



/***********************
 @desc: scene 6
 ************************/
void setSceneSix() {
  int NUM_OF_PARTICLES = 5;
  handVirus = new ArrayList<RedDot>();
  // put the virus particles anywhere in the hand specified by the constrain 
  //for (int i = 0; i < NUM_OF_PARTICLES; ++i) {
  //  float r = random(0, 563);
  //  float x = constrain(r, 357, 563);
  //  float y = constrain(r, 338, 405);
  //  handVirus.add(new RedDot(int(x), int(y), PARTICLE_SIZE));
  //}

  handVirus.add(new RedDot(470, 368, PARTICLE_SIZE)); // point 
  handVirus.add(new RedDot(675, 352, PARTICLE_SIZE)); //thumb
  handVirus.add(new RedDot(425, 442, PARTICLE_SIZE)); //bottom left
  handVirus.add(new RedDot(509, 424, PARTICLE_SIZE)); // bottom right
  handVirus.add(new RedDot(654, 125, PARTICLE_SIZE)); // bottom right

}


void sceneSix() {
  float d = dist(float(width/2), float(height/2), float(mouseX), float(mouseY));
  
  imageMode(CENTER);
  background(50);
  
  image(hand, width/2, height/2, width, height);  
  filter(BLUR, map(d, 10, 300, 0, 20));
  
  
  // draw cursor
  strokeWeight(3);
  float lineLength = 40.00;
  line(width/2, height/2, width/2, height/2 + lineLength); // center - down
  line(width/2, height/2, width/2  + lineLength, height/2); // center - right
  line(width/2, height/2, width/2, height/2 - lineLength); // center - up
  line(width/2, height/2, width/2 - lineLength, height/2); // center - left
  
  
  //fill(color(227, 85, 57));
  //int h = constrain(mouseY, 10, 300);
  //int w = constrain(mouseX, 10, 300);
  //float d = dist(float(width/2), float(height/2), float(mouseX), float(mouseY));
  float c = constrain(d, 10, 100);
  println(d);
  //ellipse(width/2, height/2, d, d);
  //ellipse(width/2, height/2, d, d);

  for (RedDot r : handVirus) {
    if (d > 65) {
      r.displayAsImage();
      //r.rotateClockwise();
    } else {
      r.display();
    } 
    r.radius = int(c);
    //r.transparency = int(d);
  }
    
}
/***********************
 @desc: scene 6
 ************************/


/***********************
 @desc: scene 5
 ************************/
 void sceneFive() {
   setBackground(desk, color(100, 100, 100));
   loadPixels();
   for (int x = 0; x < width; x++) {
     for (int y = 0; y < height; y++) {

       int loc = x + y * width;
       float r = red(desk.pixels[loc]);
       float g = green(desk.pixels[loc]);
       float b = blue(desk.pixels[loc]);
       float d = dist(mouseX, mouseY, x, y);
       float factor = map(d, 0, 200, 2, 0);
       pixels[loc] = color(r*factor, g*factor, b*factor);
     }
   }
   updatePixels();
   String firstText = "COVID-19 particles may be\npresent anywhere. The best way\nto avoid them is to disinfect\neverything we come in contact with.";
   TextBox firstBox = new TextBox(556, 397, 400, 130, firstText, 24);
   firstBox.display();
 }
 /***********************
 @desc: scene 5
 ************************/





/***********************
 @desc: scene 4
 ************************/
void setSceneFour(){
   persons = new ArrayList<Person>();
   int offset = 20;
   showMask = false;
   
   persons.add(new Person(width/3 - offset , height/2 - offset, PERSON_WIDTH, PERSON_HEIGHT)); // topleft
   persons.add(new Person(width/3 + offset , height/2 - offset, PERSON_WIDTH, PERSON_HEIGHT)); // topright
   persons.add(new Person(width/3 - offset , height/2 + offset, PERSON_WIDTH, PERSON_HEIGHT)); // bottomleft
   persons.add(new Person(width/3 + offset , height/2 + offset, PERSON_WIDTH, PERSON_HEIGHT)); // bottomright
}
 
void sceneFour() {
  setBackground(crowd, color(149, 149, 149));
  
  // display persons
  for (Person p : persons)
    p.display();

  // textbox
  if (numOfPress >= 6) {
    String firstText = "Social distancing is they key\nto minimize the spread of COVID-19.";
    TextBox firstBox = new TextBox(556, 397, 400, 70, firstText, 24);
    firstBox.display();
    if (showMask) {
      for (Person p : persons)
        p.addMask();
    }
  }
}
 /***********************
 @desc: End of scene 3
 ************************/



/***********************
 @desc: scene 3
 @todo: add a sneezing sound
 ************************/
 void setSceneThree(){
   displayVirus = false;
   particles = new ArrayList<RedDot>();
 }
 
 void sceneThree() {
  setBackground(office, color(168,112,65));

  // add everytime
  if (displayVirus) {
    // add particles where mouse is pressed
    int offsetX = int(random(0.00, 50.00));
    int offsetY = int(random(0.00, 50.00));
    int initTrans = -10;
    if (mousePressed) {
          RedDot r = new RedDot(mouseX - offsetX, mouseY + offsetY, 20);
          r.setTransparency(initTrans);
          particles.add(r);
          
          r = new RedDot(mouseX - offsetX, mouseY + offsetY, 20);
          r.setTransparency(initTrans);
          particles.add(r);
          
          r = new RedDot(mouseX + offsetX, mouseY + offsetY, 20);
          r.setTransparency(initTrans);
          particles.add(r);
          
          r = new RedDot(mouseX + offsetX, mouseY - offsetY, 20);
          r.setTransparency(initTrans);
          particles.add(r);
          
          r = new RedDot(mouseX - offsetX, mouseY - offsetY, 20);
          r.setTransparency(initTrans);
          particles.add(r);
    }
    
    for(int i = 0; i < particles.size(); i++) {
      RedDot redDot = particles.get(i);
      int direction = i % 8;
      redDot.setSpeed(1);
      redDot.display();
      redDot.increaseTransparency();
      
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
    image(person, mouseX, mouseY, 200, 150);
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
 
  // initialize all the red dots and their initial transparency
  initialCase = new RedDot(440, 270, 20);
  initialCase.setTransparency(0);
  otherCases = new ArrayList<RedDot>();
  
  RedDot r1 = new RedDot(456, 229, 10);
  r1.setTransparency(-50);
  otherCases.add(r1);
  
  RedDot r2 = new RedDot(418, 245, 10);
  r2.setTransparency(-1);
  otherCases.add(r2);
  
  RedDot r3 = new RedDot(463, 290, 10);
  r3.setTransparency(-11);
  otherCases.add(r3);
  
  RedDot r4 = new RedDot(478, 259, 10);
  r4.setTransparency(-18);
  otherCases.add(r4);
  
  RedDot r5 = new RedDot(419, 240, 10);
  r5.setTransparency(-24);
  otherCases.add(r5);
  
  RedDot r6 = new RedDot(445, 243, 10);
  r6.setTransparency(-30);
  otherCases.add(r6);
  
  RedDot r7 = new RedDot(412, 332, 10);
  r7.setTransparency(-70);
  otherCases.add(r7);
  
  RedDot r8 = new RedDot(395, 218, 10);
  r8.setTransparency(-6);
  otherCases.add(r8);
  
  RedDot r9 = new RedDot(378, 244, 10);
  r9.setTransparency(-67);
  otherCases.add(r9);
  
  RedDot r10 = new RedDot(269, 262, 10);
  r10.setTransparency(-9);
  otherCases.add(r10);
  
  RedDot r11 = new RedDot(184, 232, 10);
  r11.setTransparency(-68);
  otherCases.add(r11);
  
  RedDot r12 = new RedDot(368, 335, 10);
  r12.setTransparency(-35);
  otherCases.add(r12);
  
  RedDot r13 = new RedDot(380, 285, 10);
  r13.setTransparency(-7);
  otherCases.add(r13);
  
  RedDot r14 = new RedDot(487, 296, 10);
  r4.setTransparency(-81);
  otherCases.add(r14);
  
  RedDot r15 = new RedDot(456, 229, 10);
  r15.setTransparency(-51);
  otherCases.add(r15);
  
  RedDot r16 = new RedDot(505, 314, 10);
  r16.setTransparency(-82);
  otherCases.add(r16);
  
  RedDot r17 = new RedDot(451, 330, 10);
  r17.setTransparency(-74);
  otherCases.add(r17);
  
  RedDot r18 = new RedDot(259, 163, 10);
  r18.setTransparency(-50);
  otherCases.add(r18);
  
  RedDot r19 = new RedDot(367, 172, 10);
  r19.setTransparency(-23);
  otherCases.add(r19);
  
  RedDot r20 = new RedDot(217, 271, 10);
  r20.setTransparency(-24);
  otherCases.add(r20);
  
  RedDot r21 = new RedDot(539, 284, 10);
  r21.setTransparency(-66);
  otherCases.add(r21);
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
    initialCase.increaseTransparency();
    
    // more cases
    // show everything here once the button is clicked
    if (displayCases) {
      for(RedDot c : otherCases) {
        c.display(); 
        c.increaseTransparency();
      }
        
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
  pushStyle();
  tint(pColor);
  imageMode(CENTER);
  image(pImage, width/2, height/2, width, height);
  popStyle();
}
