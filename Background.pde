public class BackgroundEl {
  PImage cloudPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  float w = 40; //stub
  float h = 20; // stub
  float xposCl = width;
  float yposCl = 80;
  ArrayList<PVector> posList = new ArrayList<PVector>();
  
  public BackgroundEl() {
  for(int x = 0; x < 10; x++) {
    posList.add(new PVector(random(1000) + width, random(height/1.25 + 10, height - 10)));
    }
  }

  void swapTexture() {
  }

  void move() {
    xposCl -= 5;
    for(int x = 0; x < posList.size(); x++) {
      posList.set(x, posList.get(x).sub(5, 0));
      if(posList.get(x).x < 0){
        posList.remove(x);
        x--;
      }
    }
  }

  void display() {
    strokeWeight(4);
    fill(0, 255, 0);
    ellipse(xposCl, yposCl, w, h);
    for(int x = 0; x < posList.size(); x++) {
      line(posList.get(x).x, posList.get(x).y, posList.get(x).x, posList.get(x).y);
    }
  }
  
}
