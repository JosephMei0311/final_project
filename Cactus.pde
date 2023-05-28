public class CactusEl extends ObstacleEl{
  ArrayList<PImage> textures = new ArrayList<PImage>();
  
  public CactusEl() {
    super(80, 80, height / 1.25 - 80, loadImage("Images/cactus.png"));
  }
  
}
