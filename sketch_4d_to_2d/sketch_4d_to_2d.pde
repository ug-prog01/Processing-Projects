float angle = 0;
float diag = 0;
P4Vector[] points = new P4Vector[16];

//float[][] projection = {
//  {1, 0, 0},
//  {0, 1, 0}
//};

void setup() {
  //fullScreen(P3D);
  size(600, 400, P3D);
  
  points[0] = new P4Vector(-0.5,  -0.5,  -0.5, 0.5);
  points[1] = new P4Vector( 0.5,  -0.5,  -0.5, 0.5);
  points[2] = new P4Vector( 0.5,   0.5,  -0.5, 0.5);
  points[3] = new P4Vector(-0.5,   0.5,  -0.5, 0.5);
  points[4] = new P4Vector(-0.5,  -0.5,   0.5, 0.5);
  points[5] = new P4Vector( 0.5,  -0.5,   0.5, 0.5);
  points[6] = new P4Vector( 0.5,   0.5,   0.5, 0.5);
  points[7] = new P4Vector(-0.5,   0.5,   0.5, 0.5);
  points[8] = new P4Vector(-0.5,  -0.5,  -0.5, -0.5);
  points[9] = new P4Vector( 0.5,  -0.5,  -0.5, -0.5);
  points[10] = new P4Vector( 0.5,   0.5,  -0.5, -0.5);
  points[11] = new P4Vector(-0.5,   0.5,  -0.5, -0.5);
  points[12] = new P4Vector(-0.5,  -0.5,   0.5, -0.5);
  points[13] = new P4Vector( 0.5,  -0.5,   0.5, -0.5);
  points[14] = new P4Vector( 0.5,   0.5,   0.5, -0.5);
  points[15] = new P4Vector(-0.5,   0.5,   0.5, -0.5);
  
}

void draw() {
  background(255);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(5);
  noFill();
  
  //rotateY(PI/2);
  rotateX(diag);
  rotateZ(diag);
  //rotateY(angle/5);
  //float[][] rotationZ = {
  //  {sin(angle), -cos(angle), 0},
  //  {cos(angle),  sin(angle), 0},
  //  {         0,           0, 1}
  //};
  
  //float[][] rotationX = {
  //  {1,          0,           0},
  //  {0, sin(angle), -cos(angle)},
  //  {0, cos(angle),  sin(angle)},
  //};
  
  //float[][] rotationY = {
  //  {sin(angle), 0, -cos(angle)},
  //  {         0, 1,           0},
  //  {cos(angle), 0,  sin(angle)}
  //};
  //for(P4Vector v : points) {
  //  PVector rotated = matmul(rotationX, v);
  //  rotated = matmul(rotationY, rotated);
  //  rotated = matmul(rotationZ, rotated);
    
  //  float dist = 1;
  //  float z = 1 / (dist - rotated.z);
       
    
  //  PVector projected2D = matmul(projection, rotated);
  //  projected2D.mult(200);
  //  projected[index] = projected2D;
  //  //point(projected2D.x, projected2D.y);
  //  index++;
  //}
  
  PVector[] projected = new PVector[16];
  int index = 0;
  
  float[][] rotationZW = {
    {1, 0, 0, 0},
    {0, 1, 0, 0},
    {0, 0, sin(angle), -cos(angle)},
    {0, 0, cos(angle),  sin(angle)}
  };
  
  float[][] rotationXY = {
    {sin(angle), -cos(angle), 0, 0},
    {cos(angle),  sin(angle), 0, 0},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
  };
  
  for(P4Vector v : points) {
    stroke(255);
    strokeWeight(6);
    noFill();
    
    P4Vector rotated = matmul(rotationXY, v, true);
    rotated = matmul(rotationZW, rotated, true);
    float dist = 2;
    float w = 1 / (dist - rotated.w);
    
    float[][] projection = {
      {w, 0, 0, 0},
      {0, w, 0, 0},
      {0, 0, w, 0}
    };
    
    PVector newp = matmul(projection, rotated);
    newp.mult(300);
    projected[index] = newp;
    //print(projected[index]);
    index++;
    point(newp.x, newp.y, newp.z);
  }
  
  for(int i = 0; i < 4; i++) {
    connect(0, i, (i+1)%4, projected);
    connect(0, i+4, ((i+1)%4)+4, projected);
    connect(0, i, i+4, projected);
  }
  
  for(int i = 0; i < 4; i++) {
    connect(8, i, (i+1)%4, projected);
    connect(8, i+4, ((i+1)%4)+4, projected);
    connect(8, i, i+4, projected);
  }
  
  for(int i = 0; i < 8; i++) {
    connect(0, i, i + 8, projected);
  }
  
  angle+=0.05;
  diag+=0.03;
}

void connect(int offset, int i, int j, PVector[] points) {
    PVector a = points[i + offset];
    PVector b = points[j + offset];
    strokeWeight(1.5);
    stroke(255, 0, 0);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }
