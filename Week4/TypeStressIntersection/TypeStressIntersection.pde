import processing.opengl.*;
import geomerative.*;

RFont font;//For singular cont
RShape grp;//For Group
RPoint[] txtPoints;

void setup(){
  size(600, 600, OPENGL);
  smooth();

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
}

void draw(){
  translate(width/2, height/2);
  background(255);
  
  noFill();

  RG.setPolygonizer(RG.UNIFORMLENGTH);
//  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  
  grp = RG.getText("order", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  grp.draw();
  
  
  // Create and draw a cutting line
  RShape cuttingLine = RG.getLine(-170, -103, -140, 20);
  stroke(0);
  strokeWeight(2);
  RG.shape(cuttingLine);//create a shape of the cutting line
  
  //Get the Points which Make up the text
  txtPoints = grp.getPoints();
  
  // Get the intersection points
  RPoint[] ps = grp.getIntersections(cuttingLine);
  
  fill(0);
//  noStroke();
//  println(ps);
  println(txtPoints);
  
  if (ps != null) {
    for (int i=0; i<ps.length; i++) {
      ellipse(ps[i].x, ps[i].y, 20, 20);
    }
  }
  
  if(txtPoints != null){
  
    fill(0);
    for(int i=0; i<txtPoints.length; i++){
      ellipse(txtPoints[i].x, txtPoints[i].y,5,5);  
    }
  }
  
  
}
