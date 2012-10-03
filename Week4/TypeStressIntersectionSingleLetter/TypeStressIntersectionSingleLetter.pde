import geomerative.*;

RFont font;//For singular cont
RShape grp;//For Group
RShape s0;//For Letter
RShape t;//For Letter
RShape r;//For Letter
RShape e;//For Letter
RShape s1;//For Letter
RShape s2;//For Letter


RPoint[] s0Points;
RPoint[] tPoints;
RPoint[] rPoints;
RPoint[] ePoints;
RPoint[] s1Points;
RPoint[] s2Points;

int noiseScale = 25;

void setup() {
  size(600, 600);
  background(255);
  frameRate(15);
   // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);

      
}

void draw() {
  background(255,255,255,.8);
  smooth();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
//  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));

  grp = RG.getText("stress", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  s0 = RG.getText("s", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  t = RG.getText("t", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  r = RG.getText("r", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  e = RG.getText("e", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  s1 = RG.getText("s", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  s2= RG.getText("s", "Garamond.ttf", 200, CENTER); //Last Parameter is the "origin" of the text
  
 ////FULL WORD FOR DEBUGGING PURPOSES//////////////
  pushMatrix();
  translate(width/2, height/3); 
  grp.draw();
  popMatrix();
 
/////////FIRST S//////////////
  pushMatrix();
  translate(125, height*2/3); 
  fill(255);
  s0.draw();
  RShape cuttingLine0 = RG.getLine(-5, -103, 20, 20);
//  ellipse(0,0,19,19);
  
    stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine0);//create a shape of the cutting line

    //Get the Points which Make up the text
  s0Points = s0.getPoints();

  // Get the intersection points
  RPoint[] s0IntPoints = s0.getIntersections(cuttingLine0);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(s0Points != null && s0IntPoints != null){
  beginShape(); 
  curveVertex(s0Points[s0Points.length-1].x, s0Points[s0Points.length-1].y);
  for (int i=0; i<s0Points.length; i++) {
  for (int j=0; j<s0IntPoints.length; j++) { 
          
          if (int(s0Points[i].x) <= int(s0IntPoints[j].x+3) && int(s0Points[i].x) >= int(s0IntPoints[j].x-3) && int(s0Points[i].y) <= int(s0IntPoints[j].y+3) && int(s0Points[i].y) >= int(s0IntPoints[j].y-3)) {
         s0Points[i].x=s0Points[i].x+noise(s0Points[i].x)*noiseScale*random(-1,1); 
         s0Points[i].y=s0Points[i].y+noise(s0Points[i].y)*noiseScale*random(-1,1);
         }
         vertex(s0Points[i].x,s0Points[i].y);
  }   
}
  curveVertex(s0Points[0].x, s0Points[0].y);
  curveVertex(s0Points[1].x, s0Points[1].y);
  endShape(CLOSE);
}
   popMatrix();
   
/////////LETTER T //////////////
  pushMatrix();
  translate(197, height*2/3); 
  fill(255);
  t.draw();
  RShape cuttingLine1 = RG.getLine(10, -103, 10, 20);
//  ellipse(0,0,19,19);
  
    stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine1);//create a shape of the cutting line

    //Get the Points which Make up the text
  tPoints = t.getPoints();

  // Get the intersection points
  RPoint[] tIntPoints = t.getIntersections(cuttingLine1);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(tPoints != null && tIntPoints != null){
  beginShape(); 
  curveVertex(tPoints[tPoints.length-1].x, tPoints[tPoints.length-1].y);
  for (int i=0; i<tPoints.length; i++) {
  for (int j=0; j<tIntPoints.length; j++) { 
          
          if (int(tPoints[i].x) <= int(tIntPoints[j].x+3) && int(tPoints[i].x) >= int(tIntPoints[j].x-3) && int(tPoints[i].y) <= int(tIntPoints[j].y+3) && int(tPoints[i].y) >= int(tIntPoints[j].y-3)) {
         tPoints[i].x=tPoints[i].x+noise(tPoints[i].x)*noiseScale*random(-1,1); 
         tPoints[i].y=tPoints[i].y+noise(tPoints[i].y)*noiseScale*random(-1,1);
         }
         vertex(tPoints[i].x,tPoints[i].y);
  }   
}
  curveVertex(tPoints[0].x, tPoints[0].y);
  curveVertex(tPoints[1].x, tPoints[1].y);
  endShape(CLOSE);
}
   popMatrix();
   
   
/////////LETTER R //////////////
  pushMatrix();
  translate(260, height*2/3); 
  fill(255);
  r.draw();
  RShape cuttingLine2 = RG.getLine(3, -103, 3, 20);
//  ellipse(0,0,19,19);
  
  stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine2);//create a shape of the cutting line

    //Get the Points which Make up the text
  rPoints = r.getPoints();

  // Get the intersection points
  RPoint[] rIntPoints = r.getIntersections(cuttingLine2);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(rPoints != null && rIntPoints != null){
  beginShape(); 
  curveVertex(rPoints[rPoints.length-1].x, rPoints[rPoints.length-1].y);
  for (int i=0; i<rPoints.length; i++) {
  for (int j=0; j<rIntPoints.length; j++) { 
          
          if (int(rPoints[i].x) <= int(rIntPoints[j].x+3) && int(rPoints[i].x) >= int(rIntPoints[j].x-3) && int(rPoints[i].y) <= int(rIntPoints[j].y+3) && int(rPoints[i].y) >= int(rIntPoints[j].y-3)) {
         rPoints[i].x=rPoints[i].x+noise(rPoints[i].x)*noiseScale*random(-1,1); 
         rPoints[i].y=rPoints[i].y+noise(rPoints[i].y)*noiseScale*random(-1,1);
         }
         vertex(rPoints[i].x,rPoints[i].y);
  }   
}
  curveVertex(rPoints[0].x, rPoints[0].y);
  curveVertex(rPoints[1].x, rPoints[1].y);
  endShape(CLOSE);
}
   popMatrix();
   
   
   /////////LETTER E //////////////
  pushMatrix();
  translate(328, height*2/3); 
  fill(255);
  e.draw();
  RShape cuttingLine3 = RG.getLine(-5, -103, 20, 20);
//  ellipse(0,0,19,19);
  
  stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine3);//create a shape of the cutting line

    //Get the Points which Make up the text
  ePoints = e.getPoints();

  // Get the intersection points
  RPoint[] eIntPoints = e.getIntersections(cuttingLine3);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(ePoints != null && eIntPoints != null){
  beginShape(); 
  curveVertex(ePoints[ePoints.length-1].x, ePoints[ePoints.length-1].y);
  for (int i=0; i<ePoints.length; i++) {
  for (int j=0; j<eIntPoints.length; j++) { 
          
          if (int(ePoints[i].x) <= int(eIntPoints[j].x+3) && int(ePoints[i].x) >= int(eIntPoints[j].x-3) && int(ePoints[i].y) <= int(eIntPoints[j].y+3) && int(ePoints[i].y) >= int(eIntPoints[j].y-3)) {
         ePoints[i].x=ePoints[i].x+noise(ePoints[i].x)*noiseScale*random(-1,1); 
         ePoints[i].y=ePoints[i].y+noise(ePoints[i].y)*noiseScale*random(-1,1);
         }
         vertex(ePoints[i].x,ePoints[i].y);
  }   
}
  curveVertex(ePoints[0].x, ePoints[0].y);
  curveVertex(ePoints[1].x, ePoints[1].y);
  endShape(CLOSE);
}
   popMatrix();
  
/////////SECOND S//////////////
  pushMatrix();
  translate(404, height*2/3); 
  fill(255);
  s1.draw();
  RShape cuttingLine4 = RG.getLine(-5, -103, 20, 20);
//  ellipse(0,0,19,19);
  
    stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine4);//create a shape of the cutting line

    //Get the Points which Make up the text
  s1Points = s1.getPoints();

  // Get the intersection points
  RPoint[] s1IntPoints = s1.getIntersections(cuttingLine4);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(s1Points != null && s1IntPoints != null){
  beginShape(); 
  curveVertex(s1Points[s1Points.length-1].x, s1Points[s1Points.length-1].y);
  for (int i=0; i<s1Points.length; i++) {
  for (int j=0; j<s1IntPoints.length; j++) { 
          
          if (int(s1Points[i].x) <= int(s1IntPoints[j].x+3) && int(s1Points[i].x) >= int(s1IntPoints[j].x-3) && int(s1Points[i].y) <= int(s1IntPoints[j].y+3) && int(s1Points[i].y) >= int(s1IntPoints[j].y-3)) {
         s1Points[i].x=s1Points[i].x+noise(s1Points[i].x)*noiseScale*random(-1,1); 
         s1Points[i].y=s1Points[i].y+noise(s1Points[i].y)*noiseScale*random(-1,1);
         }
         vertex(s1Points[i].x,s1Points[i].y);
  }   
}
  curveVertex(s1Points[0].x, s1Points[0].y);
  curveVertex(s1Points[1].x, s1Points[1].y);
  endShape(CLOSE);
}
   popMatrix();
  
  /////////SECOND S//////////////
  pushMatrix();
  translate(475, height*2/3); 
  fill(255);
  s2.draw();
  RShape cuttingLine5 = RG.getLine(-5, -103, 20, 20);
//  ellipse(0,0,19,19);
  
    stroke(255,0,0);
  strokeWeight(2);
  RG.shape(cuttingLine5);//create a shape of the cutting line

    //Get the Points which Make up the text
  s2Points = s2.getPoints();

  // Get the intersection points
  RPoint[] s2IntPoints = s2.getIntersections(cuttingLine5);

  fill(0);
  stroke(0);
//  strokeWeight(2);
  
  if(s2Points != null && s2IntPoints != null){
  beginShape(); 
  curveVertex(s2Points[s2Points.length-1].x, s2Points[s2Points.length-1].y);
  for (int i=0; i<s2Points.length; i++) {
  for (int j=0; j<s2IntPoints.length; j++) { 
          
          if (int(s2Points[i].x) <= int(s2IntPoints[j].x+3) && int(s2Points[i].x) >= int(s2IntPoints[j].x-3) && int(s2Points[i].y) <= int(s2IntPoints[j].y+3) && int(s2Points[i].y) >= int(s2IntPoints[j].y-3)) {
         s2Points[i].x=s2Points[i].x+noise(s2Points[i].x)*noiseScale*random(-1,1); 
         s2Points[i].y=s2Points[i].y+noise(s2Points[i].y)*noiseScale*random(-1,1);
         }
         vertex(s2Points[i].x,s2Points[i].y);
  }   
}
  curveVertex(s2Points[0].x, s2Points[0].y);
  curveVertex(s2Points[1].x, s2Points[1].y);
  endShape(CLOSE);
}
   popMatrix();
  
}

