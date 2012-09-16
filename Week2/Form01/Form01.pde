PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 20;
float paper_height = 17;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() {

  
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  
  float waveWidth = canvas_width/2;
  float waveHeight=200;
  

  size(width, height);
  background(255);

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(0);
  for(int i = 0; i < 900; i += waveWidth) {
    canvas.beginShape();
    canvas.vertex(i, canvas_height/2);    // 1st vertex
    canvas.fill(255,0,0)
    canvas.ellipse(i,canvas_height/2);//1st vertex
    noFill();
    canvas.bezierVertex(i + waveWidth/4, 0,                  // cx1, cy1
                 i + waveWidth/4, waveHeight,         // cx2, cy2
                 i + waveWidth/2, waveHeight);        // 2nd vertex
    canvas.fill(255,0,0)
    canvas.ellipse(i,canvas_height/2);
    
    canvas.bezierVertex(i + (3 * waveWidth/4), waveHeight,   // cx1, cy1
                 i + (3 * waveWidth/4), 0,            // cx2, cy2
                 i + waveWidth, 0);                   // 3rd vertex
    canvas.endShape();
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

//  canvas.save("Form01_"+year()+day()+hour()+minute()+".png");
}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

