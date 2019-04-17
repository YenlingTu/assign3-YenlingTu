final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

int soil_W=80;
int soil_H=80;
int soilX=0;
int soil0Y=160;
int soil1Y=480;
int soil2Y=800;
int soil3Y=1120;
int soil4Y=1440;
int soil5Y=1760;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24,soil0,soil1,soil2,soil3,soil4,soil5,stone1,stone2;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
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
    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){
    image(soil0,soil_W*soilX,soil0Y+soil_H*Y);
  }
  }

    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){
    image(soil1,soil_W*soilX,soil1Y+soil_H*Y);
  }
  }

    
    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){
    image(soil4,soil_W*soilX,soil4Y+soil_H*Y);
  }
  }
    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){   
    image(soil5,soil_W*soilX,soil5Y+soil_H*Y);
  }
  }
    //stone17-24
     for (int stoneI=0; stoneI<8;stoneI++){
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*7);
   image(stone2,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*7);
  image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*6);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*4);
    image(stone2,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*4);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H*3);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H);
   image(stone2,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1+soil_H);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1); 
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*2);
    image(stone2,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*2);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*3);
    image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*5);
   image(stone2,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*5);
   image(stone1,soil_W*stoneI,soil5Y+soil_H*3+soil_H*stoneI*-1-soil_H*6);
     }
    //stone1-8
    for (int stoneI=0; stoneI<8;stoneI++){
      image(stone1,soil_W*stoneI,soil0Y+soil_H*stoneI);
    }
    //soil23
    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){
    image(soil2,soil_W*soilX,soil2Y+soil_H*Y);
  }
  }
    for (int soilX=0; soilX<8;soilX++){
    for (int Y=0; Y<4;Y++){
    image(soil3,soil_W*soilX,soil3Y+soil_H*Y);
  }
  }
     //stone9-16
    for (int stoneI=0; stoneI<3;stoneI++){
      image(stone1,soil_W*(1+4*stoneI),soil2Y);//line1
      image(stone1,soil_W*(2+4*stoneI),soil2Y);
      image(stone1,soil_W*(1+4*stoneI),soil2Y+3*soil_H);//line4
      image(stone1,soil_W*(2+4*stoneI),soil2Y+3*soil_H);
      image(stone1,soil_W*(1+4*stoneI),soil3Y);//line5
      image(stone1,soil_W*(2+4*stoneI),soil3Y);
      image(stone1,soil_W*(1+4*stoneI),soil3Y+3*soil_H);//line9
      image(stone1,soil_W*(2+4*stoneI),soil3Y+3*soil_H);
      image(stone1,soil_W*(4*stoneI-1),soil2Y+soil_H);//line2
      image(stone1,soil_W*(4*stoneI),soil2Y+soil_H);
      image(stone1,soil_W*(4*stoneI-1),soil2Y+2*soil_H);//line3
      image(stone1,soil_W*(4*stoneI),soil2Y+2*soil_H);
      image(stone1,soil_W*(4*stoneI-1),soil2Y+5*soil_H);//line6
      image(stone1,soil_W*(4*stoneI),soil2Y+5*soil_H);
      image(stone1,soil_W*(4*stoneI-1),soil2Y+6*soil_H);//line7
      image(stone1,soil_W*(4*stoneI),soil2Y+6*soil_H);
    }
   
    
      
    // Player

    // Health UI

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

  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
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
