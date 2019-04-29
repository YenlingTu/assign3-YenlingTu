final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

int soilbaseY=160;
int soilY,soilY1,soilY2,soilY3;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24,soil0,soil1,soil2,soil3,soil4,soil5,stone1,stone2,groundhogDown,groundhogIdle,groundhogLeft,groundhogRight,life;
PImage [] soil = new PImage [6];

//moving 
boolean idle = true;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

int groundhogX,groundhogY;
final int SPACING = 80;
final int X_groundhog=320;
final int Y_groundhog=80;
int groundhogSpeed=80/16;

// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
  size(640, 480, P2D);
  // Enter your setup code here (please put loadImage() here or your game will lag like crazy)
  bg = loadImage("img/bg.jpg");
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  life = loadImage("img/life.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
 //soil
  for(int i=0; i<soil.length;i++){
    soil[i]=loadImage("img/soil"+i+".png");
}
//groundhog
  groundhogX = X_groundhog;
  groundhogY =Y_groundhog;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
  switch (gameState) {

    case GAME_START: // Start Screen
    image(title, 0, 0);

    if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
      }

    }else{

      image(startNormal, START_BUTTON_X, START_BUTTON_Y);

    }
    break;

    case GAME_RUN: // In-Game

    // Background
    image(bg, 0, 0);
     
    // Sun
      stroke(255,255,0);
      strokeWeight(5);
      fill(253,184,19);
      ellipse(590,50,120,120);

    // Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

    // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    for(int x=0; x<8; x++){
      for(int y=0; y<24;y++){
        soilY = soilbaseY+y*80;
        if(y<4){
          image(soil[0], x*80, soilY);
        }
        if(y>=4 && y<8){
          image(soil[1],x*80, soilY);
        }
        if(y>=8 && y<12){
          image(soil[2],x*80, soilY);
        }
        if(y>=12 && y<16){
          image(soil[3],x*80, soilY);
        }
        if(y>=16 && y<20){
          image(soil[4],x*80, soilY);
        }
        if(y>=20 && y<24){
          image(soil[5],x*80, soilY);
        }
      }
    }
    
    // Stone1
    for(int i=0; i<8; i++){
      soilY1 = soilbaseY+i*SPACING;
      image(stone1, i*SPACING, soilY1);
    }
    
    // Stone2
    for(int soilY2=soilbaseY+640; soilY2<soilbaseY+1280; soilY2+=SPACING){
      for(int x=0; x<=width; x+=320){
        if((soilY2-soilbaseY+640)%(SPACING*4) == 0) {
          image(stone1, x+80, soilY2);
          image(stone1,x+160,soilY2);
        }
        else if((soilY2-(soilbaseY+640))/SPACING == 3 || (soilY2-(soilbaseY+640))/SPACING == 7){
          image(stone1, x+80, soilY2);
          image(stone1,x+160,soilY2);
        }
        else{
          image(stone1, x-80, soilY2);
          image(stone1,x,soilY2);
        }
      }
    }

    // Stone3
    for(int soilY3=soilbaseY+1280; soilY3<soilbaseY+1920; soilY3+=SPACING){
      for(int x=0; x<=width; x+=240){
        if((soilY3-(soilbaseY+1280))%(SPACING*3) == 0) {
          image(stone1, x+80, soilY3);
          image(stone1,x+SPACING+80,soilY3);
        }
        else if((soilY3-(soilbaseY+1280))/SPACING == 1 || (soilY3-(soilbaseY+1280))/SPACING == 4 || (soilY3-(soilbaseY+1280))/SPACING == 7){
          image(stone1, x, soilY3);
          image(stone1,x+SPACING,soilY3);
        }
        else{
          image(stone1, x-80, soilY3);
          image(stone1,x,soilY3);
        }
      }
    }
    
    for(int y3=soilbaseY+1280; y3<soilbaseY+1920; y3+=SPACING){
      for(int x=0; x<=width; x+=240){
        if((y3-(soilbaseY+1280))%(SPACING*3) == 0) {
          image(stone2, x+SPACING+80, y3);
        }
        else if((y3-(soilbaseY+1280))/SPACING == 1 ||(y3-(soilbaseY+1280))/SPACING == 4||(y3-(soilbaseY+1280))/SPACING == 7){
          image(stone2, x+SPACING, y3);
        }
        else{
          image(stone2, x, y3);
        }
      }
    }

    
    // Player
    if(idle){
      image(groundhogIdle,groundhogX,groundhogY);
    }
    
    if(downPressed){
      idle = false;
      leftPressed = false;
      rightPressed = false;
      image(groundhogDown,groundhogX,groundhogY);
      if(groundhogY < soilbaseY+1520){
       soilbaseY -= groundhogSpeed;
        if(soilbaseY%80 == 0){
        downPressed = false;
        idle = true;
        }
      }
      else{
        groundhogY += groundhogSpeed;
        if(groundhogY%80 == 0){
        downPressed = false;
        idle = true;
        }
      } 
    }
    
    if(leftPressed){
      idle = false;
      downPressed = false;
      rightPressed = false;
      image(groundhogLeft,groundhogX,groundhogY);
      groundhogX -= groundhogSpeed;
      if(groundhogX%80 == 0){
        leftPressed = false;
        idle = true;
      }
    }
    
    if(rightPressed){
      idle = false;
      leftPressed = false;
      downPressed = false;
      image(groundhogRight,groundhogX,groundhogY);
      groundhogX += groundhogSpeed;
      if(groundhogX%80 == 0){
        rightPressed = false;
        idle = true;
      }
    }
    
    // Player boundary detection
    if(groundhogX<0){
      leftPressed = false;
      idle = true;
      groundhogX = 0;
    }
    if(groundhogX>width-SPACING){
      rightPressed = false;
      idle = true;
      groundhogX = width-SPACING;
    }
    if(groundhogY>height-SPACING){
      downPressed = false;
      idle = true;
      groundhogY = height-SPACING;
    }

    
    // Health UI
    for(int i=0; i<playerHealth; i++){
      image(life,10+i*70, 10);
    }
    if(playerHealth == 0){
      gameState = GAME_OVER;
    }
    

    break;



    case GAME_OVER: // Gameover Screen
    image(gameover, 0, 0);
    
    if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
        // Remember to initialize the game here!
        groundhogX = X_groundhog;
        groundhogY = Y_groundhog;
        playerHealth = 2;
        soilbaseY = 160;

      }
    }else{

      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

    }
    break;
    
  }

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
  // Add your moving input code here
if(key == CODED){
   switch(keyCode){
    case DOWN:
          downPressed = true;
          break;
        case LEFT:
          leftPressed = true;
          break;
        case RIGHT:
          rightPressed = true;
          break;
      }
    }
  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  

    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 80;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 80;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
