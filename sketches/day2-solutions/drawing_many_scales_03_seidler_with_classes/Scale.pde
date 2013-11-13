class Scale {
  float x;
  float y;

  float w;

  int divisions = 50;

  float tickHeight = 10;   // how high a small tick is
  float fontSize = 12;

  float mediumTickScale = 2.0;  // relative to the small tick
  float bigTickScale = 4.0;  // relative to the small tick

  int smallTickEvery = 1;  // zero for none...
  int mediumTickEvery = 5;
  int bigTickEvery = 10;


  Scale(float theX, float theY, float theWidth) {
    x = theX;
    y = theY;

    w = theWidth;
  }


  void draw() {
    pushMatrix();

    translate(x, y);   // move everything

    line(0, 0, w, 0);

    for (int i = 0; i < divisions; i++) {
      float tickX = i * w / (divisions - 1);

      if (bigTickEvery > 0 && i % bigTickEvery == 0) {
        line (tickX, 0, tickX, tickHeight * bigTickScale);

        fill(0);
        textSize(fontSize);
        text(i, tickX, -tickHeight * 0.25);
      } 
      else if (mediumTickEvery > 0 && i % mediumTickEvery == 0) {
        line (tickX, 0, tickX, tickHeight * mediumTickScale);
      } 
      else if (smallTickEvery > 0 && i % smallTickEvery == 0) {
        line (tickX, 0, tickX, tickHeight);
      }
    }

    popMatrix();
  }
}

