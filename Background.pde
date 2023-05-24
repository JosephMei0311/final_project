public class BackgroundEl {
  PImage cloudPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  float w = 40; //stub
  float h = 20; // stub
  float xpos = width;
  float ypos = 80;

  void swapTexture() {
  }

  void move() {
    xpos -= 2;
  }

  void display() {
    ellipse(xpos, ypos, w, h);
  }
  
  void drawPebbles(float x, int y) {
    strokeWeight(4);
    line(x, y, x, y-5);
  }
}
