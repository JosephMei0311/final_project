class PowerUpsEl {
  PImage pic;
  PImage blockPic = loadImage("Images/Powerups/lucky.png");
  
  float w = 80;
  float h = 80;
  float xpos = width;
  float ypos = 220;
  int change = 0;

  float multiplier = 1;
  float radius;

  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y < (ypos + h)) && ((p.pos.y + p.radius) > ypos);
  }

  void move() {
    xpos -= speed;
    change += 2;
  }

  void display() {
    imageMode(CORNER);
      if(change == 100){
        tint(255, 0, 0);
        change = 1;
      }
      else if(change == 101){
        noTint();
        change = 0;
      }
    image(blockPic, xpos, ypos, w, h);
  }
  
  void specialEffects(int num) {
   if(num == 0) {
     drunk = true;
     effect = "drunk";
     pic = loadImage("Images/Powerups/shield.png");
   }
   else if(num == 1) {
     invulnerable = true;
     effect = "invulnerable";
     pic = loadImage("Images/Powerups/shield.png");
   }
   else if(num == 2) {
     jumpHigh = true;
     effect = "High Jump";
     pic = loadImage("Images/Powerups/shield.png");
  }
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
