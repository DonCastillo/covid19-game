/***********************
 Don Castillo, NMED 3380 B
 Project 3: Facts About COVID-19
 Last Modified: 12/03/2020 1:25PM 
 ************************/
 

/***********************
 @desc: Global Variables
 ************************/
// font used for the opening title
PFont font;

// images
PImage coronaBG, chinaMap, person, crowd, office, desk, closeCorona, hand;

// constant values
int TOTAL_SCENES = 8;
int PERSON_WIDTH = 200;
int PERSON_HEIGHT = 150;
int PARTICLE_SIZE = 20;

// inidicates scene index
int sceneIndicator = 0;

// SCENE 0

// SCENE 1 
ArrayList<Virus> otherCases;
Virus initialCase;
boolean displayCases;

// SCENE 2
ArrayList<Virus> handVirus;

// SCENE 3
boolean displayVirus;
ArrayList<Virus> particles;

// SCENE 4

// SCENE 5
ArrayList<Person> persons;
int numOfPress;
boolean showMask;

// SCENE 6
ArrayList<WhiteParticle> whiteParticles;
WhiteParticle redParticle;
boolean hasAddedInfected;
boolean enableAddingInfection;


/****************************************
 @desc: Sets everything up
 ****************************************/
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

  // set all scene elements
  setSceneOne();
  setSceneTwo();
  setSceneThree();
  setSceneFive();
  setSceneSix();
}


void draw() {
sceneSeven();
  switch(sceneIndicator) {
    case 0:
      sceneZero();
      //println("scene0");
      break;
    case 1:
      sceneOne();
      //println("scene1");
      break;
    case 2:
      sceneTwo();
      //println("scene3");
      break;
    case 3:
      sceneThree();
      break;
    case 4:
      sceneFour();
      //println("scene4");
      break;
    case 5:
      sceneFive();
      //println("scene5");
      break;
    case 6:
      sceneSix();
      //println("scene6");
      break;
    case 7:
      sceneSeven();
      break;
  }  
}

/****************************************
 @desc: Triggered when mouse is pressed
 ****************************************/
void mousePressed() {
    println("x: " + mouseX + " y: " + mouseY);
    // applies only to scene 1
    if (sceneIndicator == 1) 
    {
        if ((mouseX >= 430 && mouseX <= 450) && (mouseY >= 260 && mouseY <= 280)) {
          cursor(HAND);
          displayCases = true; // show other cases
        } else {
          cursor(ARROW);
        }
    }
    
    // applies only to scene 3
    if (sceneIndicator == 3) 
    {
        displayVirus = true;
    }
}

/****************************************
 @desc: Triggered when mouse is moved
 ****************************************/
void mouseMoved() {
    // applies only to scene 1
    if (sceneIndicator == 1) 
    {
        if ((mouseX >= 430 && mouseX <= 450) && (mouseY >= 260 && mouseY <= 280)) {
          cursor(HAND);
        } else {
          cursor(ARROW);
        }
    }
}

/****************************************
 @desc: Triggered when mouse is released
 ****************************************/
void mouseReleased() {
  if (sceneIndicator == 6) 
  {
      // add an infected particle anywhere where the mouse
      // is released
      if(enableAddingInfection){
        int x = mouseX;
        int y = mouseY;
        redParticle = new WhiteParticle(x, y, PARTICLE_SIZE, true);
        redParticle.setSpeed(0.2);
        redParticle.setBoundary(0, width, 0, height);
        hasAddedInfected = true;
        enableAddingInfection = false;
      }
  }
}

/****************************************
 @desc: Triggered when key is pressed
 ****************************************/
void keyPressed() {
  switch(keyCode) {
    case ' ':
      incrementScene(); // increment scene
      break;
  }
}

/****************************************
 @desc: Triggered when mouse is released
 ****************************************/
void keyReleased() {
  // only applies to scene 5
  if (sceneIndicator == 5) 
  {
    if (key == CODED) {
      // make the people move when UP key is pressed
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
      }
    }
    // when m char is pressed
    if (key == 'M' || key == 'm') {
      showMask = true;
    }
  }  
}



