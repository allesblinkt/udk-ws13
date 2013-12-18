void setup() {
  size(600, 600, JAVA2D); 
  background(52); 

  frameRate(100);
}

void draw() {

  for (int i = 0; i < 100; i++) {
    float x = map(random(0, 1), 0, 1, 0, width);
    float y = map(random(0, 1), 0, 1, 0, height);

    noStroke();
    fill(255, 40);
    ellipse(x, y, 5, 5);
  }
}

