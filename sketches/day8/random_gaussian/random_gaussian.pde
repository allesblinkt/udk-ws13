void setup() {
  size(600, 600, JAVA2D); 
  background(52); 

  frameRate(100);
}

void draw() {

  for (int i = 0; i < 100; i++) {
    
    // randomGaussian() has a standard deviation of 1.0, this means the chance 
    // between 0 and 1  is about 50%, between 1 and 2 about 25% etc.
    float x = map(randomGaussian(), -5, 5, 0, width);
    float y = map(randomGaussian(), -5, 5, 0, width);

    noStroke();
    fill(255, 40);
    ellipse(x, y, 5, 5);
  }
}

