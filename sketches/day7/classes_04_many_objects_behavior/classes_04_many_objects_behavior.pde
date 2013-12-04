ArrayList<Circle> circles;

void setup() {
  size(800, 600);

  circles = new ArrayList<Circle>();

  for (int i = 0; i < 20; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = random(20, 100);

    Circle circle = new Circle(x, y, diameter);

    circles.add(circle);
  }
}


void distributeCircles(ArrayList<Circle> theCircles) {
  ArrayList<Circle> placedCircles = new ArrayList<Circle>();

  for (int i = 0; i < circles.size(); i++) {
    Circle circleToPlace = circles.get(i);

    boolean collides = true;

    while (collides) {

      for (int j = 0; j < placedCircles.size(); j++) {
        Circle existingCircle = placedCircles.get(j);
        
        float distance = existingCircle.position.dist(circleToPlace.position);
        float minDistance = (circleToPlace + existingCircle.diameter) * 0.5;        
        
        if (distance < minDistance) {   // collision. No need to look further
          break;
        }
      }
    }
  }
}

void draw() {
  background(52);

  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    circle.draw();
  }
}

