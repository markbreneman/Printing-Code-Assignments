import processing.opengl.*;
import geomerative.*;

RFont font;//For singular cont
RShape grp;//For Group
RPoint[] txtPoints;

void setup() {
  size(600, 600, OPENGL);
  smooth();
   // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  translate(width/2, height/2);
  background(255);

  noFill();

  RG.setPolygonizer(RG.UNIFORMLENGTH);
//  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));

  grp = RG.getText("stress", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
//  grp.draw();
//  ellipse(0,0,19,19);
  
  // Create and draw a cutting line
  RShape cuttingLine = RG.getLine(-180, -103, -150, 20);
  
  stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine);//create a shape of the cutting line

    //Get the Points which Make up the text
  txtPoints = grp.getPoints();

  // Get the intersection points
  RPoint[] ps = grp.getIntersections(cuttingLine);

  fill(0);

//  for (int i=0; i<txtPoints.length; i++) {
//    for (int j=0; j<ps.length; j++) {  
//
//      fill(0, 0, 255);
//      ellipse(txtPoints[i].x, txtPoints[i].y,5,5); 
//      
//      if (int(txtPoints[i].x) <= int(ps[j].x+10) && int(txtPoints[i].x) >= int(ps[j].x-10) && int(txtPoints[i].y) <= int(ps[j].y+10) && int(txtPoints[i].y) >= int(ps[j].y-10)) {
//        fill(0, 255, 0);
//        ellipse(txtPoints[i].x+random(-5,5), txtPoints[i].y+random(-5,5), 5, 5 ); 
//      }   
//    }
//  }


//  beginShape(); 
//  for (int i=0; i<txtPoints.length; i++) {
//  for (int j=0; j<ps.length; j++) { 
//          vertex(txtPoints[i].x,txtPoints[i].y);
//          if (int(txtPoints[i].x) <= int(ps[j].x+10) && int(txtPoints[i].x) >= int(ps[j].x-10) && int(txtPoints[i].y) <= int(ps[j].y+10) && int(txtPoints[i].y) >= int(ps[j].y-10)) {
//          vertex(txtPoints[i].x+random(-5,5), txtPoints[i].y+random(-5,5));      }
//  }   
//}
//  endShape();

  stroke(0);
  strokeWeight(2);
  
  if(txtPoints != null && ps != null){
  beginShape(); 
  //  curveVertex(pnts[pnts.length-1].x, pnts[pnts.length-1].y);
  for (int i=0; i<txtPoints.length; i++) {
  for (int j=0; j<ps.length; j++) { 
          
          if (int(txtPoints[i].x) <= int(ps[j].x+10) && int(txtPoints[i].x) >= int(ps[j].x-10) && int(txtPoints[i].y) <= int(ps[j].y+10) && int(txtPoints[i].y) >= int(ps[j].y-10)) {
         txtPoints[i].x=txtPoints[i].x+random(-5,5); 
         txtPoints[i].y=txtPoints[i].y+random(-5,5);
         }
         vertex(txtPoints[i].x,txtPoints[i].y);
  }   
}
  endShape(CLOSE);
}
  
      
}

void draw() {
  

  
}

