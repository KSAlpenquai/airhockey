float puckYPos=height/2;
float puckXPos=width/2;
float puckYSpeed=20;
float puckXSpeed=20;
float schlaegerXPos=0;
float schlaegerYPos=0;
float puckRadius=30;
float schlaegerRadius=50;
float schlaegerStop=0;
int score1=0;
int score2=0;

void setup(){
  fullScreen();
  frameRate(60);
}

void draw(){
  background(255);
  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  strokeWeight(10);
  ellipse(schlaegerXPos,schlaegerYPos,2*schlaegerRadius,2*schlaegerRadius);
  ellipse(puckXPos,puckYPos,2*puckRadius,2*puckRadius);
  textSize(50);
  text(score1,displayWidth/4,100);
  text(score2,(displayWidth/4)*3,100);
  strokeWeight(30);
  line(0,displayHeight/3,0,(displayHeight/3)*2);
  line(displayWidth,displayHeight/3,displayWidth,(displayHeight/3)*2);
  //puck movement
  puckXPos=puckXPos+puckXSpeed;
  puckYPos=puckYPos+puckYSpeed;
  puckXSpeed=puckXSpeed*0.995;
  puckYSpeed=puckYSpeed*0.995;
  //puck max speed
  if(puckXSpeed>40){
    puckXSpeed=40;
  }
  if(puckYSpeed>40){
    puckYSpeed=40;
  }
  if(puckXSpeed<-40){
    puckXSpeed=-40;
  }
  if(puckYSpeed<-40){
    puckYSpeed=-40;
  } 
  //schlaeger movement
  if(schlaegerStop==0){
    schlaegerXPos=schlaegerXPos+(mouseX-schlaegerXPos)*0.3;
    schlaegerYPos=schlaegerYPos+(mouseY-schlaegerYPos)*0.3;
  }else{
    schlaegerStop=0;
  }
  //puck collision with wall
  if(puckXPos>displayWidth-puckRadius){
    if(puckYPos>displayHeight/3&&puckYPos<(displayHeight/3)*2){
      score1=score1+1;
      puckXPos=displayWidth/2;
      puckYPos=displayHeight/2;
      puckXSpeed=0;
      puckYSpeed=0;
    }else{
      puckXSpeed=-0.9*puckXSpeed;
      puckXPos=puckXPos-3;
    }
  }
  if(puckXPos<0+puckRadius){
    if(puckYPos>displayHeight/3&&puckYPos<(displayHeight/3)*2){
      score2=score2+1;
      puckXPos=displayWidth/2;
      puckYPos=displayHeight/2;
      puckXSpeed=0;
      puckYSpeed=0;
    }else{
      puckXSpeed=-0.9*puckXSpeed;
      puckXPos=puckXPos+3;
    }
  }
  if(puckYPos>displayHeight-puckRadius){
    puckYSpeed=-0.9*puckYSpeed;
    puckYPos=puckYPos-3;    
  }
  if(puckYPos<0+puckRadius){
    puckYSpeed=-0.9*puckYSpeed;
    puckYPos=puckYPos+3; 
  }
  //puck collision with schlaeger
  if(abs(puckXPos-schlaegerXPos)<puckRadius+schlaegerRadius&&abs(puckYPos-schlaegerYPos)<puckRadius+schlaegerRadius){
    collision();
  }
}

void collision(){
  schlaegerStop=1;
  puckXSpeed=(mouseX-schlaegerXPos)*0.6+(-puckXSpeed)*0.6;
  puckYSpeed=(mouseY-schlaegerYPos)*0.6+(-puckYSpeed)*0.6;
}
