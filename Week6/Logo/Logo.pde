PGraphics canvas;
PFont font;

//Dimensions of Plotter Paper in Inches
float paper_width = 20;
float paper_height = 10;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

Boolean gridShow=false;
String showing="Not Showing";


void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 800;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  font = loadFont("ChaletBook-48.vlw");
  
  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  //  frameRate(5);
  background(0,0,69,1);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();
  
 
}

void draw() {
 
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0,0,100, .5);
  canvas.smooth();
 
  
   //Grid 1 - Divide up the Print into 3's
  // create a grid object as a container for Logos
  int gridCols=3;
  int gridRows=1;
  ModularGrid grid = new ModularGrid(gridCols, gridRows, 100, 200, 600); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT
  
  //Nested Grids
  ModularGrid gridN1 = new ModularGrid(10, 10, 10, 0, 0, grid.modules[0][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  
//  rect(a, b, c, d, r)
  canvas.fill(196.45,100,93.81,1);
  new SpeechBubble(gridN1.modules[0][0].x, gridN1.modules[0][4].y, gridN1.modules[0][0].w*2, gridN1.modules[0][0].h*3, 80.0, grid.modules[0][0]);
  
  canvas.fill(196.45,100,93.81,.5);
  new SpeechBubble(gridN1.modules[4][0].x, gridN1.modules[0][2].y, gridN1.modules[0][0].w*(random(2,5)), gridN1.modules[0][0].h*(random(2,2)), 80.0, grid.modules[0][0]);
  
  canvas.fill(196.45,100,93.81,.25);
  new SpeechBubble(gridN1.modules[9][0].x, gridN1.modules[0][9].y, gridN1.modules[0][0].w*(random(2,5)), gridN1.modules[0][0].h*(random(2,2)), 80.0, grid.modules[0][0]);
  
  canvas.fill(0,0,100,1);
  canvas.textAlign(CENTER);
  canvas.textFont(font,300);
  canvas.text("skype", grid.modules[0][0].w/2, grid.modules[0][0].h/2);
  
  
  ModularGrid gridN2 = new ModularGrid(10, 10, 10, 0, 0, grid.modules[1][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  canvas.fill(87.99,65,73.01,1);
  new SpeechBubble(gridN2.modules[0][0].x, gridN2.modules[0][4].y, gridN2.modules[0][0].w*2, gridN2.modules[0][0].h*3, 80.0, grid.modules[1][0]);
  
  canvas.fill(87.99,65,73.01,.5);
  new SpeechBubble(gridN2.modules[4][0].x, gridN2.modules[0][2].y, gridN2.modules[0][0].w*(random(2,5)), gridN2.modules[0][0].h*(random(2,2)), 80.0, grid.modules[1][0]);
  
  canvas.fill(87.99,65,73.01,.25);
  new SpeechBubble(gridN2.modules[9][0].x, gridN2.modules[0][9].y, gridN2.modules[0][0].w*(random(2,5)), gridN2.modules[0][0].h*(random(2,2)), 80.0, grid.modules[1][0]);
  
  
  ModularGrid gridN3 = new ModularGrid(10, 10, 10, 0, 0, grid.modules[2][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
    canvas.fill(215.23,3.32,52.03,1);
  new SpeechBubble(gridN3.modules[0][0].x, gridN3.modules[0][4].y, gridN3.modules[0][0].w*2, gridN3.modules[0][0].h*3, 80.0, grid.modules[2][0]);
  
  canvas.fill(215.23,3.32,52.03,1);
  new SpeechBubble(gridN3.modules[4][0].x, gridN3.modules[0][2].y, gridN3.modules[0][0].w*(random(2,5)), gridN3.modules[0][0].h*(random(2,2)), 80.0, grid.modules[2][0]);
  
  canvas.fill(215.23,3.32,52.03,1);
  new SpeechBubble(gridN3.modules[9][0].x, gridN3.modules[0][9].y, gridN3.modules[0][0].w*(random(2,5)), gridN3.modules[0][0].h*(random(2,2)), 80.0, grid.modules[2][0]);
  
  
  //Show the Compartmentalized logo space
  grid.display();
  
  if (gridShow==true)
  {
    gridN1.display();
    gridN2.display();
    gridN3.display();
    
  }

  if (gridShow==false && showing.equals("Not Showing"))
  {
//  canvas.stroke(0,0,0,.3);
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
  
 
}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}

void keyPressed()
{
  if (key == 's')
  {  
    println("Saving Image");
    canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
    println("Saved Image");
  }

  if (key == 'g')
  {  
    gridShow=!gridShow;
    if (showing.equals("Not Showing")) {
      showing="Showing Grid";
    }
    else if (showing.equals("Showing Grid")) {
      showing="Not Showing";
    }
  }
  println(showing);
}
