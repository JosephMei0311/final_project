public class TreeEl {
  PImage treePic = loadImage("tree.png");
  ArrayList<PImage> textures = new ArrayList<PImage>();
  double w;
  double h;
  double pos;
  float xposTr = width;
  float yposTr = 80;
  float radius = 180;
  
  void swapTexture() {
  
  }
  
  boolean hit(PlayerEl p) {
    //if (Player.pos.x + radius > treePic.pos.x && Player.pos.y + radius >= treePic.pos.y) {
       return true;
    //}
  }
  
  //void move() {
  //   xposTr-= 5;
  //}
  
  void display() {
    fill(255, 0, 34);
    stroke(0, 0, 0);
    strokeWeight(2);
    imageMode(CORNER);
    image(treePic, 20, height/2 + 20, radius, radius);
  }
}
