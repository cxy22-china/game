
color black = #001219;
color DB = #005f73;
color ldb = #0a9396;
color lb = #94d2bd;
color midwhite = #e9d8a6;
color yellow = #ee9b00;
color orange = #ca6702;
color or = #bb3e03;
//color red = #ae2012;
color dr = #9b2226;
color white = #FFFFFF;
color B = #000000;
color grey = #7C7B7A;

color blue = #335c67;
color lightyellow = #fff3b0;
color dark = #e09f3e;
color red = #9e2a2b;
color darkred = #540b0e;


color green = #619b8a;

int mode = 0; // 0 = INTRO, 1 = GAME, 2 = PAUSE, 3 = GAMEOVER
boolean ai = false; 


float leftY, rightY;
boolean wPressed = false, sPressed = false;
boolean upPressed = false, downPressed = false;
float paddleSpeed = 5;
float paddleRadius = 40;


float ballX, ballY, ballSpeedX, ballSpeedY;
float ballRadius = 25;
int delayCounter = 0;

// Score
int leftScore = 0;
int rightScore = 0;

void setup() {
  size(800, 600);
  resetGame();
  
}

void draw() {
  
  background(green);

  
  
  
  if (mode == 0) intro();
  else if (mode == 1) game();
  else if (mode == 2) pause();
  else if (mode == 3) gameover();
}
