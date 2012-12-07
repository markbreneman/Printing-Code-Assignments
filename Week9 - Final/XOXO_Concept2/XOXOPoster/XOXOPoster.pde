PGraphics canvas;
PFont font1, font2, font3;
PShape imgLogo;

//Dimensions of Plotter Paper in Inches
float paper_width = 4;
float paper_height = 6;
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
//String  title, tagline, details;
//PVector titlePos, detailsPos;
//int titleSize, taglineSize, detailsSize;
//int rectWidth, rectHeight;

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 800;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  //FONTS AND ARTWORK
  //  font1 = loadFont("Tungsten-Medium-48.vlw");
  //  font2 = loadFont("Atrament-Medium-48.vlw");
  //  font3 = loadFont("Atrament-MediumItalic-48.vlw");

  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 255, 1);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.smooth();

  //SETUP COLORS
  colors = new ArrayList();
  c1 = color(346.55, 10.65, 13.75); // Black for print
  colors.add(c1);
  c2 = color(0, 0, 100); // White for print
  colors.add(c2);
  c3 = color(196, 100, 93); //Deeper Blue
  colors.add(c3);
  c4 = color(199, 59, 100); // Blue
  colors.add(c4); 
  c5 = color(267.72, 60.66, 59.07);// Purple
  colors.add(c5);
  c6 = color(279, 100, 62);//Deeper Purple
  colors.add(c6);

  //SETUP TRIANGLE OBJECTS
  triSize=100;
  triHeight=sqrt(3)/2*(triSize);
  triangleObjects= new ArrayList();
  color c7 = colors.get(int(random(2, 6)));
  //RIGHTPOINT TRIANGLES
  for (int j = 0;j<canvas.width; j++) {
    for (int i = 0; i<canvas.height; i++) {  
//    for (int j = 0;j<5; j++) {
//    for (int i = 0; i<5; i++) {
      PVector startPoint=new PVector(0,0);//Initialized Locally

      //////COLOR SELECTIONS
      //EVEN COL AND ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(4);
      }
      //EVEN COL AND ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(2);
      }
      //ODD COL AND EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(4);
      }
      //ODD COL AND ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(3);
      }
      ///////STAGGER COL POSITIONS
      if(j%2==0){startPoint = new PVector(0+j*triHeight,0+i*triSize);}
      else if(j%2!=0){startPoint = new PVector(0+j*triHeight, -triSize/2+i*triSize);}
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 0);
      triangleObjects.add(tmpTri);
    }
  }
  //LEFTPOINT TRIANGLES
  for (int j = 0;j<canvas.width; j++) {
    for (int i = 0; i<canvas.height; i++) {
//  for (int j = 0;j<3; j++) {
//    for (int i = 0; i<6; i++) {
      
      PVector startPoint=new PVector(0,0);//Initialized Locally
      
      //////COLOR SELECTIONS
      //EVEN COL & ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(4);
      }
      //EVEN COL & ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(5);
      }
      //ODD COL & EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(2);
      }
      //ODD COL & ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(3);
      }

      ///////STAGGER COL POSITIONS
      if(j%2==0){startPoint = new PVector(triHeight+j*triHeight,-triSize/2+i*triSize);}
      else if(j%2!=0){startPoint = new PVector(triHeight+j*triHeight, 0+i*triSize);}
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 1);
      triangleObjects.add(tmpTri);
    }
  }
  //SETUP COPY
  //  title = "XOXO";
  //  titlePos=new PVector(random(300, canvas.width-textWidth(title)), random(125, canvas.height));
  //  titleSize=1510;
  //
  //  tagline = "An arts and technology festival"+"\n"+"celebrating disruptive creativity.";
  //  taglineSize=200;
  //
  //  details = "YALE UNION CONTEMPORARY | PORTLAND, OR | SEPTEMBER 13-16 2013";
  //  //  detailsPos=new PVector(gridN1.modules[0][0].x, gridN1.modules[0][gridN1Rows-1].y+gridN1.modules[0][gridN1Rows-1].h*3);
  //  detailsSize=235;

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
    triangleObjects.get(i).display();
  }

  //DRAWING COPY

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

