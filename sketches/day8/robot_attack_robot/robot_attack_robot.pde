/**
 * WARNING: This sketch is dangerous, because it moves the mouses and types 
 * characters randomly. Use with caution.
 */


import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;

import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;

Robot robot;

void setup() {
  size(500, 500);

  try {
    robot = new Robot();
  } 
  catch(Exception e) {
    die("Could not make a robot. " + e.toString());
  }
}


void draw() {
  background(52);

  /* Capture the screen */
  PImage screenCapture = captureScreen(0, 0, 100, 100);
  image(screenCapture, 0, 0);

  /* Move the mouse */
  float x = map(sin(millis() * 0.002), -1, 1, 0, width);
  float y = map(cos(millis() * 0.0023), -1, 1, 0, height);

  float screenX = map(x, 0, width, 0, displayWidth);
  float screenY = map(y, 0, height, 0, displayHeight);

  robot.mouseMove(int(screenX), int(screenY));

  /* Type a 6 every 10th frame */
  if (frameCount % 10 == 0) {
    robot.mousePress(MouseEvent.BUTTON1_MASK);
    robot.mouseRelease(MouseEvent.BUTTON1_MASK);
    robot.keyPress(KeyEvent.VK_6);
    robot.keyRelease(KeyEvent.VK_6);
  }

  /* Exit! */
  if (frameCount == 300) {
    die("Stop the madness!");
  }
}


PImage captureScreen(int theX, int theY, int theWidth, int theHeight) {
  Rectangle rect = new Rectangle(theX, theY, theWidth, theHeight);
  BufferedImage captureImg = robot.createScreenCapture(rect) ;

  PImage img = new PImage(captureImg);

  return img;
}

