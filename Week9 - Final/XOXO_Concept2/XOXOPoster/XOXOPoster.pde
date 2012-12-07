PGraphics canvas;
PFont font1, font2, font3;
PShape imgLogo;

//Dimensions of Plotter Paper in Inches
float paper_width = 17;
float paper_height = 25;
float paper_ratio = paper_height/paper_width;

//Dimensions of an Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

//////_____GRID VARIABLES_____//////////////
ModularGrid grid, gridN1;
int gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight;

Boolean gridShow=false;
String showing="Not Showing";

//////_____CONTROL P5 Addition_____//////////////
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;
Slider2D stripesTarget;
Slider2D titleTarget;
Slider S1, S2, S3, S4, S5;

//////_____GEOMETRY DETAILS____//////////////
float triSize, triHeight;
ArrayList<Triobject> triangleObjects; 
Triobject tmpTri;

/////______COLORS______//////////
ArrayList<Integer> colors;
color c1, c2, c3, c4, c5, c6;

/////______COPY______//////////
String  title, tagline, details;
PVector titlePos, detailsPos;
int titleSize, taglineSize, detailsSize;
int rectWidth, rectHeight;

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 500;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 255, 1);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.smooth();

  setupParams();//PULL IN FONTS,ARTWORK,COPY & COLORS

  //SETUP TRIANGLE OBJECTS
  triSize=300;
  triHeight=sqrt(3)/2*(triSize);
  triangleObjects= new ArrayList();
  color c7 = colors.get(int(random(2, 6)));
  //Calculate Max Objects per Width/Height  
  //  println("w increments" + canvas.width/triSize);
  //  println("h increments" + canvas.height/triSize);

  //RIGHTPOINT TRIANGLES  
  for (int j = 0;j<grid.modules[0][0].w/triSize+11; j++) {
    for (int i = 0; i<grid.modules[0][0].h/triSize+11; i++) {  
      PVector startPoint=new PVector(0, 0);//Initialized Locally

      //////COLOR SELECTIONS
      //EVEN COL AND ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(3);
      }
      //EVEN COL AND ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(4);
      }
      //ODD COL AND EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(4);
      }
      //ODD COL AND ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(4);
      }
      ///////STAGGER COL POSITIONS
      if (j%2==0) {
        startPoint = new PVector(grid.modules[0][0].x+j*triHeight, grid.modules[0][0].y+i*triSize);
      }
      else if (j%2!=0) {
        startPoint = new PVector(grid.modules[0][0].x+j*triHeight, grid.modules[0][0].y-triSize/2+i*triSize);
      }
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 0);
      triangleObjects.add(tmpTri);
    }
  }
  //LEFTPOINT TRIANGLES
  for (int j = 0;j<grid.modules[0][0].w/triSize+11; j++) {
    for (int i = 0; i<grid.modules[0][0].h/triSize+11; i++) {

      PVector startPoint=new PVector(0, 0);//Initialized Locally

      //////COLOR SELECTIONS
      //EVEN COL AND ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(2);
      }
      //EVEN COL AND ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(5);
      }
      //ODD COL AND EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(3);
      }
      //ODD COL AND ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(5);
      }
      ///////STAGGER COL POSITIONS
      if (j%2==0) {
        startPoint = new PVector(grid.modules[0][0].x+triHeight+j*triHeight, grid.modules[0][0].y-triSize/2+i*triSize);
      }
      else if (j%2!=0) {
        startPoint = new PVector(grid.modules[0][0].x+triHeight+j*triHeight, grid.modules[0][0].y+i*triSize);
      }
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 1);
      triangleObjects.add(tmpTri);
    }
  }



  //SETUP CONTROL P5 CONTROLS
//  controlP5 = new ControlP5(this);
//  controlWindow = controlP5.addControlWindow("controlP5window", 500, 225);
//  controlWindow.hideCoordinates();
//  controlWindow.setTitle("Controls");
//  initControls();
}

void draw() {
  //  canvas.background(0, 0, 100);
  canvas.noStroke();

  //SHOW THE GRID OF CHAIRS
  canvas.noFill();

  //DRAWING THE GEOMETRY
  for (int i = 0; i<triangleObjects.size(); i++) {
    triangleObjects.get(i).update(triSize);
    triangleObjects.get(i).display();
  }

  //DRAWING COPY
   canvas.noStroke();
  canvas.fill(c5);
  //MASKING RECTANGLE: HARDCODED -10 & 1.5 ARE TO ENSURE STROKE COVERAGE
  canvas.textFont(font1, titleSize); 
  canvas.fill(c1);
  canvas.text(title, titlePos.x, titlePos.y); 
  titlePos.x = random(grid.modules[0][0].x,grid.modules[0][0].x+grid.modules[0][0].w);
  titlePos.y = random(grid.modules[0][0].y,grid.modules[0][0].h+grid.modules[0][0].h);
  
  canvas.textFont(font3, taglineSize);
  canvas.text(tagline, titlePos.x, titlePos.y+taglineSize);

  canvas.textFont(font1, detailsSize);
  canvas.text(details, detailsPos.x, detailsPos.y);



  ///MASKING EXCESS PATTERN
  canvas.fill(c2);
  canvas.rect(0, 0, canvas.width, grid.modules[0][0].y);//top
  canvas.rect(0, 0, grid.modules[0][0].x, canvas.height);//left
  canvas.rect(canvas.width, 0, -grid.modules[0][0].x, canvas.height);//right
  canvas.rect(0, grid.modules[0][0].y+grid.modules[0][0].h, canvas.width, 100);//bottom

  if (gridShow==true)
  {
    canvas.strokeWeight(10);
    canvas.stroke(221, 81, 93.81, .25);
    canvas.noFill();
    grid.display();
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
    println(triangleObjects.size());
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

