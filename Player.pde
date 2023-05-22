class Player {
  PImage dinoPic = loadImage("mushDino.jpg");
  //ArrayList(PImage) textures;
  float radius = 20;
  float speed;
  float posX;
  float posY;
  int jumpHeight;
  
  Player() {
    posX = 40;
    posY = height / 1.25 - radius;
    speed = 20;
  }
  
  void move() {
  }
  
  void display() {
    fill(255, 0, 34);
    stroke(0, 0, 0);
    strokeWeight(2);
    imageMode(CORNER);
    image(dinoPic, posX, posY, radius, radius);
  }
  void swapTexture() {
  
  }


}
