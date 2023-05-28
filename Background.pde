public class BackgroundEl {
  PImage cloudPic = loadImage("cloud.png");
  float w = 80; 
  float h = 40; 
  float xposCl = width;
  float yposCl = 80;
  ArrayList<PVector> dotList = new ArrayList<PVector>();
  ArrayList<PImage> textures = new ArrayList<PImage>();
  
  public BackgroundEl() {
    for(int x = 0; x < 10; x++) {
      dotList.add(new PVector(random(int(250 * speed)) + width, random(height/1.25 + 10, height - 10)));
    }
  }

  void swapTexture() {
  }

  void move() {
    xposCl -= speed; // Move cloud
    
    // Move dots
    for(int x = 0; x < dotList.size(); x++) {
      dotList.set(x, dotList.get(x).sub(speed, 0));
      if(dotList.get(x).x < 0){
        dotList.remove(x);
        x--;
      }
    }
  }

  void display() {    ;
    //ellipse(xposCl, yposCl, w, h);
    //imageMode(CORNER);
    image(cloudPic, xposCl, yposCl, w, h);
    strokeWeight(4);
    stroke(0);
    for(int x = 0; x < dotList.size(); x++) {
      line(dotList.get(x).x, dotList.get(x).y, dotList.get(x).x, dotList.get(x).y);
    }
  }
  
}
