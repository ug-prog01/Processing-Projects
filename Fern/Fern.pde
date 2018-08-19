
float x;
float y;
float px, py;
public class col {
  public float r;
  public float g;
  public float b;
};

col colo = new col();

void setup() {
  size(1000, 800);
  background(0);
}

void nextPoint() {
  float nextX;
  float nextY;
  
  float ra = random(1);
  
  if ( ra < 0.01) {
    colo.r = map(px, 0,  width, 0, 255);//255;
    colo.g = map(py, 0,  height, 0, 255);//random(255);
    colo.b = map(px, 0,  width, 0, 255);//random(100);
    nextX =  0;
    nextY =  0.16 * y;
  } else if ( ra < 0.86) {
    colo.r = map(py, 0,  height, 0, 255);//50;
    colo.g = map(px, 0,  width, 0, 255);//random(200);
    colo.b = map(px, 0,  width, 0, 255);//70;
    nextX =  0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.6;
  } else if ( ra < 0.93) {
    colo.r = map(px, 0,  width, 0, 255);//100;
    colo.g = map(py, 0,  height, 0, 255);//random(255);
    colo.b = map(py, 0,  height, 0, 255);//10;
    nextX =  0.20 * x - 0.26 * y;
    nextY =  0.23 * x + 0.22 * y + 1.6;
  } else {
    colo.r = map(px, 0,  width, 0, 255);//random(255);
    colo.g = map(py, 0,  height, 0, 255);//random(255);
    colo.b = map(px, 0,  width, 0, 255);//random(255);
    nextX =  -0.15 * x + 0.28 * y;
    nextY =   0.26 * x + 0.24 * y + 0.44;
  }
  x = nextX;
  y = nextY;
}

void drawP() {
  stroke(colo.r, colo.g, colo.b);
  strokeWeight(2);
  px = map(x, -2.1820, 2.6558, 0, width);
  py = map(y,  0, 9.9983, height, 0);
  point(px, py);
  //noFill();
  //ellipse(px, py, 8, 4);
}

void draw() {
  for ( int i = 0; i < 50; i++) {
    drawP();
    nextPoint();
  }
}
