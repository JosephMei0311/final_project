public class ObstacleEl {
  PImage pic;
  PImage[] textures;
  float w;
  float h;
  float xpos = width;
  float ypos;
  
  public ObstacleEl(float wid, float hei, float y, PImage[] textArray) {
    w = wid;
    h = hei;
    ypos = y;
    textures = textArray;
  }
  
  
  void swapTexture() {
  
  }
  
  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y < (ypos + h)) && ((p.pos.y + p.radius) > ypos);
  }
  
  void move() {
    xpos -= speed;
  }
  
  void display() {
    imageMode(CORNER);
    image(textures[textureType], xpos, ypos, w, h);
  } 
}
