void setup() {  
  size(600, 400); 
  smooth();
}

void draw() {
  background(255);
  
  stroke(0);
  
  for (int i = 0; i < 11; i++) {
    float x = map(i, 0, 10, 0, width);
    line(x, 0, x, height); 
  }
}
