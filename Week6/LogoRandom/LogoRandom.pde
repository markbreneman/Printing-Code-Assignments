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

int gridCols=3;
int gridRows=1;
int gridGutter=100;
int gridPMWidth=200;
int gridPMHeight=600;

int gridN1Cols=20;
int gridN1Rows=20;
int gridN1Gutter=10;
int gridN1PMWidth=0;
int gridN1PMHeight=0;

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
    canvas.save("LOGO_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
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
    }
  }
}

void mousePressed(){
    
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0,0,100, 1);
  canvas.smooth();
 
  
   //Grid 1 - Divide up the Print into 3's
  // create a grid object as a container for Logos 
  ModularGrid grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT 
  
  //Nested Grid 1
  ModularGrid gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter,gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  canvas.noStroke();
  canvas.fill(196.45,100,93.81,1);
   new SpeechBubble(gridN1.modules[int(random(0,12))][int(random(0,7))].x,gridN1.modules[int(random(0,12))][int(random(0,12))].y, gridN1.modules[0][0].w*(int(random(10,17))), gridN1.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[0][0], int(random(1,6)));
  
  canvas.fill(196.45,100,93.81,.5);
   new SpeechBubble(gridN1.modules[int(random(0,12))][int(random(0,7))].x,gridN1.modules[int(random(0,12))][int(random(0,12))].y, gridN1.modules[0][0].w*(int(random(10,17))), gridN1.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[0][0],int(random(1,6)));

  canvas.fill(196.45,100,93.81,.25);
  new SpeechBubble(gridN1.modules[int(random(0,12))][int(random(0,7))].x,gridN1.modules[int(random(0,12))][int(random(0,12))].y, gridN1.modules[0][0].w*(int(random(10,17))), gridN1.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[0][0], int(random(1,6)));
  
  canvas.fill(0,0,100,1);
  canvas.textAlign(CENTER);
  canvas.textFont(font,650);
  canvas.text("skype", grid.modules[0][0].w/2+gridPMWidth, grid.modules[0][0].h/2+gridPMHeight);
  
    
  //Nested Grid 2
  ModularGrid gridN2 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter,gridN1PMWidth, gridN1PMHeight, grid.modules[1][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  canvas.noStroke();
//  rect(a, b, c, d, r)
   canvas.fill(87.99,65,73.01,1);
//  new SpeechBubble(gridN2.modules[int(speechBubble1.arrayValue()[0])][0].x, gridN2.modules[0][int(speechBubble1.arrayValue()[1])].y, gridN2.modules[0][0].w*speechWidth1, gridN2.modules[0][0].h*speechHeight1, 80.0, grid.modules[1][0]);
   new SpeechBubble(gridN2.modules[int(random(0,12))][int(random(0,7))].x,gridN2.modules[int(random(0,12))][int(random(0,12))].y, gridN2.modules[0][0].w*(int(random(10,17))), gridN2.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[1][0],int(random(1,6)));
  
   canvas.fill(87.99,65,73.01,.5);
//  new SpeechBubble(gridN2.modules[int(speechBubble2.arrayValue()[0])][0].x, gridN2.modules[0][int(speechBubble2.arrayValue()[1])].y, gridN2.modules[0][0].w*speechWidth2, gridN2.modules[0][0].h*speechHeight2, 80.0, grid.modules[1][0]);
   new SpeechBubble(gridN2.modules[int(random(0,12))][int(random(0,7))].x,gridN2.modules[int(random(0,12))][int(random(0,12))].y, gridN2.modules[0][0].w*(int(random(10,17))), gridN2.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[1][0],int(random(1,6)));

   canvas.fill(87.99,65,73.01,.25);
//  new SpeechBubble(gridN2.modules[int(speechBubble3.arrayValue()[0])][0].x, gridN2.modules[0][int(speechBubble3.arrayValue()[1])].y, gridN2.modules[0][0].w*speechWidth3, gridN2.modules[0][0].h*speechHeight3, 80.0, grid.modules[1][0]);
  new SpeechBubble(gridN2.modules[int(random(0,12))][int(random(0,7))].x,gridN2.modules[int(random(0,12))][int(random(0,12))].y, gridN2.modules[0][0].w*(int(random(10,17))), gridN2.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[1][0],int(random(1,6)));
  
  canvas.fill(0,0,100,1);
  canvas.textAlign(CENTER);
  canvas.textFont(font,650);
  canvas.text("skype", 3*grid.modules[1][0].w/2+gridPMWidth+gridGutter, grid.modules[1][0].h/2+gridPMHeight);

//     
  
//Nested Grid 3
  ModularGrid gridN3 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter,gridN1PMWidth, gridN1PMHeight, grid.modules[2][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  canvas.noStroke();

  canvas.fill(215.23,3.32,52.03,1); 
  new SpeechBubble(gridN3.modules[int(random(0,12))][int(random(0,7))].x,gridN3.modules[int(random(0,12))][int(random(0,12))].y, gridN3.modules[0][0].w*(int(random(10,17))), gridN3.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[2][0],int(random(1,6)));
  
  canvas.fill(215.23,3.32,52.03,.5); 
  new SpeechBubble(gridN3.modules[int(random(0,12))][int(random(0,7))].x,gridN3.modules[int(random(0,12))][int(random(0,12))].y, gridN3.modules[0][0].w*(int(random(10,17))), gridN3.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[2][0],int(random(1,6)));

  canvas.fill(215.23,3.32,52.03,.25); 
  new SpeechBubble(gridN3.modules[int(random(0,12))][int(random(0,7))].x,gridN3.modules[int(random(0,12))][int(random(0,12))].y, gridN3.modules[0][0].w*(int(random(10,17))), gridN3.modules[0][0].h*(int(random(7,10))), 80.0, grid.modules[2][0],int(random(1,6)));
  
  canvas.fill(0,0,100,1);
  canvas.textAlign(CENTER);
  canvas.textFont(font,650);
  canvas.text("skype", 5*grid.modules[2][0].w/2+gridPMWidth+gridGutter*2, grid.modules[2][0].h/2+gridPMHeight);

  
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
  canvas.stroke(0,0,0,.3);
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


