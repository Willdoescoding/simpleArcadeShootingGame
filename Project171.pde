//Game for project CS171

//Make the shooter and the pellets 
float gunX = 350;
float pelletY = 650;
float pelletX = 355;

float ellX = 350;
float ellY = 0;

boolean moveDown = true; 
boolean moveUp = false;

boolean pellet = true;

int countA = 0;
int countB = 0;

int lives = 3;
int quit_flag=0;

//Add in font and image for game player with enemies
PFont font;
PImage player;
PImage enemies;

void setup()
{
  size(800,800);//size of the window
  background(0);
  
  //load in the image for the game
  font = loadFont("DialogInput.bold-20.vlw");
  
  player = loadImage("character2.png");
  enemies = loadImage("recogniser2.png");
}

void draw()
{
  background(0);//black background
  
  fill(255);//red borderline for the enemies
  strokeWeight(4);
  stroke(255,0,0);//colour red 
  line(0,88,900,90);//length of the borderline
  
  fill(255);//borderline 
  strokeWeight(4);
  stroke(255);//colour white
  line(0,598,900,600);
  
  fill(255);//blue borderline for the player
  strokeWeight(4);
  stroke(0,0,255);//colour blue
  line(0,698,900,700);
  
  textFont(font);//font 
  
  fill(255,0,0);
  image(enemies, ellX, ellY, 65,65);//enemies in the game
  
  fill(255);
  text("CLICK ON THE MOUSE TO BEGIN THE GAME", 50, 790);
  
  fill(255,0,0);
  text("Enemies",50,50); //enemies' score in the game
  text(countA, 200, 50);
  
  fill(0,0,255);//change the word font colour and add in the score 
  text("POINTS", 450, 50);
  text(countB, 550, 50);
  
  fill(255);//change the word font colour and add in the score 
  text("LIVES", 600,50);
  text(lives, 690, 50);
  
  fill(255);
  image(player, gunX, 600, 30, 70);//
  
  fill(255,255,0);//change the pellet colour to yellow 
  pelletX = gunX + 15;
  ellipse(pelletX, pelletY, 10,10);

  //game controls. Using keyboard left and right 
  if(keyPressed == true && key == CODED && keyCode == LEFT)
  {
    gunX = gunX -9;
  }
  
  if(keyPressed == true && key == CODED && keyCode == RIGHT)
  {
    gunX = gunX +9; //the character's sensitivity.
  }
  
  if(moveDown == true)
  {
    ellY = ellY + 3; //the speed of enemy ship drop down on the screen.
  }
  
  if(ellY <= 650)
  {
    moveDown = true; //
  }
  
  if(ellY > 650)
  {
    ellY = 0;
    ellX = random(30, 670);
    moveDown = true;
    
    countA++;
    lives--; //If the enemies hits the borderline 3 times, 
            //the screen shows game over
  }
  
  if(keyPressed && key == ' ')//Press space bar to shoot the pellet.
  {
    moveUp = true;
  }
  
  if(moveUp == true)//pellets move up
  {
    pelletY = pelletY -10;
  }
  
  if(pelletY < 10)//reset the pellets 
  {
    pelletY = 650;
    moveUp = false;
  }
  
  if(pelletY < ellY + 50 && pelletY > ellY - 50 && pelletX < ellX + 50 && pelletX > ellX - 50)
  {
    ellY = 0;
    ellX = random(30, 670);
    moveDown = true;
    countB++; //the player gets a score if a pellet shoot the spaceship
   
  }
   // Scoring and game logic 
 if (lives<1) text("Game over", 120, 350);
 
 if(quit_flag==1) // Wait five seconds before exiting
 {
 delay(5000);
 exit();
 }

 if (lives<1) // All lives lost so game over but return to 
             //draw one more time to
 { 
 quit_flag=1; // allow "Game Over to be displayed.
 } 
 
}
//End of program
