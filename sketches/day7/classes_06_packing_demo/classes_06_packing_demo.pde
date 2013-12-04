/** 
 * Places a number of circles around a given center as closely as possible growing 
 * inside out.
 * This is an interactive demo for the sketch classes_05_packing
 * 
 * NOTE: This code is for demonstration purposes only, but in no way clean!
 */

import java.util.Collections;

ArrayList<Circle> circles;

PVector center;
float searchRadius;
float radiusIncrement;
float thetaSteps;
float theta;
float margin;
int tries;
Circle circleToPlace;
ArrayList<Circle> circlesToPlace;
ArrayList<Circle> placedCircles;


void setup() {
  size(800, 600);
  frameRate(120);

  circles = createCircles();
  resetPacking();
}

void draw() {
  background(52);

  continuePacking();

  for (int i = 0; i < circlesToPlace.size(); i++) {
    Circle circle = circlesToPlace.get(i);
    circle.drawPassive();
  }

  for (int i = 0; i < placedCircles.size(); i++) {
    Circle circle = placedCircles.get(i);
    circle.draw();
  }
  
  if (circleToPlace != null) {
    circleToPlace.drawHighlighted();
  }


  pushMatrix();
  translate(center.x, center.y);

  noFill();
  stroke(255, 69, 0);
  ellipse(0, 0, searchRadius * 2.0, searchRadius * 2.0);

  rotate(-theta);
  line(0, 0, width, 0);

  popMatrix();
}

void continuePacking() {
  if (circleToPlace == null) {
    if (circlesToPlace.size() == 0) {
      return;
    }

    circleToPlace = circlesToPlace.get(circlesToPlace.size() - 1);
    circlesToPlace.remove(circlesToPlace.size() - 1);
    tries = 0;
  }

  theta = tries / (thetaSteps * 0.5) * TWO_PI;

  float x = cos(theta) * searchRadius;
  float y = -sin(theta) * searchRadius;
  PVector newPosition = new PVector(x, y);
  newPosition.add(center);

  circleToPlace.position.set(newPosition);

  boolean collides = false;   // true when there is a found collision

  for (int j = 0; j < placedCircles.size(); j++) {
    Circle existingCircle = placedCircles.get(j);

    float distance = existingCircle.position.dist(newPosition);
    float collisionDistance = (circleToPlace.diameter + existingCircle.diameter) * 0.5 + margin;        

    if (distance < collisionDistance) {   // collision. No need to look further
      collides = true;
      break;
    }
  }

  if (!collides) {   // we have found a place...
    placedCircles.add(circleToPlace);

    circleToPlace = null;
  } 
  else {
    tries++;

    if (tries % thetaSteps == 0) {   // increment the search radius
      searchRadius = searchRadius + radiusIncrement;
    }
  }
}

void resetPacking() {
  /* Find the smallest diameter to try with something sensible */
  float[] diameters = new float[circles.size()];

  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    diameters[i] = circle.diameter;
  }

  float[] sortedDiamters = sort(diameters);
  float smallestDiameter = sortedDiamters[0] * 0.5; 

  /* Initial numbers */
  thetaSteps = 111;
  radiusIncrement = smallestDiameter;

  center = new PVector(width * 0.5, height * 0.5); 
  searchRadius = 0;
  margin = 2;
  tries = 0;
  circleToPlace = null;
  placedCircles = new ArrayList<Circle>();
  circlesToPlace = new ArrayList<Circle>();
  circlesToPlace.addAll(circles);
  Collections.reverse(circlesToPlace);
}

ArrayList<Circle> createCircles() {
  ArrayList<Circle> newCircles = new ArrayList<Circle>();

  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = map(i, 0, 99, 50, 5);

    Circle circle = new Circle(x, y, diameter);

    newCircles.add(circle);
  }

  return newCircles;
}

