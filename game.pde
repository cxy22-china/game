color color1 = #42213d;
color color2 = #123456;
color color3=#C0FFEE;
color color4= #abcdef;
color color5=#959384;
boolean aKey, dKey, wKey, sKey;
float x, y, d;
float x2, y2, d2;
boolean a2Key, d2Key, w2Key, s2Key;
void setup(){
  size(600, 600);
  x=width/2;
  y=height/2-200;
  x2=width/2;
  y2=height/2+200;
  d=100;
  d2=100;
}
void draw(){
  background(color1);
  stroke(255);
  strokeWeight(5);
  fill(color2);
  circle(x, y, d);
  fill(color3);
  circle(x2, y2, d2);
  if(aKey) x-=5;
  if(dKey) x+=5;
  if(wKey) y-=5;
  if(sKey) y+=5;
  if(a2Key) x2-=5;
  if(d2Key) x2+=5;
  if(w2Key) y2-=5;
  if(s2Key) y2+=5;
}
void keyPressed(){
  if(key=='a'){
    aKey=true;
  }
  if(key=='d'){
    dKey=true;
  }
  if(key=='w'){
    wKey=true;
  }
  if(key=='s'){
    sKey=true;
  }
  if(keyCode==LEFT){
    a2Key=true;
  }
  if(keyCode==RIGHT){
    d2Key=true;
  }
  if(keyCode==UP){
    w2Key=true;
  }
  if(keyCode==DOWN){
    s2Key=true;
  }
}
void keyReleased(){
  if(key=='a'){
    aKey=false;
  }
  if(key=='d'){
    dKey=false;
  }
  if(key=='w'){
    wKey=false;
  }
  if(key=='s'){
    sKey=false;
  }
  if(keyCode==LEFT){
    a2Key=false;
  }
  if(keyCode==RIGHT){
    d2Key=false;
  }
  if(keyCode==UP){
    w2Key=false;
  }
  if(keyCode==DOWN){
    s2Key=false;
  }
}
