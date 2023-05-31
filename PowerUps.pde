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
  float multiplier = 1;
  float radius;
//int num
  public PowerUpsEl(int num) {

    ypos = width;
     if (num == 1) {
           w = 50;
           h = 50;
           display(num);
     }
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
  
  void display(int num) {
    if (!hit && isDisplay == true) {
      imageMode(CORNER);
      if (num == 1) {
        image(pic1, xpos, ypos, w, h);
      }
    }
    else {
     clear(); 
    }
  } 

         
   void clear() {
     isDisplay = true;
   }
   
   boolean invulnerable() {
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
    if(hit) {
      drunk = true;
    }
  }
  
  void shrinkShroom() {
    if(hit) {
      radius = 10;
    }
  }
  
}
