public class CactusEl extends ObstacleEl{
  
  public CactusEl() {
    super(80, 80, height / 1.25 - 80, 
      new PImage[]{loadImage("Images/Kawaii/cactus.png"),
                   loadImage("Images/Pokemon/cactus.png")
                  }
          );
  }
}