/***********************
 @desc: scene 7
        Ending credits
 ************************/
 void sceneSeven() {
    pushMatrix();
      setBackground(coronaBG, color(193, 87, 66));
      String a = "Created by: Don Castillo";
      TextBox aBox = new TextBox(30, 30, 230, 35, a, 20);
      aBox.display();

      // China map from HiClipArt.com
      // https://www.hiclipart.com/free-transparent-background-png-clipart-foqfm

      // office image from Cadeau Maestro, Pexels.com
      // https://www.pexels.com/photo/people-sitting-on-chairs-beside-their-desks-in-an-office-1170412/

      // hand image from Daria Shevtsova, Pexels.com
      // https://www.pexels.com/photo/photo-of-hand-on-wall-1578238/

      // crowd image from Petr Kratochvil, PublicDomainPictures.net
      // https://www.publicdomainpictures.net/en/view-image.php?image=23150&picture=crowd-of-people

      // COVID-19 cells image from Pixabay.com
      // https://pixabay.com/illustrations/corona-coronavirus-virus-blood-5174671/

      // desktop image Fauxels, Pexels.com
      // https://www.pexels.com/photo/flatlay-display-of-electronics-next-to-eyeglases-3184454/


      String b = "IMAGES:\n" + 
                  "Office image by Cadeau Maestro, Pexels.com\n" +
                  "Hand image by Daria Shevtsova, Pexels.com\n" +
                  "Crowd image by Petr Kratochvil, PublicDomainPictures.net\n" +
                  "Desktop image by Fauxels, Pexels.com";
      TextBox bBox = new TextBox(30, 95, 530, 140, b, 20);
      bBox.display();

      //https://www.vox.com/science-and-health/2020/3/18/21184992/coronavirus-covid-19-flu-comparison-chart
      //https://en.wikipedia.org/wiki/Coronavirus

      String c = "SOURCES:\n" +
                 "Vox.com\n" +
                 "Wikipedia";
      TextBox cBox = new TextBox(30, 260, 115, 85, c, 20);
      cBox.display();
    popMatrix();
 }
/*** END of scene 7 *********************/

/***********************
 @desc: scene 6
        show white particles being infected
 ************************/
void setSceneSix() {
  int NUM_OF_PARTICLES = 300;
  hasAddedInfected = false;
  enableAddingInfection = true;
  
  // initialize all the white particles
  whiteParticles = new ArrayList<WhiteParticle>();
  for (int i = 0; i < NUM_OF_PARTICLES; ++i) 
  {
      int oX = int(random(0, width));
      int oY = int(random(0, height));
      WhiteParticle w = new WhiteParticle(oX, oY, PARTICLE_SIZE, false);
      w.setSpeed(3);
      w.setBoundary(0, width, 0, height); // boundary that prevents particle from going off screen
      whiteParticles.add(w);
  }
}

void sceneSix() {
  // grey backgrounc
  background(50);
  
  // show white particles
  for (WhiteParticle w : whiteParticles){
    w.changeDirection();
    w.move();
    w.display();
  }

  // if an infected particle is added
  if(hasAddedInfected) 
  {   
      // display the infected 
      // particle and make them move
      redParticle.display();
      redParticle.changeDirection();
      redParticle.move();
  
      // infect white particles
      for(int i = 0; i < whiteParticles.size(); ++i) {
        redParticle.infect(whiteParticles.get(i));
      }
      
      // display information after the infected particle has been added
      String secondText = "COVID-19 has a R0 number of\n" + 
                         "2 - 2.5, that means an infected\n" + 
                         "person can infect at least\n" +
                         "2 more people. This makes it\n" +
                         "more contagious than the regular\n" +
                         "seasonal flu which has R0 of 1.3.";
      TextBox secondBox = new TextBox(556, 397, 365, 185, secondText, 24);
      secondBox.display();
  } 
  else 
  {
      // display initial information before adding the infected particle
      String firstText = "Click anywhere.";
      TextBox firstBox = new TextBox(556, 397, 185, 40, firstText, 24);
      firstBox.display();
  } 
}
/*** END of scene 6 *********************/




/***********************
 @desc: scene 5
        shows 4 people social distancing
 ************************/
