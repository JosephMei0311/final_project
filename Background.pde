public class BackgroundEl {
  PImage cloudPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  float w = 40; //stub
  float h = 20; // stub
  float xpos = width;
  float yposCl = 80;
  float yposGr = random(height/1.25 + 10, height - 10);
  float yposGr1 = random(height/1.25 + 10, height - 10);
  float yposGr2 = random(height/1.25 + 10, height - 10);
  float yposGr3 = random(height/1.25 + 10, height - 10);
  float xposGr = random(150) + width;
  float xposGr2 = random(300) + width + 50;
  float xposGr3 = random(400) + width + 100;


  void swapTexture() {
  }

  void move() {
    xpos -= 5;
    xposGr -= 5;
    xposGr2 -= 5;
  }

  void display() {
    strokeWeight(4);
    ellipse(xpos, yposCl, w, h);
    line(xpos, yposGr, xpos, yposGr);
    line(xposGr, yposGr1, xposGr, yposGr1);
    line(xposGr2, yposGr2, xposGr2, yposGr2);
    line(xposGr3, yposGr3, xposGr3, yposGr3);
  }
}
