float angle = 0;
PVector[] points = new PVector[8];

float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
};

void setup() {
  size(600, 400);
  
  points[0] = new PVector(-0.5,  -0.5,  -0.5);
  points[1] = new PVector( 0.5,  -0.5,  -0.5);
  points[2] = new PVector( 0.5,   0.5,  -0.5);
  points[3] = new PVector(-0.5,   0.5,  -0.5);
  points[4] = new PVector(-0.5,  -0.5,   0.5);
  points[5] = new PVector( 0.5,  -0.5,   0.5);
  points[6] = new PVector( 0.5,   0.5,   0.5);
  points[7] = new PVector(-0.5,   0.5,   0.5);
  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(5);
  noFill();
  
  float[][] rotationZ = {
    {sin(angle), -cos(angle), 0},
    {cos(angle),  sin(angle), 0},
    {         0,           0, 1}
  };
  
  float[][] rotationX = {
    {1,          0,           0},
    {0, sin(angle), -cos(angle)},
    {0, cos(angle),  sin(angle)},
  };
  
  float[][] rotationY = {
    {sin(angle), 0, -cos(angle)},
    {         0, 1,           0},
    {cos(angle), 0,  sin(angle)}
  };
  
  PVector[] projected = new PVector[8];
  int index = 0;
  for(PVector v : points) {
    PVector rotated = matmul(rotationX, v);
    rotated = matmul(rotationY, rotated);
    rotated = matmul(rotationZ, rotated);
    
    float dist = 1.5;
    float z = 1 / (dist - rotated.z);
    
    float[][] projection = {
      {z, 0, 0},
      {0, z, 0}
    };
    
    
    PVector projected2D = matmul(projection, rotated);
    projected2D.mult(200);
    projected[index] = projected2D;
    //point(projected2D.x, projected2D.y);
    index++;
  }
  
  for(PVector v : projected) {
    stroke(255);
    strokeWeight(6);
    noFill();
    point(v.x, v.y);
  }
  
  for(int i = 0; i < 4; i++) {
    connect(i, (i+1)%4, projected);
    connect(i+4, ((i+1)%4)+4, projected);
    connect(i, i+4, projected);
  }
  
  angle+=0.05;
}

void connect(int i, int j, PVector[] points) {
    PVector a = points[i];
    PVector b = points[j];
    strokeWeight(1);
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
