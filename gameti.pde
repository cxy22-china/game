color white = #ffffff;
color black = #000000;
float ballx, bally, balld;
float vx, vy;
float ax, ay;
color color1 = #457b9d;
color color2 = #408e98;
color color3 = #f5dd90;
color color4 = #87cbac;
color color5 = #87cbac;
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
float goalSpeed = 5;
float goalDirection = 1;

void setup() {
  size(1000, 1000, P2D);
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music = new SoundFile(this, "MUSIC.mp3");
  ballx = width / 2;
  bally = height / 2;
  balld = random(20, 100);
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
  holedWidth = 456;
  holedHeight = 30;
  music.loop();
  music.amp(1);
}

void draw() {
  background(color1);
  strokeWeight(2.7);
  stroke(black);
  fill(255, 0, 0);
  if (green) fill(105, 0, 255);
  else fill(0, 172, 255);
  circle(ballx, bally, balld);
  ballx += vx;
  bally += vy;
  vy += ay;
  vx += ax;

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

  holex += goalSpeed * goalDirection;
  if (holex - holedWidth / 2 <= 0 || holex + holedWidth / 2 >= width) {
    goalDirection *= -1;
  }

  strokeWeight(5);
  stroke(0);
  fill(0);
  rect(holex - holedWidth / 2, holey - holedHeight / 2, holedWidth, holedHeight);
  rect(holex - holedWidth / 2, height - holey - holedHeight / 2, holedWidth, holedHeight);

  stroke(255);
  strokeWeight(5);
  fill(color2);
  circle(x, y, d);
  fill(color3);
  circle(x2, y2, d2);

  if (aKey) x -= 10;
  if (dKey) x += 10;
  if (wKey) y -= 10;
  if (sKey) y += 10;
  if (a2Key) x2 -= 10;
  if (d2Key) x2 += 10;
  if (w2Key) y2 -= 10;
  if (s2Key) y2 += 10;

  if (dist(x, y, ballx, bally) <= d / 2 + balld / 2) {
    if (green) {
      vx = (ballx - x) / 8;
      vy = (bally - y) / 8;
    } else {
      points2 += 1;
      balld = random(20, 100);
      vx = random(-10, 10);
      vy = random(-10, 10);
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
      balld = random(20, 100);
      vx = random(-10, 10);
      vy = random(-10, 10);
      ballx = width / 2;
      bally = height / 2;
      fail.play();
    }
  }

  if (ballx > holex - holedWidth / 2 && ballx < holex + holedWidth / 2) {
    if (bally - balld / 2 <= holey + holedHeight / 2 && bally - balld / 2 >= holey - holedHeight / 2) {
      if (ballx - balld / 2 <= holex - holedWidth / 2 || ballx + balld / 2 >= holex + holedWidth / 2) {
        vx = -vx;
        ballx = ballx - vx;
      }
      vy = -vy;
      bally = holey + holedHeight / 2 + balld / 2;
    }
  }

  if (ballx > holex - holedWidth / 2 && ballx < holex + holedWidth / 2) {
    if (bally + balld / 2 >= height - holey - holedHeight / 2 && bally + balld / 2 <= height - holey + holedHeight / 2) {
      if (ballx - balld / 2 <= holex - holedWidth / 2 || ballx + balld / 2 >= holex + holedWidth / 2) {
        vx = -vx;
        ballx = ballx - vx;
      }
      vy = -vy;
      bally = height - holey - holedHeight / 2 - balld / 2;
    }
  }

  if (bally <= balld / 2) {
    if (green) {
      points2++;
      balld = random(20, 100);
      vx = random(-10, 10);
      vy = random(-10, 10);
      ballx = width / 2;
      bally = height / 2;
       vx=0;
      vy=0;
      success.play();
    }
  }

  if (bally >= height - balld / 2) {
    if (green) {
      points1++;
      balld = random(20, 75);
      vx = random(-10, 10);
      vy = random(-10, 10);
      ballx = width / 2;
      bally = height / 2;
      vx=0;
      vy=0;
      success.play();
    }
  }

  textSize(40);
  textAlign(CENTER, CENTER);
  fill(0, 50, 255);
  text(points1, x, y);
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255, 150, 0);
  text(points2, x2, y2);
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
