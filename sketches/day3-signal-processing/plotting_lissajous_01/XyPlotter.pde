class XyPlotter {
  float storageX[];
  float storageY[];

  int pointer = 0;

  color strokeColor = color(0);
  color guideColor = color(200);

  /** Constructor. Accepts the capacity of the plotter */
  XyPlotter(int theCapacity) {
    storageX = new float[theCapacity];   // make room
    storageY = new float[theCapacity];   // make room
  }

  /** Puts a new value in storage */
  void put(float theValueX, float theValueY) {
    pointer = (pointer + 1) % storageX.length;  // what's the next slot?
    storageX[pointer] = theValueX;  // store
    storageY[pointer] = theValueY;  // store
  }

  /** Draws the plotter */
  void draw(float theX, float theY, float theWidth, float theHeight) {
    noFill();

    stroke(guideColor);
    rect(theX, theY, theWidth, theHeight);

    stroke(strokeColor);
    beginShape();
    for (int i = 0; i < storageX.length; i++) {
      int index = (i + pointer + 1) % storageX.length;  // start at the current and wrap around...

      float valueX = storageX[index];
      float valueY = storageY[index];

      float x = theX + map(valueX, -1, 1, 0, theWidth);
      float y = theX + map(valueY, -1, 1, 0, theHeight);

      vertex(x, y);
    }
    endShape();
  }
}

