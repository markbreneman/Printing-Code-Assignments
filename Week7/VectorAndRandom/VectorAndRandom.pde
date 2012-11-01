import toxi.geom.*;
import geomerative.*;

PGraphics canvas;
//PFont font;
RFont font;


//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 22;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

ModularGrid grid;
int gridCols=1;
int gridRows=1;
int gridGutter=0;
int gridPMWidth=120;
int gridPMHeight=120;

ModularGrid gridN1;
int gridN1Cols=20;
int gridN1Rows=20;
int gridN1Gutter=0;
int gridN1PMWidth=0;
int gridN1PMHeight=0;

ModularGrid gridN2;
Monitor monitor;
Keyboard keyboard;
ArrayList keysArray;
Key Key;
//Key A;
color c1;  
color c2;  
color c3;  
color c4;
color c5;
color c6;

Boolean gridShow=false;
String showing="Not Showing";

void setup() {

  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 69, 1);
  //DEFINE FONT
  RG.init(this);
  font = new RFont( "Gotham-Bold.ttf", 55, RFont.CENTER);
  //DEFINE COLORS **AFTER SWITCHING TO HSB MODE**
  c1 = color(352.09, 86, 92.52);  
  c2 = color(62.85, 19.95, 95.41);  
  c3 = color(97.62, 18.55, 73.42);  
  c4 = color(152.57, 11.25, 75.99);
  c5 = color(96.04, 17.83, 47.92);
  c6 = color(0,0,3);

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5);
  canvas.smooth();

  //Grid - Main grid
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT  
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight);  

  //Nested Grid - Grid for overall artwork
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]); 

  //Monitor Grid for Letter Placement
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, STARTX, STARTY, WIDTH, HEIGHT 
  gridN2 = new ModularGrid(
  20, 
  20, 
  0, 
  0, 
  0, 
  gridN1.modules[10][0].x+gridN1.modules[10][0].w/2, 
  gridN1.modules[10][1].h+gridPMHeight, 
  gridN1.modules[10][0].w*8.5, 
  gridN1.modules[10][0].h*5);

  canvas.noStroke();
  //Display the Print Area
  grid.display();  
  //Draw the Monitor
  monitor=new Monitor();
  keyboard=new Keyboard();
//  A = new Key(1000,1000,1000,1000,"j");
}

void draw() {
  canvas.background(0, 0, 100);
  monitor.display();
  keyboard.display();
//  A.display();
//  println(hex(A.c1));
//  
  if (gridShow==true)
  {
    canvas.strokeWeight(10);
    canvas.stroke(360, 100, 100);
    gridN1.display();
    gridN2.display();
//    A.keyColor=color(62.85, 19.95, 95.41);
   
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
    canvas.save("VectorandRandom_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
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
}


void mousePressed() {
}

