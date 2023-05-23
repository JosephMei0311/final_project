abstract class ObstacleEl {
  PImage pic;
  ArrayList<PImage> textures;
  float w;
  float h;
  double xpos;
  
  public ObstacleEl(float wid, float hei) {
    w = wid;
    h = hei;
    xpos = 100;
  }
  
  
  
  void swapTexture() {
  
  }
  
  boolean hit(PlayerEl p) {
    return true;
  }
  
  void move() {
  
  }
  
  void display() {
  
  } 
  
  
}
