public class BackgroundEl {
  PImage cloudPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  float w = 40; //stub
  float h = 20; // stub
  float xpos = 1000;
  float ypos = 40;

  void swapTexture() {
  }

  void move() {
    xpos -= 2;
  }

  void display() {
    ellipse(xpos, ypos, w, h);
  }
}
