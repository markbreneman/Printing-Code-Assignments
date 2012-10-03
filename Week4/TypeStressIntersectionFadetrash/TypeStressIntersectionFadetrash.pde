import geomerative.*;

PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 11;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

//Centering Artwork on the Canvas
float ratioWidth = 1;
float ratioHeight = 1;
float ratio =1;

//TYPOGRAPHY ASSIGNMENT VARIABLES
RFont font;//For singular cont
RShape grp;//For Group
RShape s0;//For Letter
RShape t;//For Letter
RShape r;//For Letter
RShape e;//For Letter
RShape s1;//For Letter
RShape s2;//For Letter

RPoint[] pnts;
RPoint[] s0Points;
RPoint[] tPoints;
RPoint[] rPoints;
RPoint[] ePoints;
RPoint[] s1Points;
RPoint[] s2Points;
int noiseScale = 100;

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 800;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);

  size(width, height);
  colorMode(HSB, 360, 100, 100,1);
//  background(0);
  frameRate(5);
  
  canvas = createGraphics(canvas_width, canvas_height);
  
   // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  
  calculateResizeRatio();      
}

void draw() {
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100,1);
  canvas.background(0,0,100,.9);
  canvas.smooth();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
//  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));

  grp = RG.getText("stress", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  s0 = RG.getText("s", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  t = RG.getText("t", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  r = RG.getText("r", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  e = RG.getText("e", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  s1 = RG.getText("s", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  s2= RG.getText("s", "Garamond.ttf", 1000, CENTER); //Last Parameter is the "origin" of the text
  
 ////FULL WORD FOR DEBUGGING PURPOSES//////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width/2, canvas.height/3); 
  pnts = grp.getPoints();
  canvas.fill(0,0,0,1);
  canvas.beginShape();
  canvas.curveVertex(pnts[pnts.length-1].x, pnts[pnts.length-1].y);
  for (int i=0; i<pnts.length; i++) {
   canvas.curveVertex(pnts[i].x, pnts[i].y);
  }
  canvas.curveVertex(pnts[0].x, pnts[0].y);
  canvas.curveVertex(pnts[1].x, pnts[1].y);
  canvas.endShape();
  
  canvas.popMatrix();
 
/////////FIRST S//////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3, canvas.height*2/3); 
//  fill(0,0,0,1);
//  s0.draw();
  RShape cuttingLine0 = RG.getLine(-4, -500, 100, 100);
   canvas.stroke(0,0,0,1);
  canvas.strokeWeight(5);
  canvas.line(-4, -500, 100, 100);
//  canvas.ellipse(0,0,50,50);
  
//  RG.shape(cuttingLine0);//create a shape of the cutting line

    //Get the Points which Make up the text
  s0Points = s0.getPoints();

  // Get the intersection points
  RPoint[] s0IntPoints = s0.getIntersections(cuttingLine0);

  canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.8);

  
  if(s0Points != null && s0IntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(s0Points[s0Points.length-1].x, s0Points[s0Points.length-1].y);
  for (int i=0; i<s0Points.length; i++) {
  for (int j=0; j<s0IntPoints.length; j++) { 
          
          if (int(s0Points[i].x) <= int(s0IntPoints[j].x+50) && int(s0Points[i].x) >= int(s0IntPoints[j].x-50) && int(s0Points[i].y) <= int(s0IntPoints[j].y+50) && int(s0Points[i].y) >= int(s0IntPoints[j].y-50)) {
         s0Points[i].x=s0Points[i].x+noise(s0Points[i].x)*noiseScale*random(-1,1); 
         s0Points[i].y=s0Points[i].y+noise(s0Points[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(s0Points[i].x,s0Points[i].y);
  }   
}
  canvas.curveVertex(s0Points[0].x, s0Points[0].y);
  canvas.curveVertex(s0Points[1].x, s0Points[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
   
/////////LETTER T //////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3+canvas.width/17, canvas.height*2/3); 
  //  fill(0,0,0,1);
//  t.draw();
  RShape cuttingLine1 = RG.getLine(75, -500, 75, 100);
//  canvas.stroke(0,0,0,1);
//  canvas.strokeWeight(5);
  canvas.line(75, -500, 75, 100);
  canvas.ellipse(0,0,19,19);
  
//  stroke(360,0,0,.2);
  canvas.strokeWeight(2);
//  RG.shape(cuttingLine1);//create a shape of the cutting line

    //Get the Points which Make up the text
  tPoints = t.getPoints();

  // Get the intersection points
  RPoint[] tIntPoints = t.getIntersections(cuttingLine1);

  canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.2);
  
  if(tPoints != null && tIntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(tPoints[tPoints.length-1].x, tPoints[tPoints.length-1].y);
  for (int i=0; i<tPoints.length; i++) {
  for (int j=0; j<tIntPoints.length; j++) { 
          
          if (int(tPoints[i].x) <= int(tIntPoints[j].x+50) && int(tPoints[i].x) >= int(tIntPoints[j].x-50) && int(tPoints[i].y) <= int(tIntPoints[j].y+50) && int(tPoints[i].y) >= int(tIntPoints[j].y-50)) {
         tPoints[i].x=tPoints[i].x+noise(tPoints[i].x)*noiseScale*random(-1,1); 
         tPoints[i].y=tPoints[i].y+noise(tPoints[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(tPoints[i].x,tPoints[i].y);
  }   
}
  canvas.curveVertex(tPoints[0].x, tPoints[0].y);
 canvas.curveVertex(tPoints[1].x, tPoints[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
   
   
/////////LETTER R //////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3+canvas.width/8, canvas.height*2/3); 
  //  fill(0,0,0,1);
//  r.draw();
  RShape cuttingLine2 = RG.getLine(5, -500, 3, 100);
  canvas.stroke(0,0,0,1);
  canvas.strokeWeight(5);
  canvas.line(5, -500, 3, 100);
//  canvas.ellipse(0,0,19,19);
  
  
//  stroke(360,0,0,.2);
  canvas.strokeWeight(2);
//  RG.shape(cuttingLine2);//create a shape of the cutting line

    //Get the Points which Make up the text
  rPoints = r.getPoints();

  // Get the intersection points
  RPoint[] rIntPoints = r.getIntersections(cuttingLine2);

  canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.2);
  
  if(rPoints != null && rIntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(rPoints[rPoints.length-1].x, rPoints[rPoints.length-1].y);
  for (int i=0; i<rPoints.length; i++) {
  for (int j=0; j<rIntPoints.length; j++) { 
          
          if (int(rPoints[i].x) <= int(rIntPoints[j].x+50) && int(rPoints[i].x) >= int(rIntPoints[j].x-50) && int(rPoints[i].y) <= int(rIntPoints[j].y+50) && int(rPoints[i].y) >= int(rIntPoints[j].y-50)) {
         rPoints[i].x=rPoints[i].x+noise(rPoints[i].x)*noiseScale*random(-1,1); 
         rPoints[i].y=rPoints[i].y+noise(rPoints[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(rPoints[i].x,rPoints[i].y);
  }   
}
  canvas.curveVertex(rPoints[0].x, rPoints[0].y);
  canvas.curveVertex(rPoints[1].x, rPoints[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
   
   
   /////////LETTER E //////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3+canvas.width/5.25, canvas.height*2/3); 
  //  fill(0,0,0,1);
//  e.draw();
  RShape cuttingLine3 = RG.getLine(-4, -500, 100, 100);
   canvas.stroke(0,0,0,1);
  canvas.strokeWeight(5);
  canvas.line(-3, -500, 100, 100);
//  ellipse(0,0,19,19);
  
//  stroke(360,0,0,.2);
  canvas.strokeWeight(2);
//  RG.shape(cuttingLine3);//create a shape of the cutting line

    //Get the Points which Make up the text
  ePoints = e.getPoints();

  // Get the intersection points
  RPoint[] eIntPoints = e.getIntersections(cuttingLine3);

  canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.2);
  
  if(ePoints != null && eIntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(ePoints[ePoints.length-1].x, ePoints[ePoints.length-1].y);
  for (int i=0; i<ePoints.length; i++) {
  for (int j=0; j<eIntPoints.length; j++) { 
          
          if (int(ePoints[i].x) <= int(eIntPoints[j].x+50) && int(ePoints[i].x) >= int(eIntPoints[j].x-50) && int(ePoints[i].y) <= int(eIntPoints[j].y+50) && int(ePoints[i].y) >= int(eIntPoints[j].y-50)) {
         ePoints[i].x=ePoints[i].x+noise(ePoints[i].x)*noiseScale*random(-1,1); 
         ePoints[i].y=ePoints[i].y+noise(ePoints[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(ePoints[i].x,ePoints[i].y);
  }   
}
  canvas.curveVertex(ePoints[0].x, ePoints[0].y);
  canvas.curveVertex(ePoints[1].x, ePoints[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
  
/////////SECOND S//////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3+canvas.width/3.75, canvas.height*2/3); 
  //  fill(0,0,0,1);
//  s1.draw();
  RShape cuttingLine4 = RG.getLine(-4, -500, 100, 100);
//  ellipse(0,0,19,19);
 canvas.stroke(0,0,0,1);
  canvas.strokeWeight(5);
  canvas.line(-4, -500, 100, 100);
  
//  stroke(360,0,0,.2);
canvas.strokeWeight(2);
//  RG.shape(cuttingLine4);//create a shape of the cutting line

    //Get the Points which Make up the text
  s1Points = s1.getPoints();

  // Get the intersection points
  RPoint[] s1IntPoints = s1.getIntersections(cuttingLine4);
  
 canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.2);
  
  if(s1Points != null && s1IntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(s1Points[s1Points.length-1].x, s1Points[s1Points.length-1].y);
  for (int i=0; i<s1Points.length; i++) {
  for (int j=0; j<s1IntPoints.length; j++) { 
          
          if (int(s1Points[i].x) <= int(s1IntPoints[j].x+50) && int(s1Points[i].x) >= int(s1IntPoints[j].x-50) && int(s1Points[i].y) <= int(s1IntPoints[j].y+50) && int(s1Points[i].y) >= int(s1IntPoints[j].y-50)) {
         s1Points[i].x=s1Points[i].x+noise(s1Points[i].x)*noiseScale*random(-1,1); 
         s1Points[i].y=s1Points[i].y+noise(s1Points[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(s1Points[i].x,s1Points[i].y);
  }   
}
  canvas.curveVertex(s1Points[0].x, s1Points[0].y);
  canvas.curveVertex(s1Points[1].x, s1Points[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
  
  /////////THIRD S//////////////
  canvas.pushMatrix();
  canvas.translate(canvas.width*1/3+canvas.width/3, canvas.height*2/3); 
  //  fill(0,0,0,1);
//  s2.draw();
  RShape cuttingLine5 = RG.getLine(-4, -500, 100, 100);
   canvas.stroke(0,0,0,1);
  canvas.strokeWeight(5);
  canvas.line(-4, -500, 100, 100);
//  ellipse(0,0,19,19);
  
//  stroke(360,0,0,.2);
  canvas.strokeWeight(2);
//  RG.shape(cuttingLine5);//create a shape of the cutting line

    //Get the Points which Make up the text
  s2Points = s2.getPoints();

  // Get the intersection points
  RPoint[] s2IntPoints = s2.getIntersections(cuttingLine5);

  canvas.fill(0,100,0,.9);
  canvas.stroke(0,0,0,.2);
  
  if(s2Points != null && s2IntPoints != null){
  canvas.beginShape(); 
  canvas.curveVertex(s2Points[s2Points.length-1].x, s2Points[s2Points.length-1].y);
  for (int i=0; i<s2Points.length; i++) {
  for (int j=0; j<s2IntPoints.length; j++) { 
          
          if (int(s2Points[i].x) <= int(s2IntPoints[j].x+50) && int(s2Points[i].x) >= int(s2IntPoints[j].x-50) && int(s2Points[i].y) <= int(s2IntPoints[j].y+50) && int(s2Points[i].y) >= int(s2IntPoints[j].y-50)) {
         s2Points[i].x=s2Points[i].x+noise(s2Points[i].x)*noiseScale*random(-1,1); 
         s2Points[i].y=s2Points[i].y+noise(s2Points[i].y)*noiseScale*random(-1,1);
         }
         canvas.vertex(s2Points[i].x,s2Points[i].y);
  }   
}
  canvas.curveVertex(s2Points[0].x, s2Points[0].y);
  canvas.curveVertex(s2Points[1].x, s2Points[1].y);
  canvas.endShape(CLOSE);
}
   canvas.popMatrix();
  
  
canvas.endDraw();

float resizedWidth = (float) canvas.width * ratio;
float resizedHeight = (float) canvas.height * ratio;
//Show the canvas on the screen
image(canvas, (width / 2) - (resizedWidth / 2), 
(height / 2) - (resizedHeight / 2), 
resizedWidth, 
resizedHeight
);
  
  
}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

void keyPressed()
{
  if(key == 's')
  {  
    println("Saving Image");
    canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
    println("Saved Image"); 
  }
}


