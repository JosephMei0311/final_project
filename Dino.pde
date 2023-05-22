PVector gravity;
boolean isGround = true;
boolean start = false;
int score = 0;
int highScore;
double timeMS;
boolean hit;
int textureType;
PImage pPic;
player Player;
PImage treePic;
Tree tree;
PImage cactPic;
Cactus cactus;
PImage longCactPic;
PImage cloudPic;
Cloud cloud;

void frameCount()  {
}

void jump() {
  while(height/2 - charHeight != jumpHeight) {
    
  }
}

void setup() {
  size(800,400);
  background(10,150, 200);
  PImage dino = loadImage("mushDino.jpg");
  imageMode(CORNER);
  image(dino, 0, height/2 - charHeight, charWidth, charHeight);
}

void draw() {
  //drawline
  line(0,height/2, width, height/2);
  beginShape();
  endShape();
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
  if (keyCode == RIGHT) {
    start = true;
    System.out.println(start);
  }
  else if (keyCode == UP) {
    System.out.println("Going up!");
  }
  else if (keyCode == DOWN) {
    System.out.println("Landing/Ducking!");
  }
  else if (keyCode == 'R') {
    reset();
  }
}