void setSceneFive(){
   numOfPress = 0;
   int offset = 20; // margin
   showMask = false;

   persons = new ArrayList<Person>();
   persons.add(new Person(width/3 - offset , height/2 - offset, PERSON_WIDTH, PERSON_HEIGHT)); // topleft
   persons.add(new Person(width/3 + offset , height/2 - offset, PERSON_WIDTH, PERSON_HEIGHT)); // topright
   persons.add(new Person(width/3 - offset , height/2 + offset, PERSON_WIDTH, PERSON_HEIGHT)); // bottomleft
   persons.add(new Person(width/3 + offset , height/2 + offset, PERSON_WIDTH, PERSON_HEIGHT)); // bottomright
}
 
void sceneFive() {
  // crowd background
  setBackground(crowd, color(149, 149, 149));

  
  // display persons
  for (Person p : persons)
    p.display();

  // dispay first information
  // display information
   String firstText = "Press the UP key six times.";
   TextBox firstBox = new TextBox(556, 397, 290, 40, firstText, 24);
   firstBox.display();

  // display information when the mouse is clicked more than 6 times
  if (numOfPress >= 6) 
  {
    String secondText = "Social distancing is the key\n" +
                       "to minimize the spread of COVID-19.";
    TextBox secondBox = new TextBox(556, 397, 400, 70, secondText, 24);
    secondBox.display();

    String thirdText = "Press M.";
    TextBox thirdBox = new TextBox(556, 480, 100, 35, thirdText, 24);
    thirdBox.display();
    
    // show people in mask
    if (showMask) {
      for (Person p : persons)
        p.addMask();

      String fourthText = "Wearing a mask reduces the\n" +
                         "chance of inhaling the COVID-19\n" + 
                         "particles through the air.";
      TextBox fourthBox = new TextBox(556, 480, 400, 105, fourthText, 24);
      fourthBox.display();
    }
  }
}
/*** END of scene 5 *********************/



