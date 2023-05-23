class PlayerEl {
  PImage dinoPic = loadImage("mushDino.png");
  //ArrayList(PImage) textures;
  float radius = 80;
  float speed;
  float posX;
  float posY;
  int jumpHeight;
  
  PlayerEl() {
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
