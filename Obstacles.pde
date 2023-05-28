public class ObstacleEl {
  PImage pic;
  ArrayList<PImage> textures;
  float w;
  float h;
  float xpos = width;
  
  public ObstacleEl(float wid, float hei, PImage pict) {
    w = wid;
    h = hei;
    pic = pict;
  }
  
  
  void swapTexture() {
  
  }
  
  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y > (height / 1.25 - h - p.radius));
  }
  
  void move() {
    xpos -= speed;
  }
  
  void display() {
    //rect(xpos, height / 1.25 - h, w, h);
    imageMode(CORNER);
    image(pic, xpos, height / 1.25 - h, w, h);
  } 
}
