PGraphics canvas;
int radius;
//Dimensions of A4 Paper in Inches
float paper_width = 8.3;
float paper_height = 11.7;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels
int canvas_width = 2480;
int canvas_height = 3508;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() {

  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);

  size(width, height);
  background(0);

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
    canvas.background(255);
  
    //IceCream Parameters  
    int iceCreamDia=700;
    int iceCreamRad = iceCreamDia/2;
    int centerX=canvas_width/2;
    int centerY=canvas_height/2-iceCreamRad;
    
    // Scoop Distribution
    float h = (sqrt(3)/2)*(iceCreamDia);
    float theta=-90;//In degrees
    //  float r = (2*h/3);//tangency
    float r =iceCreamDia/2.5;//radius of EQ.Triangle
  
//Ice Cream
    canvas.pushMatrix();
    canvas.translate(centerX, centerY);
    canvas.fill(255);
    canvas.stroke(0);
    canvas.strokeWeight(iceCreamDia/12);
    for (int i = 0; i<3; i++) {
      float x = r * cos(radians(theta));
      float y = r * sin(radians(theta));
      canvas.ellipse(x, y, iceCreamDia, iceCreamDia);
      theta += 120;
    }
    canvas.popMatrix();
    

    //Cone
    canvas.pushMatrix();
    canvas.translate(centerX, centerY+r);
    canvas.strokeWeight(iceCreamDia/12);
    canvas.stroke(0);
    canvas.fill(0);
    canvas.triangle(
    -iceCreamDia*.75, iceCreamDia*.15,
    iceCreamDia*.75, iceCreamDia*.15, 
    0, iceCreamDia*2);
    canvas.popMatrix();
    
    
  
//    //Masking
//    canvas.pushMatrix();
//    canvas.translate(centerX, centerY+r);
//    canvas.strokeWeight(iceCreamDia/12);
//    canvas.stroke(0);
//    canvas.fill(0);
//    canvas.rectMode(CORNERS);
//    canvas.rect(-.5*r,iceCreamDia*.1-iceCreamDia/12, .5*r,-.35*h);
//    canvas.popMatrix();    
    
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  //Show the canvas on the screen
  image(canvas, (width / 2) - (resizedWidth / 2), 
  (height / 2) - (resizedHeight / 2), 
  resizedWidth, 
  resizedHeight
    );

  canvas.save("IceCreamCone03_"+year()+day()+hour()+minute()+".png");
}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

