class Circle {
  PVector position;
  float diameter;

  Circle(float theX, float theY, float theDiameter) {
    position = new PVector(theX, theY);
    diameter = theDiameter;
  }

  void draw() {
    noStroke();
    fill(255, 69, 0);
    
    ellipse(position.x, position.y, diameter, diameter);
  }
}

