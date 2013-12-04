class Circle {
  PVector position;
  float diameter;
  float speed;

  Circle(float theX, float theY, float theDiameter) {
    position = new PVector(theX, theY);
    diameter = theDiameter;
    speed = random(0.5, 1.0);
  }

  void draw() {
    noStroke();
    
    fill(255);
    ellipse(position.x, position.y, diameter, diameter);
    
    float innerDiameter = map(sin(speed * millis() * 0.002f), -1, 1, diameter * 0.25, diameter * 0.75);
        
    fill(128);
    ellipse(position.x, position.y, innerDiameter, innerDiameter);
  }
  
  void drawHighlighted() {
    noFill();
    
    stroke(255, 69, 0);
    ellipse(position.x, position.y, diameter, diameter);
  }
  
  void drawPassive() {
    noFill();
    
    stroke(100);
    ellipse(position.x, position.y, diameter, diameter);
  }
}

