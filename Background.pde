public class BackgroundEl {
  PImage cloudPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  float w = 40; //stub
  float h = 20; // stub
  float xpos = width;
  float yposCl = 80;
  //float yposGr = random(height/1.25 + 10, height - 10);
  //float yposGr1 = random(height/1.25 + 10, height - 10);
  //float yposGr2 = random(height/1.25 + 10, height - 10);
  //float yposGr3 = random(height/1.25 + 10, height - 10);
  //float xposGr = random(150) + width;
  //float xposGr2 = random(300) + width + 50;
  //float xposGr3 = random(400) + width + 100;
  ArrayList<PVector> posList = new ArrayList<PVector>();
  
  public BackgroundEl() {
  for(int x = 0; x < 10; x++) {
    posList.add(new PVector(random(1000) + width, random(height/1.25 + 10, height - 10)));
  }
  }

  void swapTexture() {
  }

  void move() {
    xpos -= 5;
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
    ellipse(xpos, yposCl, w, h);
    for(int x = 0; x < posList.size(); x++) {
      line(posList.get(x).x, posList.get(x).y, posList.get(x).x, posList.get(x).y);
    }
    //line(xpos, yposGr, xpos, yposGr);
    //line(xposGr, yposGr1, xposGr, yposGr1);
    //line(xposGr2, yposGr2, xposGr2, yposGr2);
    //line(xposGr3, yposGr3, xposGr3, yposGr3);
  }
}
