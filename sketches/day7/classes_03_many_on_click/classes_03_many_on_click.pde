ArrayList<Circle> circles;

void setup() {
  size(800, 600);

  circles = new ArrayList<Circle>();

  Circle circle = new Circle(width * 0.5, height * 0.5, 100);
  circles.add(circle);
}

void draw() {
  background(52);

  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    circle.draw();
  }
}


void mouseClicked() {
  Circle circle = new Circle(mouseX, mouseY, 100);
  circles.add(circle);
}

