PVector gravity = new PVector(0, 10);
boolean isGround = true; // Player Only Jumps when on Ground
boolean start = false; // Starts Game when true
int score = 0;
int highScore = 0;
double timeMS;
boolean hit = false; // Player runs into obstacle
int textureType; // Selects the texture
PlayerEl player;
TreeEl tree;
CactusEl cactus;
LongCactusEl longCactus;
BackgroundEl bg;
ArrayList<BackgroundEl> bgarr = new ArrayList<BackgroundEl>(); // ArrayList of all the background elements

void frameCount()  {
}

void jump() { // (WIP)
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
      textSize(25);
      PFont font;
      font = createFont("ColonnaMT-48.vlw", 25);
      textFont(font);
      fill(0, 408, 612);
      text("Score: " + displayScore(), width/2, 30);
      
      if(!isGround){
       player.posY += gravity.y;
       if(player.posY == height / 1.25 - player.radius) {
         isGround = true;
       }
       
      }
  
  line(0, height/1.25, width, height/1.25); // Draw Line
  
  if(frameCount % 100 == 0) {
    bgarr.add(new BackgroundEl());
  }
  
  
  
  for(int x = 0; x < bgarr.size(); x++){
     BackgroundEl temp = bgarr.get(x);
     temp.display();
     temp.move();
  }
  
  player.display();
  }

  //int xpos = width;
  //float r = random(10);
  //  while(xpos != 0) {
  //    bg.drawPebbles(xpos, 490);
  //    xpos -= r;
  //  }
}

void reset() { //If we press it a bunch the Dino sometimes spawns belowground and falls;
  //start = false;
  start = true;
  size(1500,600);
  background(10,150, 200);
  player = new PlayerEl();
  imageMode(CORNER);
  player.display();
  line(0, height/1.25, width, height/1.25);
  frameCount = 0;
  
  
}

int displayScore() { //Need to fix this in reset() since the frameCount will not reset, making the score remain the same
  score = frameCount/60;
  if(hit) {
   newHighScore(score); 
  }
  return score;
}

void newHighScore(int score) {
  if (score > highScore) {
    highScore = score;
  }
  text("High Score:  " + highScore, width/2 + 50, 30);
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
      System.out.println("reset");
    }
  }
