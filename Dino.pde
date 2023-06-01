// Kinematics
PVector gravity;
PVector jumpForce; // Used to establish jump strength
boolean isGround; // Player Only Jumps when on Ground
float speed;

// Game Configs
boolean start; // Starts Game when true
boolean hit; // Player runs into obstacle
boolean startFrame; // Restarts frame count

// Objects
PlayerEl player;
ArrayList<BackgroundEl> bgarr; // ArrayList of all the background elements
ArrayList<ObstacleEl> obsarr; 
ArrayList<PowerUpsEl> powerUparr;

// Stats
int attempts;
int score;
int highScore;

// Powerups
boolean invulnerable;
boolean drunk;
boolean jumpHigh;
String effect;
int secondsCount;

// Texture
int textureType; // Selects the texture

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
  text("PRESS ENTER TO START", width/2, height/2);
  
  // Kinematics
  gravity = new PVector(0, .5);
  jumpForce = new PVector(0, -100);
  isGround = true;
  speed = 8;
  
  // Game Configs
  start = false;
  hit = false;
  startFrame = true;
  
  // Create objects
  player = new PlayerEl();
  bgarr = new ArrayList<BackgroundEl>();
  obsarr = new ArrayList<ObstacleEl>();
  powerUparr = new ArrayList<PowerUpsEl>();
  
  // Stats
  score = 0;
  highScore = 0;
  attempts = 0;
  
  // Powerups
  invulnerable = false;
  drunk = false;
  jumpHigh = false;
  effect = "";
  secondsCount = 0;
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
    countDownAndDisplay();
    
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
       if(temp.dotList.get(0).x < -(250 * speed)) {
         bgarr.remove(x);
         x--;
       }
    }
    
    // Grounds the player
    if(player.pos.y == height / 1.25 - player.radius) {
      isGround = true;
      gravity = new PVector(0, 0.5);
    }
    player.gravity(); // Apply gravity
    noTint();
    player.display(); // Display Player
    
    if(random(1) < 0.75 && frameCount % 60 == 0) {
          ObstacleEl[] selectObs = new ObstacleEl[] {new CactusEl(), new LongCactusEl(), new TreeEl(), new CloudEl()};
          obsarr.add(selectObs[int(random(4))]); 
        }
        
    for(int i = obsarr.size() - 1; i >= 0; i--) {
        ObstacleEl obs = obsarr.get(i);
        obs.move();
        
        noTint();
        obs.display();
        
        if (obs.hit(player))
            hit = true;
        
        //Remove the barriers that went out of frame
        if(obs.xpos < -obs.w) {
            obsarr.remove(i);
          }
    }
        
    if(random(1) < 0.25 && frameCount % 200 == 0) {
      powerUparr.add(new PowerUpsEl());
    }
    
    for(int i = powerUparr.size() - 1; i >= 0; i--) {
      PowerUpsEl power = powerUparr.get(i);
      
       if(power.hit(player)){
         int randNum = int(random(3));
         secondsCount = 5;
         power.specialEffects(randNum);
         powerUparr.remove(i);
       }
       else{
         power.display();
         power.move();
       }
    //Remove the barriers that went out of frame
    if(power.xpos < -power.w) {
        powerUparr.remove(i);
      }
    }
    
   if((drunk == true || invulnerable == true  || jumpHigh == true) && secondsCount == 0){
     drunk = false;
     invulnerable = false;
     jumpHigh = false;
   }
   
   if(score % 50 == 0)
      speed += 0.1;
      
   if(drunk){
     noStroke();
     fill(0, 255, 0, 50);
     rect(0, 0, width, height);
   }
    
   if(hit && !invulnerable)
     reset();
   else
     hit = false;
  }
}

void jump() {
  if(jumpHigh)
    player.jumpHeight = 15;
  else
    player.jumpHeight = 10;
    
  player.addForce(jumpForce);
}

void fall() {
  gravity.add(0,1);
}

void countDownAndDisplay() {
  if(secondsCount > 0) {
    if(frameCount % 60 == 0) {
      secondsCount--;
    }
    textAlign(LEFT);
    text(secondsCount, 10, 30);
    text(effect, 10, 60);
  }
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

void reset() {
  // Reset start screen
  size(1500, 600);
  background(200, 200, 200);
  imageMode(CORNER);
  
  // Start screen text
  PFont font = createFont("Papyrus", 50);
  fill(0, 0, 0);
  textFont(font);
  textAlign(CENTER);
  text("lmao what a loser", width/2, height/2 - 75);
  text("PRESS ENTER TO START", width/2, height/2);
  text("Attempts: " + attempts, width/2, height/2 + 75);
  
  // Change high score on reset
  if(score > highScore)
    highScore = score;
    
  // Increment attempts
  attempts++;
  
  // Re-create objects
  player = new PlayerEl();
  bgarr = new ArrayList<BackgroundEl>();
  obsarr = new ArrayList<ObstacleEl>();
  powerUparr = new ArrayList<PowerUpsEl>();
  
  // Kinematics
  gravity = new PVector(0, .5);
  isGround = true;
  speed = 8;
  jumpForce = new PVector(0, -100);
  
  // Game Configs
  startFrame = true;
  start = false;
  hit = false;
  
  // Stats
  score = 0;
  
  // Powerups
  invulnerable = false;
  drunk = false;
  jumpHigh = false;
  secondsCount = 0;
  effect = "";
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == UP) { 
      if(drunk) {
       fall();
       System.out.println("You're drunk! Going down!");
      }
      else {
        if(isGround) { // jumps
          jump();
          isGround = false;
        }
      }
      System.out.println("Going up!");
    }
    else if (keyCode == DOWN) {
      if (drunk) { // gives you unlimited up jumps oops
        if(isGround){
          jump();
          isGround = false;
          System.out.println("You're drunk! Going up!");
        }
      }
      else {
        fall();
        System.out.println("Landing/Ducking!");
      }
    }
  }
    if (key == 'r' || key == 'R') {
      reset();
      System.out.println("reset");
    }
    else if (key == ENTER) {
      start = true;
    }
  }
