color white = #ffffff;
color black = #000000;
float ballx, bally, balld;
float vx, vy;
float ax, ay;
color color1 = #42213d;
color color2 = #123456;
color color3 = #C0FFEE;
color color4 = #abcdef;
color color5 = #959384;
boolean aKey, dKey, wKey, sKey;
float x, y, d;
float x2, y2, d2;
boolean a2Key, d2Key, w2Key, s2Key;
float holex, holey, holedWidth, holedHeight;
int points1 = 0;
int points2 = 0;
import processing.sound.*;
SoundFile fail;
SoundFile success;
SoundFile music;
boolean green = true;
float goalSpeed = 5;  // Speed of goal movement
float goalDirection = 1;  // 1 for moving right, -1 for moving left

void setup() {
  size(1000, 1000, P2D);
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music = new SoundFile(this, "MUSIC.mp3");
  ballx = width / 2;
  bally = height / 2;
  balld = random(20, 100);  // Random initial ball size
  vx = random(0, 10);
  vy = random(0, 10);
  x = width / 2;
  y = height / 2 - 200;
  x2 = width / 2;
  y2 = height / 2 + 200;
  d = 100;
  d2 = 100;
  holex = width / 2;
  holey = 100;
  holedWidth = 150;  // Width of the goal (hole)
  holedHeight = 30;  // Height of the goal (hole)
  music.loop();
  music.amp(1);
}

void draw() {
  background(color1);
  strokeWeight(5);
  stroke(black);
  fill(255, 0, 0);
  if (green) fill(0, 255, 0);
  else fill(255, 0, 0);
  circle(ballx, bally, balld);
  ballx += vx;
  bally += vy;
  vy += ay;
  vx += ax;

  // Ball collision with walls
  if (bally <= balld / 2) vy = -vy;
  if (bally >= height - balld / 2) vy = -vy;
  if (ballx <= balld / 2) {
    vx = -vx;
    ballx = balld / 2;
  }
  if (ballx >= width - balld / 2) {
    vx = -vx;
    ballx = width - balld / 2;
  }

  // Update the position of the goals (moving back and forth)
  holex += goalSpeed * goalDirection;
  if (holex - holedWidth / 2 <= 0 || holex + holedWidth / 2 >= width) {
    goalDirection *= -1;  // Reverse direction when hitting the screen edges
  }

  // Draw rectangular goals (holes)
  strokeWeight(5);
  stroke(0);
  fill(0);
  // Top goal (rectangle)
  rect(holex - holedWidth / 2, holey - holedHeight / 2, holedWidth, holedHeight);
  // Bottom goal (rectangle)
  rect(holex - holedWidth / 2, height - holey - holedHeight / 2, holedWidth, holedHeight);

  // Draw players
  stroke(255);
  strokeWeight(5);
  fill(color2);
  circle(x, y, d);
  fill(color3);
  circle(x2, y2, d2);

  // Player movement
  if (aKey) x -= 10;
  if (dKey) x += 10;
  if (wKey) y -= 10;
  if (sKey) y += 10;
  if (a2Key) x2 -= 10;
  if (d2Key) x2 += 10;
  if (w2Key) y2 -= 10;
  if (s2Key) y2 += 10;

  // Collision detection with the ball
  if (dist(x, y, ballx, bally) <= d / 2 + balld / 2) {
    if (green) {
      vx = (ballx - x) / 8;
      vy = (bally - y) / 8;
    } else {
      points2 += 1;
      // Randomize the ball size after scoring
      balld = random(20, 100);  // Randomize ball size between 20 and 100
      // Randomize the ball speed after scoring
      vx = random(-10, 10);  // Random x speed
      vy = random(-10, 10);  // Random y speed
      ballx = width / 2;
      bally = height / 2;
      fail.play();
    }
  }

  if (dist(x2, y2, ballx, bally) <= d2 / 2 + balld / 2) {
    if (green) {
      vx = (ballx - x2) / 8;
      vy = (bally - y2) / 8;
    } else {
      points1 += 1;
      // Randomize the ball size after scoring
      balld = random(20, 100);  // Randomize ball size between 20 and 100
      // Randomize the ball speed after scoring
      vx = random(-10, 10);  // Random x speed
      vy = random(-10, 10);  // Random y speed
      ballx = width / 2;
      bally = height / 2;
      fail.play();
    }
  }

  // Ball bounces off the top goal (rectangular goal)
  if (ballx > holex - holedWidth / 2 && ballx < holex + holedWidth / 2) {
    if (bally - balld / 2 <= holey + holedHeight / 2 && bally - balld / 2 >= holey - holedHeight / 2) {
      vy = -vy;  // Reverse vertical speed (bounce)
      bally = holey + holedHeight / 2 + balld / 2;  // Move the ball slightly away from the goal after bounce
    }
  }

  // Ball bounces off the bottom goal (rectangular goal)
  if (ballx > holex - holedWidth / 2 && ballx < holex + holedWidth / 2) {
    if (bally + balld / 2 >= height - holey - holedHeight / 2 && bally + balld / 2 <= height - holey + holedHeight / 2) {
      vy = -vy;  // Reverse vertical speed (bounce)
      bally = height - holey - holedHeight / 2 - balld / 2;  // Move the ball slightly away from the goal after bounce
    }
  }

  // Ball goes into the goal (top or bottom)
  if (bally <= balld / 2) {
    if (green) {
      points2++;
      // Randomize the ball size after scoring
      balld = random(20, 100);  // Randomize ball size between 20 and 100
      // Randomize the ball speed after scoring
      vx = random(-10, 10);  // Random x speed
      vy = random(-10, 10);  // Random y speed
      ballx = width / 2;
      bally = height / 2;
      success.play();
    }
  }

  if (bally >= height - balld / 2) {
    if (green) {
      points1++;
      // Randomize the ball size after scoring
      balld = random(20, 100);  // Randomize ball size between 20 and 100
      // Randomize the ball speed after scoring
      vx = random(-10, 10);  // Random x speed
      vy = random(-10, 10);  // Random y speed
      ballx = width / 2;
      bally = height / 2;
      success.play();
    }
  }

  // Display points
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text(points1, x, y);
  text(points2, x2, y2);

  // Randomly toggle the green flag
  if (random(0, 1000) < 1) {
    green = !green;
    if (!green) {
      vy *= 5;
      vx *= 5;
    } else {
      vy /= 5;
      vx /= 5;
    }
  }
}

void keyPressed() {
  if (key == 'a') {
    aKey = true;
  }
  if (key == 'd') {
    dKey = true;
  }
  if (key == 'w') {
    wKey = true;
  }
  if (key == 's') {
    sKey = true;
  }
  if (keyCode == LEFT) {
    a2Key = true;
  }
  if (keyCode == RIGHT) {
    d2Key = true;
  }
  if (keyCode == UP) {
    w2Key = true;
  }
  if (keyCode == DOWN) {
    s2Key = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    aKey = false;
  }
  if (key == 'd') {
    dKey = false;
  }
  if (key == 'w') {
    wKey = false;
  }
  if (key == 's') {
    sKey = false;
  }
  if (keyCode == LEFT) {
    a2Key = false;
  }
  if (keyCode == RIGHT) {
    d2Key = false;
  }
  if (keyCode == UP) {
    w2Key = false;
  }
  if (keyCode == DOWN) {
    s2Key = false;
  }
}
