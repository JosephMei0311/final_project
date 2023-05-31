class PowerUpsEl{
  PImage pic;
  ArrayList<PImage> textures;
  float w;
  float h;
  float xpos = width;
  float ypos;
  
  public PowerUpsEl(float wid, float hei, float y, PImage pict) {
    w = wid;
    h = hei;
    ypos = y;
    pic = pict;
     //Random rand = new Random();
     //int num = rand.nextInt(4);
     //if (num == 1) [
       
     //}
     //else if (num == 2) {
       
     //}
     //else if (num == 3){
       
     //}
     //else if (num == 4) {
       
     //}
     rect(120,height/1.25, 100,100);

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
    if (!hit) {
    imageMode(CORNER);
    image(pic, xpos, ypos, w, h);
    }
    else {
      //clear
    }
  } 
  
  boolean invulnerable;
  boolean display = true;
  

     
     
   void clear() {
     
   }
   
   void invulnerable() {
     
     
     
     //random value to determine powerUp
     /*
      if (ObstacleEl.hit()) 
      count++;
        if (count % 3 == 0) {
          invulnerable = false;
        }
     */
   }
  
  void scoreMult() {
    if (hit) {
     //Dino.score = score * 1.1; 
    }
  }
  
  void drunk() {
    //drunk = true;
  }
  
  void shrinkShroom() {
    // set radius to smaller number for certain number of frames
  }
  
}
