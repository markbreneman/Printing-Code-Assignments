PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 20;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

//Centering Artwork on the Canvas
float ratioWidth = 1;
float ratioHeight = 1;
float ratio =1;


void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);

  size(width, height);
  background(0);

  canvas = createGraphics(canvas_width, canvas_height);
  //  println("The Canvas width is"+canvas.width);
  //  println("The Canvas height is"+canvas.height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(3);
  canvas.strokeWeight(5);
  canvas.fill(255);
  //  canvas.rect(canvas.width/2, 0, canvas.width/2, canvas.height);
  //  canvas.line(canvas.width/2, 0, canvas.width/2, canvas.height);
  canvas.strokeWeight(20);
  canvas.strokeCap(SQUARE);
  
  ///Diamond Parameters
//  canvas.noFill();
//  canvas.stroke(3);
  canvas.stroke(3);
  int lowerfacets=3;
  int triangleWidth=450;
  int triangleHeight=500;
  float diamondX = canvas.width/2-triangleWidth*(lowerfacets);
  float diamondY = canvas.height/2.5;
  float xboffset = diamondX;

  facet [] bottomfacets = new facet[lowerfacets];
  facet [] topfacets = new facet[lowerfacets-1];
  facet bottomdiamond;
  facet bottomdiamond2;
  facet bottomdiamond3;

  //Drawing the strip of lowerfacets
  for (int i=0; i<bottomfacets.length; i++) {  
    bottomfacets[i] = new facet(xboffset, diamondY, triangleWidth, triangleHeight);
    xboffset += triangleWidth*2;
    //        if(i%2==0){fill(0); stroke(255);}//playing with black and white
    //        else{fill(255);stroke(0);}
    bottomfacets[i].display();
  }

  //Drawing the strip of upperfacets
  canvas.pushMatrix();
  canvas.translate(diamondX, diamondY);
  canvas.rotate(-PI);
  int xtoffset = -triangleWidth*5;
  for (int i=0; i<topfacets.length; i++) {
    topfacets[i] = new facet(xtoffset, triangleHeight-1, triangleWidth, triangleHeight);
    //    if(i%2==0){fill(0); stroke(255);}//playing with black and white
    //    else{fill(255);stroke(0);}
    topfacets[i].display();
    xtoffset += triangleWidth*2;
  }
  canvas.popMatrix();

  //Drawing the Lower Half of the Diamond
  canvas.pushMatrix();
  canvas.translate(diamondX, diamondY);
  canvas.rotate(-PI);
  bottomdiamond = new facet(0, 0, -triangleWidth*bottomfacets.length, triangleHeight*3.75);
  bottomdiamond.display();
  canvas.popMatrix();

  ///hmmm what about once more set of facets?  
  canvas.pushMatrix();
  canvas.translate(diamondX+triangleWidth, diamondY);
  canvas.rotate(-PI);
  bottomdiamond2 = new facet(0, 0, -triangleWidth*2, triangleHeight*3.75);
  bottomdiamond2.display();
  canvas.popMatrix();

  ///even one more set of facets?...nah to many...
  //  canvas.pushMatrix();
  //  canvas.translate(diamondX+triangleWidth*2, diamondY);
  //  canvas.rotate(-PI);
  //  bottomdiamond3 = new facet(0,0,-triangleWidth,triangleHeight*3);
  //  bottomdiamond3.display();
  //  canvas.popMatrix();

  canvas.pushMatrix();
  canvas.fill(0);
  canvas.stroke(255);
  canvas.pushMatrix();
  canvas.translate(canvas.width/2-116*3, canvas.height/2+triangleHeight*2.5 );
  canvas.scale(3);
  canvas.strokeWeight(8);
  canvas.beginShape();
  canvas.vertex( 116, 1 );
  canvas.bezierVertex( 110, 38, 165, 199, 179, 245);
  canvas.bezierVertex( 193, 290, 199, 341, 224, 302);
  canvas.bezierVertex( 254, 256, 116, 1, 116, 1);
  canvas.bezierVertex( 116, 1, 250, 217, 246, 292);
  canvas.bezierVertex( 236, 499, 12, 452, 0, 310);
  canvas.bezierVertex( -4, 259, 118, -16, 116, 1);
  canvas.endShape( CLOSE );
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

    canvas.save("Form03"+year()+day()+hour()+minute()+".tiff");
}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}



void drawCircles(float x, float y, int cRad)
{
  float x1=x;
  float y1=y;
  //  int circleRadius = canvas.width/4;
  int circleRadius = cRad;
  int numPoints = circleRadius/30+1;


  float angle = 360 / numPoints;
  canvas.beginShape();
  canvas.stroke(3);

  for (int i = 0; i < numPoints + 3; i++)
  {
    canvas.fill(3);
    //    canvas.noFill();
    x1 = cos(radians(i * angle)) * circleRadius*noise(i*3);
    y1 = sin(radians(i * angle)) * circleRadius*noise(i*3);
    canvas.curveVertex(x1, y1);
  }    
  canvas.endShape(CLOSE);
  //
}

