class PowerUpsEl{
  PImage pic1 = loadImage("Images/Kawaii/cloud.png");
  PImage pic2;
  PImage pic3;
  ArrayList<PImage> textures;
  float w;
  float h;
  float xpos = width;
  float ypos;
  boolean invulnerable;
  boolean isDisplay = true;
  float multiplier;
  
//int num
  public PowerUpsEl() {
    w = 50;
    h = 50;
    ypos = width;
     //if (num == 1) [
       
     //}
     //else if (num == 2) {
       
     //}
     //else if (num == 3){
       
     //}
     //else if (num == 4) {
       
     //}
     //rect(120,height/1.25, 100,100);
  }
  
  void swapTexture() {
  //might not implement
  }
  
  boolean hit(PlayerEl p) {
    return ((p.pos.x > xpos) && ((p.pos.x) < (xpos + w))) &&  (p.pos.y < (ypos + h)) && ((p.pos.y + p.radius) > ypos);
  }
  
  void move() {
    xpos -= speed;
  }
  
  void display() {
    if (!hit && isDisplay == true) {
    imageMode(CORNER);
    image(pic1, xpos, ypos, w, h);
    }
    else {
     clear(); 
    }
  } 

         
   void clear() {
     isDisplay = true;
   }
   
   boolean invulnerable() {
     invulnerable = true;
     int accum = 0;
     while(accum % 3 != 0) {
      if(hit) {
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
    drunk = true;
  }
  
  void shrinkShroom() {
    // set radius to smaller number for certain number of frames
  }
  
}
