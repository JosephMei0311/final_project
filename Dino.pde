boolean start = false;
boolean isGround = true;
PVector gravity;
PVector acceleration; //<>//
int charWidth = 100;
int charHeight = 100; 
int jumpHeight;

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

void jump() {
  while(height/2 - charHeight != jumpHeight) {
    
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
