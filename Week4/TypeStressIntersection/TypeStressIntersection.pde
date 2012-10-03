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

  grp = RG.getText("order", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
//  grp.draw();


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
  //  println(txtPoints);

  //  if (ps != null) {
  //    for (int i=0; i<ps.length; i++) {
  //      ellipse(ps[i].x, ps[i].y, 20, 20);
  //    }
  //  }


//  if (txtPoints != null) {
//    noFill();
//    stroke(0, 200, 0);
//    //    beginShape();
//    //    for(int i=0; i<points.length; i++){
//    //      vertex(points[i].x, points[i].y);
//    //    }
//    //    endShape();
//
//    fill(0);
//    stroke(0);
//    for (int i=0; i<txtPoints.length; i++) {
//      ellipse(txtPoints[i].x, txtPoints[i].y, 5, 5);
//    }
//  }

  fill(0);
  for (int i=0; i<txtPoints.length; i++) {
    for (int j=0; j<ps.length; j++) {      
      if (int(txtPoints[i].x) <= int(ps[j].x+10) && int(txtPoints[i].x) >= int(ps[j].x-10) && int(txtPoints[i].y) <= int(ps[j].y+10) && int(txtPoints[i].y) >= int(ps[j].y-10)) {
        //      println("x = " + txtPoints[i].x +"y=" + txtPoints[i].y ); 
        fill(0, 255, 0);
        ellipse(txtPoints[i].x+random(-5,5), txtPoints[i].y+random(-5,5), 5, 5 ); 
//        fill(255, 0, 0);
        //      println("x = " + ps[j].x +"y=" + ps[j].y ); 
//        ellipse(ps[j].x, ps[j].y, 5, 5);
      }
      else{
      fill(0, 0, 255);
      ellipse(txtPoints[i].x, txtPoints[i].y,5,5); 
    }   
    }
  }

  //  print("fin");
}

void draw() {
}

