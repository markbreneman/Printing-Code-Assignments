PGraphics canvas;
IceCreamCone [] cone = new IceCreamCone[1];

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
    
    //Ice Cream Driving parameters
    int iceCreamDia = 1000;
    int iceCreamRad = iceCreamDia/2;
    int centerX=canvas_width/2;
    int centerY=canvas_height/2-iceCreamRad; 
    
    //Calling IceCream Cone Displaying
    for (int i=0; i<cone.length; i++) {
      cone[i] = new IceCreamCone(iceCreamDia, centerX, centerY);
      cone[i].display();
    }
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


