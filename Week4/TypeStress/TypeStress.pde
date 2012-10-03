import geomerative.*;
import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont font;//For singular cont
RShape grp;//For Group
RPoint[] txtPoints;

void setup(){
  // Initilaize the sketch
  size(600,400);
//  frameRate(24);
  // Enable smoothing
  smooth();

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("order", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text


}

void draw(){
  // Clean frame
  background(255);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  //Debug placement Point
  fill(255,0,0);
  ellipse(0,0,10,10);
  
  // Draw the Texts group of shapes: The outlines
  noFill();
  stroke(0,0,200,150);
  grp.draw();
  
  // Get the points on the curve's shape
  //  RG.setPolygonizer(RG.ADAPTATIVE);
  //  RG.setPolygonizer(RG.UNIFORMSTEP);
  //  RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
//  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  txtPoints = grp.getPoints();
  
  // If there are any points
  if(txtPoints != null){
    noFill();
    stroke(0,200,0);
//    beginShape();
//    for(int i=0; i<points.length; i++){
//      vertex(points[i].x, points[i].y);
//    }
//    endShape();
  
    fill(0);
    stroke(0);
    for(int i=0; i<txtPoints.length; i++){
      ellipse(txtPoints[i].x, txtPoints[i].y,5,5);  
    }
  }
}
