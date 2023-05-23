<<<<<<< HEAD
public class PlayerEl {
  PImage dinoPic = loadImage("mushDino.jpg");
=======
class PlayerEl {
  PImage dinoPic = loadImage("mushDino.png");
>>>>>>> ede7f996a26df7cc31626d51dbde9f817c1fd3c6
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
