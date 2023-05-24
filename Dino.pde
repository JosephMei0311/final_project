PVector gravity = new PVector(0, 10);
boolean isGround = true;
boolean start = false;
int score = 0;
int highScore = 0;
double timeMS;
boolean hit = false;
int w = 1500;
int textureType;
PlayerEl player;
TreeEl tree;
CactusEl cactus;
LongCactusEl longCactus;
BackgroundEl bg;

void frameCount()  {
}

void jump() {
  if(isGround) {
        player.posY = 100;
        isGround = false;
  }
}

void setup() {
  size(1500,600);
  background(10,150, 200);
  player = new PlayerEl();
  bg = new BackgroundEl();
  imageMode(CORNER);
}

void draw() {
  if(start) { // Start Game on Key Press
      background(10,150, 200);
      if(!isGround){
       player.posY += gravity.y;
       if(player.posY == height / 1.25 - player.radius) {
         isGround = true;
       }
       
      }
  //draw line
  line(0, height/1.25, width, height/1.25);
  
  bg.display();
  bg.move();
  player.display();
  }
  int xpos = width;
  float r = random(10);
    while(xpos != 0) {
      bg.drawPebbles(xpos, 490);
      xpos -= r;
    }
}

void reset() {
  start = false;
  size(1500,600);
  background(10,150, 200);
  player = new PlayerEl();
  imageMode(CORNER);
  player.display();
  line(0, height/1.25, width, height/1.25);
}

int displayHighScore() {
  return 0;
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
      jump();
      System.out.println("Going up!");
    }
    else if (keyCode == DOWN) {
      System.out.println("Landing/Ducking!");
    }
  }
    if (key == 'r' || key == 'R') {
      reset();
    }
  }
