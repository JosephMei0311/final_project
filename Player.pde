class PlayerEl {
  PImage dinoPic = loadImage("mushDino.png");
  //ArrayList(PImage) textures;
  PVector pos;
  PVector acc; 
  PVector vel;  
  
  float radius = 80;
  int jumpHeight;
  
  PlayerEl() {
    pos = new PVector(50,(height / 1.25 - radius));
    vel = new PVector(0, 20);
    acc = new PVector();
  }
  
  void applyForce(PVector force) 
  {
    acc.add(force); 
  }
  
  void gravity() 
  {
    applyForce(gravity); //applies downward gravity
    pos.add(vel); // in order to update pos wrt velocity
    if(pos.y >= height / 1.25 - radius) 
      {
          pos.y = height / 1.25 - radius;
          vel.mult(0);
      }
   
    vel.add(acc); //in order to update the vel as per acc
    vel.limit(4); // in order to cap the vel for a smooth run
   
    acc.mult(0);
  }
 
  
  void display() {
    fill(255, 0, 34);
    stroke(0, 0, 0);
    strokeWeight(2);
    imageMode(CORNER);
    image(dinoPic, pos.x, pos.y, radius, radius);
  }
  void swapTexture() {
  
  }


}
