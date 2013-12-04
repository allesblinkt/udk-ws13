/**
 * For PDF output one pixel unit in Processing becomes one point in the PDF.
 * Those are the same points that also exist in Illustrator.
 * One inch are 72 points
 *
 * 1 inch = 72 pt
 * 1 pt = 1 / 72 inch
 * 1 inch = 25.4 mm
 * 1 pt =  25.4 / 72 mm
 * 1 mm = 72 / 25.4 pt
 */

import processing.pdf.*;

boolean doRecord = false;

void setup() {
  int widthPt = int(mmToPt(210));
  int heightPt = int(mmToPt(297));
  size(widthPt, heightPt);
}


void draw() {

  if (doRecord) {
    String recordFile = "output-" + timestamp() + ".pdf";
    beginRecord(recordFile, PDF);
  }


  if (doRecord) {
    endRecord();
    doRecord = false;
  }


  /* Do not write our debug output to PDF */
}


void keyPressed() {
  if (key == 'r') {
    doRecord = true;
  }
}

/** Converts a length in mm to points */
float mmToPt(float theMm) {
  float mmToPointFactor = 72 / 25.4;
  return theMm * mmToPointFactor;
}

/* Converts a length in points to mm */
float ptToMm(float thePt) {
  float mmToPointFactor = 72 / 25.4;
  return thePt / mmToPointFactor;
}

/** Returns a timestamp string like 131201-162711   (YYMMDD-hhmmss) */
String timestamp() {
  String date = nf(year(), 2) + nf(month(), 2) + nf(day(), 2);
  String time = nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  return  date + "-" + time;
}