/***********************
 @desc: SCENE 4
        shows desk in dark with the mouse pointer as flash light
 ************************/
 void sceneFour() {
    // set the desk as the background
    setBackground(desk, color(100, 100, 100));

    // manipulate image pixels
    loadPixels();
    for (int x = 0; x < desk.width; x++) 
    {
        for (int y = 0; y < desk.height; y++) 
        {
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

   // display information
   String firstText = "COVID-19 particles may be\n" +
                      "present anywhere. The best way\n" +
                      "to avoid them is to disinfect\n" +
                      "everything we come in contact with.";
   TextBox firstBox = new TextBox(556, 397, 400, 130, firstText, 24);
   firstBox.display();
 }
/*** END of scene 4 *********************/






/***********************
 @desc: SCENE 3
        shows virus particles emitting from the 
        person when the mouse is clicked
 @todo: add a sneezing sound
 ************************/
 void setSceneThree() {
   displayVirus = false;
   particles = new ArrayList<Virus>();
 }
 
void sceneThree() {
  // office background
  setBackground(office);

  // generate virus particles when the mouse is released/clicked
  if (displayVirus) 
  {
      // add particles from where mouse is pressed
      // origin of each particle is random 
      int offsetX = int(random(0.00, 50.00));
      int offsetY = int(random(0.00, 50.00));
      int initTrans = 100; // initial transparency of each particle
      if (mousePressed) 
      {
            Virus r = new Virus(mouseX - offsetX, mouseY + offsetY, 20);
            r.setTransparency(initTrans);
            particles.add(r);
            
            r = new Virus(mouseX - offsetX, mouseY + offsetY, 20);
            r.setTransparency(initTrans);
            particles.add(r);
            
            r = new Virus(mouseX + offsetX, mouseY + offsetY, 20);
            r.setTransparency(initTrans);
            particles.add(r);
            
            r = new Virus(mouseX + offsetX, mouseY - offsetY, 20);
            r.setTransparency(initTrans);
            particles.add(r);
            
            r = new Virus(mouseX - offsetX, mouseY - offsetY, 20);
            r.setTransparency(initTrans);
            particles.add(r);
      }
    
      // display particles and make them move in random direction
      for(int i = 0; i < particles.size(); i++) 
      {
          Virus v = particles.get(i);
          int direction = i % 8; 
          v.setSpeed(5);
          v.display();
          v.increaseTransparency();
          
          switch(direction) {
            case 0:
              v.ascend();
              break;
            case 1:
              v.descend();
              break;
            case 2:
              v.forward();
              break;
            case 3:
              v.backward();
              break;
            case 4:
              v.toBottomLeft();
              break;
            case 5:
              v.toBottomRight();
              break;
            case 6:
              v.toTopLeft();
              break;
            case 7:
              v.toTopRight();
              break;
          }
      }
  }
  
  // human as the mouse image
  pushMatrix();
    imageMode(CENTER);
    image(person, mouseX, mouseY, 200, 150);
  popMatrix();
  
  // display information
  String firstText = "The COVID-19 particles can\n" +
                     "spread through the air and\n" + 
                     "infect others.";
  String secondText = "Click anywhere on the screen.";
  TextBox firstBox = new TextBox(556, 397, 300, 100, firstText, 24);
  TextBox secondBox = new TextBox(556, 500, 325, 35, secondText, 24);
  firstBox.display();
  secondBox.display();
}
/*** END of scene 3 *********************/








/*****************************************
 @desc: SCENE 2
        shows an image of a hand with virus
        particles that can be zoomed
        @todo add information
 *****************************************/
void setSceneTwo() {
  handVirus = new ArrayList<Virus>();
  handVirus.add(new Virus(470, 368, PARTICLE_SIZE)); // point finger
  handVirus.add(new Virus(675, 352, PARTICLE_SIZE)); // thumb
  handVirus.add(new Virus(425, 442, PARTICLE_SIZE)); // bottom left
  handVirus.add(new Virus(509, 424, PARTICLE_SIZE)); // bottom right
  handVirus.add(new Virus(654, 125, PARTICLE_SIZE)); // bottom right

}

void sceneTwo() {
  // distance between the center of the screen and mouse
  float distance = dist(float(width/2), float(height/2), float(mouseX), float(mouseY));
  
  // image of the hand
  pushStyle();
    imageMode(CENTER);
    setBackground(hand);
    filter(BLUR, map(distance, 10, 100, 0, 15));
  popStyle();
  
  // center cross
  pushStyle();
    float lineLength = 40.00;
    stroke(0);
    strokeWeight(3);
    line(width/2, height/2, width/2, height/2 + lineLength); // center - down
    line(width/2, height/2, width/2  + lineLength, height/2); // center - right
    line(width/2, height/2, width/2, height/2 - lineLength); // center - up
    line(width/2, height/2, width/2 - lineLength, height/2); // center - left
  popStyle();
  
  // limit that the mouse can move to zoom in/out the virus on the hand
  float c = constrain(distance, 10, 100);

  for (Virus r : handVirus) 
  {
      if (distance > 65)
        r.displayAsImage();
      else
        r.display();

      // change virus image depending on the distance between mouse and center
      r.radius = int(c);
  }

  // display information
  String thirdText = "The spikes portruding from the\n" + 
                     "surface of the virus looks like\n" +
                     "a crown or corona in Latin, hence\n" +
                     "the name of this family of\n" +
                    "virus - coronavirus.";
  TextBox thirdBox = new TextBox(42, 44, 370, 150, thirdText, 24);
  thirdBox.display();
}
/*** END of scene 2 *********************/













/*****************************************
 @desc: SCENE 1
        shows where the virus originated
 *****************************************/
void setSceneOne(){
  displayCases = false;

  // initial case, also serves as a button to show other cases
  initialCase = new Virus(440, 270, 20);
  initialCase.setTransparency(100);
 
  // initialize all the red dots and their initial transparency
  // needed to indicated specific values that's why for-loop was
  // not used to add objects

  otherCases = new ArrayList<Virus>();
  
  Virus r1 = new Virus(456, 229, 10);
  r1.setTransparency(-50);
  otherCases.add(r1);
  
  Virus r2 = new Virus(418, 245, 10);
  r2.setTransparency(-100);
  otherCases.add(r2);
  
  Virus r3 = new Virus(463, 290, 10);
  r3.setTransparency(-11);
  otherCases.add(r3);
  
  Virus r4 = new Virus(478, 259, 10);
  r4.setTransparency(-18);
  otherCases.add(r4);
  
  Virus r5 = new Virus(419, 240, 10);
  r5.setTransparency(-24);
  otherCases.add(r5);
  
  Virus r6 = new Virus(445, 243, 10);
  r6.setTransparency(-30);
  otherCases.add(r6);
  
  Virus r7 = new Virus(412, 332, 10);
  r7.setTransparency(-70);
  otherCases.add(r7);
  
  Virus r8 = new Virus(395, 218, 10);
  r8.setTransparency(-6);
  otherCases.add(r8);
  
  Virus r9 = new Virus(378, 244, 10);
  r9.setTransparency(-67);
  otherCases.add(r9);
  
  Virus r10 = new Virus(269, 262, 10);
  r10.setTransparency(-9);
  otherCases.add(r10);
  
  Virus r11 = new Virus(184, 232, 10);
  r11.setTransparency(-68);
  otherCases.add(r11);
  
  Virus r12 = new Virus(368, 335, 10);
  r12.setTransparency(-35);
  otherCases.add(r12);
  
  Virus r13 = new Virus(380, 285, 10);
  r13.setTransparency(-7);
  otherCases.add(r13);
  
  Virus r14 = new Virus(487, 296, 10);
  r14.setTransparency(-81);
  otherCases.add(r14);
  
  Virus r15 = new Virus(456, 229, 10);
  r15.setTransparency(-51);
  otherCases.add(r15);
  
  Virus r16 = new Virus(505, 314, 10);
  r16.setTransparency(-82);
  otherCases.add(r16);
  
  Virus r17 = new Virus(451, 330, 10);
  r17.setTransparency(-74);
  otherCases.add(r17);
  
  Virus r18 = new Virus(259, 163, 10);
  r18.setTransparency(-50);
  otherCases.add(r18);
  
  Virus r19 = new Virus(367, 172, 10);
  r19.setTransparency(-23);
  otherCases.add(r19);
  
  Virus r20 = new Virus(217, 271, 10);
  r20.setTransparency(-24);
  otherCases.add(r20);
  
  Virus r21 = new Virus(539, 284, 10);
  r21.setTransparency(-66);
  otherCases.add(r21);
}

void sceneOne(){
  pushMatrix();
    // map
    pushStyle();
      background(193, 87, 66);
      tint(color(193, 87, 66));
      imageMode(CORNERS);
      image(chinaMap, 0, 0, 649, 427);
    popStyle();
    
    // textbox to be shown before the button is clicked
    if (!displayCases) {
      String firstText = "The first cases of COVID-19\n" +
                         "were first detected in Wuhan, China\n" +
                         "in late 2019.";
      String secondText = "Click the red button where\n" + 
                          "the city of Wuhan is.";
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
      for(Virus c : otherCases) {
        c.display(); 
        c.increaseTransparency();
      }
        
      String thirdText = "It then spread throughout the\n" +
                          "nearby cities and provinces\n" +
                          "prompting the authorities to\n" +
                          "lock them down.";
      TextBox thirdBox = new TextBox(556, 397, 340, 125, thirdText, 24);
      thirdBox.display();
    }
  popMatrix();
}
/*** END of scene 1 *********************/



/*****************************************
 @desc: scene 0
        shows the openin title of the project
 *****************************************/
void sceneZero(){
  pushMatrix();
    setBackground(coronaBG, color(193, 87, 66));
    textFont(font);
    textSize(60);
    fill(255);
    textAlign(CENTER, CENTER);
    text("FACTS ABOUT \nCOVID-19", width/2, height/2);
  popMatrix();
}
/*** END of scene 0 *********************/



/***********************
 @desc: increments scene
 ************************/
void incrementScene() {
  sceneIndicator++;
  // make sure that sceneIndicator yields to a 
  // value between 0 and TOTAL_SCENES
  sceneIndicator = sceneIndicator % TOTAL_SCENES;
}

/***********************
 @desc: sets the scenes background image without tint
 @params:  image to be displayed
 ************************/
void setBackground(PImage pImage) {
  pushStyle();
    imageMode(CENTER);
    image(pImage, width/2, height/2, width, height);
  popStyle();
}

/***********************
 @desc: sets the scenes background image with tint
 @params:  image to be displayed
 ************************/
void setBackground(PImage pImage, color pColor) {
  pushStyle();
    tint(pColor);
    imageMode(CENTER);
    image(pImage, width/2, height/2, width, height);
  popStyle();
}
