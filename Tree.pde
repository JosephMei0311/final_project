public class TreeEl extends ObstacleEl {
  ArrayList<PImage> textures = new ArrayList<PImage>();
  
  public TreeEl() {
    super(60, 120, height / 1.25 - 120, loadImage("Images/Kawaii/tree.png"));
  }
  
  void swapTexture() {
  
  }
}
