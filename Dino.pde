PVector gravity = new PVector(0, 1);
boolean isGround = true;
boolean start = false;
int score = 0;
int highScore = 0;
double timeMS;
boolean hit = false;
int w = 1500;
int textureType;
Player player;
PImage treePic;
Tree tree;
PImage cactPic;
Cactus cactus;
PImage longCactPic;
LongCactus longCactus;
PImage cloudPic;
Cloud cloud;

void frameCount()  {
}

void jump() {
  //while(height/2 - charHeight != jumpHeight) {
    
  //}
}

void setup() {
  size(1500,600);
  background(10,150, 200);
  player = new Player();
  imageMode(CORNER);
}

void draw() {
  if(start) { // Start Game on Key Press
      
  //draw line
  line(0, height/1.25, width, height/1.25);
  
  player.display();
  
  
  
  }
}

void reset() {
  size(800,400);
  background(10,150, 200);
}

void newHighScore(int score) {
  if (score > highScore) {
    highScore = score;
  }
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == RIGHT) {
      start = true;
      System.out.println(start);
    }
    else if (keyCode == UP) {
      if(isGround) {
        player.posY = 100;
      }
      System.out.println("Going up!");
    }
    else if (keyCode == DOWN) {
      System.out.println("Landing/Ducking!");
    }
    else if (keyCode == 'R') {
      reset();
    }
  }
}
