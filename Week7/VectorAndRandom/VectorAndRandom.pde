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
Key Key;

Boolean gridShow=false;
String showing="Not Showing";

void setup() {

  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  //  frameRate(5);
  background(0, 0, 69, 1);

  RG.init(this);
  font = new RFont( "Gotham-Bold.ttf", 55, RFont.CENTER);


  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();


  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5);
  canvas.smooth();

  //  canvas.translate(canvas.width/2,canvas.height/2);
  //  canvas.fill(0,0,100);
  //  canvas.stroke(0,0,0);
  //  canvas.strokeWeight(10);
  //  font.draw("Test",canvas);
  //  

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

  //Row1
  canvas.strokeWeight(canvas.width/400);
  println("The thick Stroke is " + canvas.width/400);

  int j = 49;  
  
  String[] row1={"1","2","3","4","5","6","7","8","9","0","+","delete"};
  String[] row2={"tab","Q","W","E","R","T","Y","U","I","O","P","[","["};
  String[] row3={"caps lock","A","S","D","F","G","H","J","K","L",";","'","return"};
  String[] row4={"shift","Z","X","C","V","B","N","M","\,",".","?","shift"};
  

  for (int i=0; i<=10;i++) {
    String letter= Character.toString(char(j));

    if (i==9) {
      new Key(
      gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30), 
      gridN1.modules[1][17].y, 
      gridN1.modules[1][0].w/2, 
      gridN1.modules[1][0].w/2, 
      "0"
        );
    }

    if (i==10) {
      new Key(
      gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30), 
      gridN1.modules[1][17].y, 
      gridN1.modules[1][0].w/2, 
      gridN1.modules[1][0].w/2, 
      "+"
        );
    }
    else if(i<=8){
    new Key(
    gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30), 
    gridN1.modules[1][17].y, 
    gridN1.modules[1][0].w/2, 
    gridN1.modules[1][0].w/2, 
    letter
      );
    j++;
  }}


  for (int i=0; i<12;i++) {
    new Key(
    gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30)+gridN1.modules[1][0].x/2, 
    gridN1.modules[1][17].y+gridN1.modules[1][0].w/2+30, 
    gridN1.modules[1][0].w/2, 
    gridN1.modules[1][0].w/2, 
    "w"
      );
  }

  for (int i=0; i<11;i++) {
    canvas.rect(
    gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30)+gridN1.modules[1][0].x/1.5, 
    gridN1.modules[1][17].y+gridN1.modules[1][0].w+60, 
    gridN1.modules[1][0].w/2, 
    gridN1.modules[1][0].w/2, 
    20, 20, 20, 20
      );
  }

  for (int i=0; i<10;i++) {
    canvas.rect(
    gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-30)+gridN1.modules[1][0].x/1.25, 
    gridN1.modules[1][17].y+gridN1.modules[1][0].w*1.85, 
    gridN1.modules[1][0].w/2, 
    gridN1.modules[1][0].w/2, 
    20, 20, 20, 20
      );
  }
}

void draw() {


  if (gridShow==true)
  {
    gridN1.display();
    gridN2.display();
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

