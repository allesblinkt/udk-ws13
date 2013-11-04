void setup() {
  size(600, 400);
}

void draw() {
  background(255);

  int divisions = 11;

  for (int i = 0; i < divisions; i++) {
    float x = i * width / (divisions - 1);  
    //float x = (i, 0, divisions - 1, 0, width);   // the very same

    if (i % 5 == 0) {  // every 5th
      strokeWeight(2);
      line(x, 0, x, 200);
    } 
    else if (i % 2 == 0) {  // or every even
      strokeWeight(1.5);

      line(x, 0, x, 100);
    } 
    else {  // all others
      strokeWeight(1.0);

      line(x, 0, x, 50);
    }
  }
}

