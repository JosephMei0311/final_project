PVector gravity = new PVector(0, .5);
boolean isGround = true; // Player Only Jumps when on Ground
boolean start = false; // Starts Game when true
int score = 0;
int highScore = 0;
boolean hit = false; // Player runs into obstacle
int textureType; // Selects the texture
PlayerEl player;
TreeEl tree;
CactusEl cactus;
LongCactusEl longCactus;
ArrayList<BackgroundEl> bgarr; // ArrayList of all the background elements
ArrayList<ObstacleEl> obsarr; 
PVector jumpForce = new PVector(0, -100); // Used to establish jump strength
boolean startFrame; // Restarts frame count
float speed;

void setup() {
  // Initial setup
  size(1500,600);
  background(200,200, 200);
  imageMode(CORNER);
  
  // Font and Start Screen
  PFont font = createFont("Papyrus", 50);
  fill(0, 0, 0);
  textFont(font);
  textAlign(CENTER);
  text("PRESS UP ARROW TO START", width/2, height/2);
  
  // Create objects
  player = new PlayerEl();
  bgarr = new ArrayList<BackgroundEl>();
  obsarr = new ArrayList<ObstacleEl>();
  
  startFrame = true;
  speed = 8;
}

void draw() {
  if(start) { // Start Game on Key Press
    
    // Restart Frame Count
    if(startFrame) {
      frameCount = 0;
      startFrame = false;
    }
    
    background(30,170, 240); // Change background color
    fill(100, 50, 0);
    rect(0, height/1.25, width, height);
    displayStats(); // Display score and high score
    
    stroke(0, 200, 0);
    line(0, height/1.25, width, height/1.25); // Draw Line
  
    // Adds a new background object every 100 frames
    if(frameCount % 100 == 0) 
      bgarr.add(new BackgroundEl());
    
    // Cycles through array of backgrounds --> displays and moves all of them
    for(int x = 0; x < bgarr.size(); x++){
       BackgroundEl temp = bgarr.get(x);
       temp.display();
       temp.move();
       
       // If background is out of frame --> remove background from array
       if(temp.xposCl < -(250 * speed)) {
         bgarr.remove(x);
         x--;
       }
    }
    
    // Grounds the player
    if(player.pos.y == height / 1.25 - player.radius)
      isGround = true;
    
    player.gravity(); // Apply gravity
    player.display(); // Display Player
    
    if(random(1) < 0.75 && frameCount % int((60 + 0.5 * speed)) == 0) {
          ObstacleEl[] selectObs = new ObstacleEl[] {new CactusEl(), new LongCactusEl(), new TreeEl()};
          obsarr.add(selectObs[int(random(3))]); 
        }
        
    for(int i = obsarr.size() - 1; i >= 0; i--) {
        ObstacleEl p = obsarr.get(i);
        p.move();
        
        p.display();
        if (p.hit(player))
            hit = true;
        
        //Remove the barriers that went out of frame
        if(p.xpos < -p.w)
          {
            obsarr.remove(i);
          }
    }
    
    if(score % 50 == 0)
      speed += 0.1;
    
   if(hit)
     reset();      
  }
}

void reset() {
  // Reset start screen
  size(1500,600);
  background(200,200, 200);
  imageMode(CORNER);
  
  // Change high score on reset
  if(score > highScore)
    highScore = score;
  
  // Start screen text
  PFont font = createFont("Papyrus", 50);
  fill(0, 0, 0);
  textFont(font);
  textAlign(CENTER);
  text("lmao what a loser", width/2, height/2 - 75);
  text("PRESS UP ARROW TO START", width/2, height/2);
  
  // Create objects
  player = new PlayerEl();
  bgarr = new ArrayList<BackgroundEl>();
  obsarr = new ArrayList<ObstacleEl>();
  
  // Reset startFrame, start, and score
  startFrame = true;
  start = false;
  score = 0;
  hit = false;
  speed = 8;
}

void displayStats() { 
  score = frameCount / 10; // Score is framecount divided by 10
  
  textAlign(RIGHT);
  fill(0, 0, 0);
  textSize(30);
  text("Score: " + score, width - 10, 30);
  
  textSize(20);
  fill(255,255,255);
  text("Highscore: " + highScore, width - 10, 30 + 40);
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == UP) {
      start = true; // start game
      
      if(isGround) { // jumps
        player.addForce(jumpForce);
        isGround = false;
      }
      
      System.out.println("Going up!");
    }
    else if (keyCode == DOWN) {
      System.out.println("Landing/Ducking!");
    }
  }
  
    if (key == 'r' || key == 'R') {
      reset();
      System.out.println("reset");
    }
  }
