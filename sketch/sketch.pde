float p1X = screen.width/2;
float p1Y = screen.height/4;
float p2X = screen.width/2;
float p2Y = screen.height/4*3;
int d = 100;

void setup() {
   ellipseMode(CENTER);
   size(screen.width, screen.height);
   noStroke();
}

void draw() {
   background(0);
   fill(0,0,255);
   ellipse(p1X, p1Y, d, d);
   fill(255,0,0);
   ellipse(p2X, p2Y, d, d);
}

void touchMove(TouchEvent soos) {
   for (int i=0;i<soos.touches.length;i++){
      if(soos.touches[i].offsetY<screen.height/2){
         p1X=soos.touches[i].offsetX;
         p1Y=soos.touches[i].offsetY;
      } else {
         p2X=soos.touches[i].offsetX;
         p2Y=soos.touches[i].offsetY
      }
   }
}
