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

void draw() {
  background(52);

  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    circle.draw();
  }
}

