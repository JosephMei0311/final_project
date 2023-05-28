class PlayerEl {
  PImage dinoPic = loadImage("Images/mushDino.png");
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
  
  void addForce(PVector force) {
    acc.add(force); 
  }
  
  void gravity() {
    addForce(gravity);
    pos.add(vel); 
    if(pos.y >= height / 1.25 - radius) {
          pos.y = height / 1.25 - radius;
          vel.mult(0);
    }
   
    vel.add(acc);
    vel.limit(10);
   
    acc.mult(0);
  }
 
  
  void display() {
    imageMode(CORNER);
    image(dinoPic, pos.x, pos.y, radius, radius);
  }
  
  void swapTexture() {
  }
}
