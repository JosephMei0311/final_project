PVector gravity = new PVector(0, .15);
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
PVector jumpForce = new PVector(0, -100);
boolean startFrame;


void frameCount()  {
}

void setup() {
  size(1500,600);
  background(200,200, 200);
  PFont font;
  font = createFont("Papyrus", 50);
  textFont(font);
  textAlign(CENTER);
  text("PRESS UP ARROW TO START", width/2, height/2);
  player = new PlayerEl();
  bg = new BackgroundEl();
  imageMode(CORNER);
  startFrame = true;
}

void draw() {
  
  if(start) { // Start Game on Key Press
    if(startFrame) {
      frameCount = 0;
      startFrame = false;
    }
    
      background(10,150, 200);
      displayStats();
      
       if(player.pos.y == height / 1.25 - player.radius) {
         isGround = true;
       }
       
  
  line(0, height/1.25, width, height/1.25); // Draw Line
  
  if(frameCount % 100 == 0) {
    bgarr.add(new BackgroundEl());
  }
  
  TreeEl treeEx = new TreeEl();
  //if (frameCount % 50 == 0) {
   treeEx.display(); 
  //}
  
  for(int x = 0; x < bgarr.size(); x++){
     BackgroundEl temp = bgarr.get(x);
     temp.display();
     temp.move();
     if(temp.xposCl < -1000) {
       bgarr.remove(x);
       x--;
     }
  }
  
  player.gravity();
  player.display();
  }
}

void reset() { //If we press it a bunch the Dino sometimes spawns belowground and falls;
  if(score > highScore)
    highScore = score;
  size(1500,600);
  background(200,200, 200);
  PFont font;
  font = createFont("Papyrus", 50);
  textFont(font);
  textAlign(CENTER);
  text("PRESS UP ARROW TO START", width/2, height/2);
  player = new PlayerEl();
  bg = new BackgroundEl();
  imageMode(CORNER);
  startFrame = true;
  start = false;
  score = 0;
 
}

void displayStats() { //Need to fix this in reset() since the frameCount will not reset, making the score remain the same
  score = frameCount / 10;
  
  textAlign(RIGHT);
  fill(0,0,0);
  textSize(30);
  text("Score: " + score, width - 10, 30);
  textSize(20);
  fill(255,255,255);
  text("Highscore: " + highScore, width - 10, 30 + 40);
}

void newHighScore(int score) {
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == RIGHT) {
      System.out.println(start);
    }
    else if (keyCode == UP) {
      start = true;
      if(isGround) {
        player.applyForce(jumpForce);
        isGround = false;
      }
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
