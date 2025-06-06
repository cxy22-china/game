
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
float ballRadius = 20;
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

//void intro() {
//  fill(255);
//  textAlign(CENTER);
//  textSize(32);
//  text("Welcome to Pong!", width/2, height/4);
//  text(" left click if you have no friends, right click if you have friends", width/2, height/2);
//}

//void game() {
//  fill(255);
//  ellipse(ballX, ballY, ballRadius*2, ballRadius*2);
//  ellipse(50, leftY, paddleRadius*2, paddleRadius*2);
//  ellipse(width - 50, rightY, paddleRadius*2, paddleRadius*2);
//  textSize(32);
//  text(leftScore, width/4, 50);
//  text(rightScore, 3*width/4, 50);

//  // Ball movement
//  if (delayCounter == 0) {
//    ballX += ballSpeedX;
//    ballY += ballSpeedY;
//  } else {
//    delayCounter--;
//  }

//  // Paddle controls
//  if (wPressed) leftY -= paddleSpeed;
//  if (sPressed) leftY += paddleSpeed;
//  if (!ai) {
//    if (upPressed) rightY -= paddleSpeed;
//    if (downPressed) rightY += paddleSpeed;
//  } else {
//    if (ballX > width/2) {
//      if (ballY < rightY) rightY -= paddleSpeed;
//      else if (ballY > rightY) rightY += paddleSpeed;
//    }
//  }

//if (leftY < paddleRadius) leftY = paddleRadius;
//if (leftY > height - paddleRadius) leftY = height - paddleRadius;

//if (rightY < paddleRadius) rightY = paddleRadius;
//if (rightY > height - paddleRadius) rightY = height - paddleRadius;


//  // Bounce ball off top/bottom
//  if (ballY < ballRadius || ballY > height - ballRadius) ballSpeedY *= -1;

//  // Paddle collision
//  if (dist(ballX, ballY, 50, leftY) < ballRadius + paddleRadius) ballSpeedX *= -1;
//  if (dist(ballX, ballY, width - 50, rightY) < ballRadius + paddleRadius) ballSpeedX *= -1;

//  // Scoring
//  if (ballX < 0) {
//    rightScore++;
//    resetBall();
//  }
//  if (ballX > width) {
//    leftScore++;
//    resetBall();
//  }

//  // Win condition
//  if (leftScore == 3 || rightScore == 3) mode = 3;
//}

//void pause() {
//  fill(255);
//  textAlign(CENTER);
//  textSize(32);
//  text("Paused - Click to Resume", width/2, height/2);
//}

//void gameover() {
//  fill(255);
//  textAlign(CENTER);
//  textSize(32);
//  if (leftScore > rightScore) {
//    text("Left Player Wins!", width/2, height/2);
//  } else {
//    text("Right Player Wins!", width/2, height/2);
//  }
//  text("Click to restart", width/2, height/2 + 40);
//}

//void mousePressed() {
//  if (mode == 0) {
//    if (mouseX < width/2) ai = true;
//    else ai = false;
//    resetGame();
//    mode = 1;
//  } else if (mode == 2) {
//    mode = 1;
//  } else if (mode == 3) {
//    mode = 0;
//  }
//}

//void keyPressed() {
//  if (key == 'w') wPressed = true;
//  if (key == 's') sPressed = true;
//  if (keyCode == UP) upPressed = true;
//  if (keyCode == DOWN) downPressed = true;
//  if (key == 'p') mode = 2;
//}

//void keyReleased() {
//  if (key == 'w') wPressed = false;
//  if (key == 's') sPressed = false;
//  if (keyCode == UP) upPressed = false;
//  if (keyCode == DOWN) downPressed = false;
//}

//void resetBall() {
//  ballX = width/2;
//  ballY = height/2;
//  ballSpeedX = random(3, 5) * (random(1) < 0.5 ? 1 : -1);
//  ballSpeedY = random(-2, 2);
//  delayCounter = 100;
//}

//void resetGame() {
//  leftY = height/2;
//  rightY = height/2;
//  leftScore = 0;
//  rightScore = 0;
//  resetBall();
//}
//void resetBall() {
//  ballX = width/2;
//  ballY = height/2;
//  ballSpeedX = random(3, 5) * (random(1) < 0.5 ? 1 : -1);
//  ballSpeedY = random(-2, 2);
//  delayCounter = 100;
//}

//void resetGame() {
//  leftY = height/2;
//  rightY = height/2;
//  leftScore = 0;
//  rightScore = 0;
//  resetBall();
//}
