PGraphics canvas;
PFont font;

//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 25;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int gridCols=1;
int gridRows=1;
int gridGutter=100;
int gridPMWidth=450;
int gridPMHeight=600;

int gridN1Cols=16;
int gridN1Rows=25;
int gridN1Gutter=30;
int gridN1PMWidth=0;
int gridN1PMHeight=0;

Boolean gridShow=false;
String showing="Not Showing";

//////_____CONTROL P5 Addition_____//////////////
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;
//DropDown list for Canvas Selection
DropdownList canvasSelector;
String selectedCanvas;
//Positional 2D Slider
Slider2D speechBubble1;
//Height and Width Sliders
Slider S1;
Slider S2;
ModularGrid grid;
ModularGrid gridN1;
boolean selected1;
boolean selected2; 

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  font = loadFont("Tungsten-Medium-48.vlw");

  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 255, 1);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  //SETUP CONTROL P5 CONTROLS
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window", 400, 600);
  controlWindow.hideCoordinates();
  controlWindow.setTitle("Logo Controls");
  initControls();  
  selected1 = false;
  selected2 = false;

  

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
//  canvas.background(0, 0, 100, .5);
  
  canvas.smooth();

  //Grid 1 - Manuscript Grid
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight);  

  //Nested Grids for Chairs
   // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]);
 
}

void draw() {
  canvas.background(0, 0, 100 );
  canvas.noStroke();
      
  //Show the manuscript grid
  gridN1.display();

  if (gridShow==true)
  {
    canvas.strokeWeight(10);
    canvas.stroke(221, 81, 93.81, .25);
    canvas.noFill();
    grid.display();
  }

  if (gridShow==false && showing.equals("Not Showing"))
  {
    canvas.stroke(0, 0, 0, .3);
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
  //SAVE IMAGES OUT
  if (key == 's')
  {  
    println("Saving Image");
    canvas.save("XOXO_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
    println("Saved Image");
  }

  //SHOW GRID
  if (key == 'g')
  {  
    gridShow=!gridShow;
    if (showing.equals("Not Showing")) {
      showing="Showing Grid";
      println(showing);
    }
    else if (showing.equals("Showing Grid")) {
      showing="Not Showing";
      println(showing);
    }
  }

  //CONTROL P5 HIDE-SHOW 
  if (key==',') controlP5.window("controlP5window").hide();
  if (key=='.') controlP5.window("controlP5window").show();
}




