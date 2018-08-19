float[][] vecToMat(PVector v) {
 float[][] m = new float[3][1];
 m[0][0] = v.x;
 m[1][0] = v.y;
 m[2][0] = v.z;
 return m;
}

float[][] vecToMat4(P4Vector v) {
 float[][] m = new float[4][1];
 m[0][0] = v.x;
 m[1][0] = v.y;
 m[2][0] = v.z;
 m[3][0] = v.w;
 return m;
}

PVector matToVec(float[][] m) {
  PVector v = new PVector();
  v.x = m[0][0];
  v.y = m[1][0];
  if(m.length > 2) {
    v.z = m[2][0];
  }
  return v;
}

P4Vector matToVec4(float[][] m) {
  P4Vector v = new P4Vector(0,0,0,0);
  v.x = m[0][0];
  v.y = m[1][0];
  v.z = m[2][0];
  v.w = m[3][0];
  return v;
}

PVector matmul(float[][] a, P4Vector b) {
  float[][] m = vecToMat4(b);
  return matToVec(matmul(a, m));
}

P4Vector matmul(float[][] a, P4Vector b, boolean f) {
  float[][] m = vecToMat4(b);
  return matToVec4(matmul(a, m));
}

float[][] matmul(float[][] a, float[][] b) {
  int colA = a[0].length;
  int rowA = a.length;
  int colB = b[0].length;
  int rowB = b.length;
  
  if(colA != rowB) {
    println("Not equal");
    return null;
  }
  
  float result[][] = new float[rowA][colB];

  for( int i = 0; i < rowA; i++) {
    for( int j = 0; j < colB; j++) {
      float sum = 0;
      for( int k = 0; k < colA; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}
