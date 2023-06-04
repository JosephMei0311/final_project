class PowerUpsEl {
  PImage blockPic = loadImage("Images/Powerups/lucky.png");
  
  float w = 80;
  float h = 80;
  float xpos = width;
  float ypos = 220;

  //float radius;

  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y < (ypos + h)) && ((p.pos.y + p.radius) > ypos);
  }

  void move() {
    xpos -= speed;
  }

  void display() {
    imageMode(CORNER);
    image(blockPic, xpos, ypos, w, h);
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
   else if(num == 2) {
     jumpHigh = true;
     effect = "High Jump";
    }
  }

  //void drunk() {
  //  if (hit) {
  //    drunk = true;
  //  }
  //}

  //void shrinkShroom() {
  //  if (hit) {
  //    radius = 10;
  //  }
  //}
}
