<<<<<<< HEAD
public class LongCactusEl {
  PImage longCactPic;
  ArrayList<PImage> textures = new ArrayList<PImage>();
  double w = 40;
  double h;
  double xpos;
=======
public class LongCactusEl extends ObstacleEl{
  ArrayList<PImage> textures = new ArrayList<PImage>();  
  
  public LongCactusEl() {
      super(40.0, 20.0);
  }
  
>>>>>>> ede7f996a26df7cc31626d51dbde9f817c1fd3c6
  
  void swapTexture() {
  
  }
  
  boolean hit(PlayerEl p) {
    return true;
  }
  
  void move() {
  
  }
  
  void display() {
  
  }
}
