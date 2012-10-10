PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 11;
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
  
  
  //Grid 1
  // create a grid object as a container for our grid variables
  int grid1Cols=7;
  int grid1Rows=7;
  ModularGrid grid1 = new ModularGrid(grid1Cols, grid1Rows, 200, 100); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN
  
  for(int i=0; i<grid1Rows; i++){
    for(int j=0; j<grid1Cols; j++){
    Module module1 = grid1.modules[i][j];
//  canvas.fill(0,0,random(40,100),1);
  canvas.noFill();
  new Hexagon(module1.cX,module1.cY,module1.w);
   }}
  
  
  //Grid 2  
  int grid2Cols=7;
  int grid2Rows=7;
  ModularGrid grid2 = new ModularGrid(grid2Cols, grid2Rows,200, 100);
  
  canvas.pushMatrix();
  canvas.translate(-100,-150);

  for(int k=0; k<grid2Rows; k++){
    for(int l=0; l<grid2Cols; l++){
    Module module2 = grid2.modules[k][l];
//  canvas.fill(0,0,random(60,100),1);
    canvas.noFill();
  new Hexagon(module2.cX,module2.cY,module2.w);
   }}
   canvas.popMatrix();
  

  //Grid 3  
  int grid3Cols=7;
  int grid3Rows=7;
  ModularGrid grid3 = new ModularGrid(grid3Cols, grid3Rows,200, 100);
  
  canvas.pushMatrix();
  canvas.translate(-200,-300);

  for(int m=0; m<grid3Rows; m++){
    for(int n=0; n<grid3Cols; n++){
    Module module3 = grid3.modules[m][n];
//  canvas.fill(0,0,random(80,100),1);
    canvas.noFill();
  new Hexagon(module3.cX,module3.cY,module3.w);
   }}
   canvas.popMatrix();  
  
  
  
  
  if (gridShow==true)
  {
    canvas.stroke(0, 100, 100, 20);
    grid1.display();
    grid2.display(); 
    grid3.display(); 
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
