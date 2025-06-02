//color black = #001219;
//color DB = #005f73;
//color ldb = #0a9396;
//color lb = #94d2bd;
//color midwhite = #e9d8a6;
//color yellow = #ee9b00;
//color orange = #ca6702;
//color or = #bb3e03;
//color red = #ae2012;
//color dr = #9b2226;
//color white = #FFFFFF;
//color B = #000000;
//color grey = #7C7B7A;

color blue = #335c67;
color lightyellow = #fff3b0;
color dark = #e09f3e;
color red = #9e2a2b;
color darkred = #540b0e;



import processing.sound.*;

Paddle leftPaddle, rightPaddle;
Ball ball;
int leftScore = 0, rightScore = 0;
int maxScore = 3;
int waitFrames = 0;

boolean wPressed = false, sPressed = false;
boolean upPressed = false, downPressed = false;

String mode = "intro";
boolean onePlayer = true;

PFont font;
SoundFile bounceSound, scoreSound, introMusic, winSound;

void setup() {
   fill(lightyellow);
  size(800, 600, P2D);
  font = createFont("Times new roman", 32);
  textFont(font);
  resetGame();
}




void draw() {
  background(30);
 fill(lightyellow);

  if (mode== "intro") {
    drawIntro();
  } else if (mode== "game") {
    drawGame();
  } else if (mode== "pause") {


    drawPause();
  } else if (mode== "gameover") {


    drawGameOver();
  }
}





void resetGame() {
  leftPaddle = new Paddle(50);
  rightPaddle = new Paddle(width - 70);

  ball = new Ball();
  leftScore = 0;
  rightScore = 0;
}

void drawIntro() {

  textAlign(CENTER, CENTER);
  text("Welcome ", width/2, height/4);
  text("Select Mode", width/2, height/2 - 60);


  drawButton(width/2 - 120, height/2, "no friends");
  drawButton(width/2 + 120, height/2, "2 players");
}




void drawGame() {
  textAlign(CENTER);
  textSize(20);
  text(leftScore + " : " + rightScore, width/2, 50);


  leftPaddle.update(wPressed, sPressed);
  if (onePlayer) {
    rightPaddle.aiUpdate(ball);


} else {
    rightPaddle.update(upPressed, downPressed);
  }


  leftPaddle.display();
  rightPaddle.display();



  if (waitFrames == 0) {
    ball.update();
  } else {
    waitFrames--;
  }





  ball.checkCollision(leftPaddle);
  ball.checkCollision(rightPaddle);

  ball.display();



  if (ball.x < 0) {


    rightScore++;
    checkWin();
    ball.reset();
  

} else if (ball.x > width) {
    leftScore++;
    checkWin();
    ball.reset();
  }
}



void drawPause() {
  textAlign(CENTER, CENTER);
  text("Paused - Click to keep playing", width/2, height/2);
}


void drawGameOver() {
  textAlign(CENTER, CENTER);



  if (leftScore>rightScore) {
    text("AWSD wins", width/2, height/2 - 50);
 

} else {
    text("arrow keys win", width/2, height/2 - 50);
  }
  text("Click to return to Menu", width/2, height/2 + 50);
}



void checkWin() {

  if (leftScore >= maxScore || rightScore >= maxScore) {
    mode = "gameover";
 

} else {
    waitFrames = 100;
  }
}

void drawButton(float x, float y, String label) {
  rectMode(CENTER);
  fill(70);

  rect(x, y, 150, 50, 10);
  fill(255);
  text(label, x, y);
}




void mousePressed() {
  if (mode.equals("intro")) {
  
    
    if (overButton(width/2 - 120, height/2)) {
      onePlayer = true;
      mode = "game";
 
  
} else if (overButton(width/2 + 120, height/2)) {
      onePlayer = false;
      mode = "game";
    }


} else if (mode.equals("game")) {
    mode = "pause";


} else if (mode.equals("pause")) {


    mode = "game";
  } else if (mode.equals("gameover")) {
    resetGame();

    mode = "intro";
  }
}

boolean overButton(float x, float y) {
  return mouseX > x - 75 && mouseX < x + 75 && mouseY > y - 25 && mouseY < y + 25;
}

void keyPressed() {


  if (key == 'w') wPressed = true;
  if (key == 's') sPressed = true;


  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN) downPressed = true;
}


void keyReleased() {

  if (key == 'w') wPressed = false;

  if (key == 's') sPressed = false;
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN) downPressed = false;
}

class Paddle {
  float x, y, w = 20, h = 100, speed = 5;

  Paddle(float x) {
    this.x = x;
    y = height/2 - h/2;
  }

  void update(boolean up, boolean down) {


    if (up) y -= speed;
    if (down) y += speed;
    y = constrain(y, 0, height - h);
  }

  void aiUpdate(Ball b) {





    if (b.y < y + h/2) y -= speed;
    if (b.y > y + h/2) y += speed;
    y = constrain(y, 0, height - h);
  }

  void display() {
    ellipseMode(CORNER);

    fill(200, 100, 100);
    ellipse(x, y, w, h);
  }
}

class Ball {
  float x, y, r = 20, xSpeed, ySpeed;

  Ball() {
    reset();
  }

  void reset() {


    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);


    xSpeed = 6 * cos(angle) * (random(1) > 0.5 ? 1 : -1);
  
    
    
    ySpeed = 6 * sin(angle);
    waitFrames = 100;
  }

  void update() {
    x += xSpeed;
   
    
    y += ySpeed;

    if (y < 0 || y > height - r) {
      ySpeed *= -1;
    }
  }

  void checkCollision(Paddle p) {
  
    if (x < p.x + p.w && x + r > p.x && y < p.y + p.h && y + r > p.y) {
      xSpeed *= -1;
    }
  }

  void display() {
  
    
    fill(100, 200, 255);
    ellipse(x, y, r, r);
  }
}
