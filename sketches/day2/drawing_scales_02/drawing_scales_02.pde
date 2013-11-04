int ticks = 11;

void setup() {  
  size(800, 200); 
  smooth();
}

void draw() {
  background(255);
  
  stroke(0);
  
  for (int i = 0; i < ticks; i++) {
    float x = map(i, 0, ticks - 1, 0, width);
    
    if (i % 5 == 0) { 
      line(x, 0, x, height); 
    } else {
      line(x, 0, x, height * 0.5);
    }
  }
}
