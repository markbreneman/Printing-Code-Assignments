PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 22;
float paper_height = 17;
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
int gridPMWidth=200;
int gridPMHeight=200;


Pattern p; 

color c1;  
color c2;  
color c3;  
color c4;
color c5;
color c6;

//Array Colors;
color[] Colors;

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

  //DEFINE COLORS **AFTER SWITCHING TO HSB MODE**
  //REDS
  c1 = color(375, 87, 92);
  c2 = color(5, 64, 94);
  c3 = color(354, 83, 74); 
  //GREENS 
  c4 = color(151,94,21);  
  c5 = color(128, 69, 70);
  c6 = color(62.85, 19.95, 95.41);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(55, 9, 99, 1);
  canvas.smooth();
  
  //Grid - Main grid
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT  
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth);
  canvas.strokeWeight(10);
//  canvas.stroke(221, 81, 93.81, .25);
//  grid.display();
  Module startModule = grid.modules[0][0];
  
  int cubeSize = 45;
  p = new Pattern(startModule.x,startModule.y+cubeSize*2, startModule.w-gridPMWidth*2, startModule.h-gridPMHeight*2, cubeSize);
  canvas.noStroke();
  p.display();
  
  
  
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

void draw() {
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
    canvas.save("MakerBotWrappingPaper_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
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

