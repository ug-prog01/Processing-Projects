float[] values;

int i = 0;
int j = 0;

void setup() {
  fullScreen();
  //size(200, 200);
  values = new float[width];
  for (int i= 0; i < values.length; i++) {
    values[i] = random(height);
  }
  
  //Sort
  
  //for (int i = 0; i < values.length; i++) {
  //  for (int j = 0; j < values.length - 1; j++) {
      
  //  }
  //}
}

void draw() {
  background(0);
  
  if (i < values.length) {
    for (int j = 0; j < values.length - i - 1; j++) {
      float a = values[j];
      float b = values[j + 1];
      if ( a > b ) 
        swap(values, j, j+1);
    }
  } else {
    println("Done");
    noLoop();
  }
  
  for (int i = 0; i < values.length; i++) {
    stroke(255);
    line(i, height, i, height - values[i]);
  }
  i++;
}

void swap(float[] arr, int a, int b) {
  float temp;
  temp = arr[b];
  arr[b] = arr[a];
  arr[a] = temp;
}
