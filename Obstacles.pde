abstract class Obstacle {
  PImage pic;
  ArrayList<PImage> textures;
  double w;
  double h;
  double xpos;
  
  public Obstacle(double wid, double hei) {
    w = wid;
    h = hei;
    xpos = 100;
  }
  
  
  
  void swapTexture() {
  
  }
  
  boolean hit(Player p) {
    return true;
  }
  
  void move() {
  
  }
  
  void display() {
  
  } 
  
  
}
