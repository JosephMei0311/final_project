class PowerUpsEl {
  PImage pic1 = loadImage("Images/Kawaii/cloud.png");
  PImage pic2;
  PImage pic3;
  ArrayList<PImage> textures;
  
  float w = 40;
  float h = 40;
  float xpos = width;
  float ypos = 200;

  boolean invulnerable;
  float multiplier = 1;
  float radius;
  
  //boolean isDisplay = true;
  boolean pHit = false;

  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y < (ypos + h)) && ((p.pos.y + p.radius) > ypos);
  }

  void move() {
    xpos -= speed;
  }

  void display() {
    //if (isDisplay == true) {
      imageMode(CORNER);
      rect(xpos, ypos, w, h);
      //if (num == 1) {
      //image(pic1, xpos, ypos, w, h);
    //}
  }
  
  void specialEffects(int num) {
   if(num == 0) {
     drunk = true;
     effect = "drunk";
   }
   else if(num == 1) {
     invulnerable = true;
     effect = "invulnerable";
   }
  }
  
  boolean invulnerable() {
    int accum = 0;
    while (accum % 3 != 0) {
      if (hit) {
        accum++;
      }
    }
    invulnerable = false;
    return invulnerable;
  }

  void scoreMult() {
    if (hit) {
      multiplier = random(3);
    }
  }

  void drunk() {
    if (hit) {
      drunk = true;
    }
  }

  void shrinkShroom() {
    if (hit) {
      radius = 10;
    }
  }
}
