
void game() {
fill(orange); 
  ellipse(ballX, ballY, ballRadius*2, ballRadius*2);//game ball
 fill(ldb);
  ellipse(50, leftY, paddleRadius*2, paddleRadius*2);
  fill(red);
  ellipse(width - 50, rightY, paddleRadius*2, paddleRadius*2);
  textSize(32);
  fill(midwhite); 
  text(leftScore, width/4, 50);
  text(rightScore, 3*width/4, 50);

  // Ball movement
  if (delayCounter == 0) {
    ballX += ballSpeedX;
    ballY += ballSpeedY;
  } else {
    delayCounter--;
  }

  // Paddle controls
  if (wPressed) leftY -= paddleSpeed;
  if (sPressed) leftY += paddleSpeed;
  if (!ai) {
    if (upPressed) rightY -= paddleSpeed;
    if (downPressed) rightY += paddleSpeed;
  } else {
    if (ballX > width/2) {
      if (ballY < rightY) rightY -= paddleSpeed;
      else if (ballY > rightY) rightY += paddleSpeed;
    }
  }

if (leftY < paddleRadius) leftY = paddleRadius;
if (leftY > height - paddleRadius) leftY = height - paddleRadius;

if (rightY < paddleRadius) rightY = paddleRadius;
if (rightY > height - paddleRadius) rightY = height - paddleRadius;


  // Bounce ball off top/bottom
  if (ballY < ballRadius || ballY > height - ballRadius) ballSpeedY *= -1;

  // Paddle collision
  if (dist(ballX, ballY, 50, leftY) < ballRadius + paddleRadius) ballSpeedX *= -1;
  if (dist(ballX, ballY, width - 50, rightY) < ballRadius + paddleRadius) ballSpeedX *= -1;

  // Scoring
  if (ballX < 0) {
    rightScore++;
    resetBall();
  }
  if (ballX > width) {
    leftScore++;
    resetBall();
  }

  // Win condition
  if (leftScore == 3 || rightScore == 3) mode = 3;
}
void resetBall() {
  ballX = width/2;
  ballY = height/2;
  ballSpeedX = random(3, 5) * (random(1) < 0.5 ? 1 : -1);
  ballSpeedY = random(-2, 2);
  delayCounter = 100;
}

void resetGame() {
  leftY = height/2;
  rightY = height/2;
  leftScore = 0;
  rightScore = 0;
  resetBall();
}
