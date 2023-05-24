PVector gravity = new PVector(0, 10);
boolean isGround = true; // Player Only Jumps when on Ground
boolean start = false; // Starts Game when true
int score = 0; // score
int highScore = 0; // high score
double timeMS; // time in MS
boolean hit = false; // 
int w = 1500;
int textureType;
PlayerEl player;
TreeEl tree;
CactusEl cactus;
LongCactusEl longCactus;
BackgroundEl bg;
ArrayList<BackgroundEl> bgarr = new ArrayList<BackgroundEl>();

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
      text(frameCount/60.0, 5, 20);
      if(!isGround){
       player.posY += gravity.y;
       if(player.posY == height / 1.25 - player.radius) {
         isGround = true;
       }
       
      }
  //draw line
  line(0, height/1.25, width, height/1.25);
  
  //bg.display();
  //bg.move();
  
  if(frameCount % 30 == 0) {
  bgarr.add(new BackgroundEl());
  }
  
  
  
  
  for(int x = 0; x < bgarr.size(); x++){
     BackgroundEl temp = bgarr.get(x);
     temp.display();
     temp.move();
  }
  player.display();
  
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
