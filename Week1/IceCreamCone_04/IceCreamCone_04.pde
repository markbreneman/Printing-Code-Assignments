PGraphics canvas;

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
  canvas.background(0);

  //IceCream Parameters  
  float iceCreamDia=700;
  float iceCreamRad = iceCreamDia/2;
  float centerX=canvas_width/2;
  float centerY=canvas_height/2-iceCreamRad;

  // Scoop Distribution
  float h = (sqrt(3)/2)*(iceCreamDia);
  float theta=-90;//In degrees
  //  float r = (2*h/3);//tangency
  float r =iceCreamDia/2.5;//radius of Eq.Triangle

    //Ice Cream
    canvas.pushMatrix();
    canvas.translate(centerX, centerY);
    canvas.fill(0);
    canvas.stroke(255);
    canvas.strokeWeight(iceCreamDia/12);
    for (float i = 0; i<3; i++) {
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
    canvas.fill(255);
    
    //Cone Parameters
    float noTriangles=6;
    float triHorz=iceCreamDia*.75;
    float triVert=iceCreamDia*2;
    float coneAngle=degrees(atan((triVert)/(triHorz)));//In Degrees
    float triTop=triHorz*2-(iceCreamDia/12)*2;
    float offset=triTop/noTriangles;
    
    for (float j=0; j<noTriangles; j++) {  
      canvas.triangle(
      -triHorz, iceCreamDia*.15, 
      triHorz-(j*offset), iceCreamDia*.15, 
      0-j*offset/2, triVert-j*tan(radians(coneAngle))*offset/2);
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

  canvas.save("IceCreamCone04_"+year()+day()+hour()+minute()+".png");
}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

