PGraphics canvas;
PFont font1, font2, font3;
PShape imgLogo1, imgLogo2;

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
int gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight;

Boolean gridShow=false;
String showing="Not Showing";

//////_____CONTROL P5 Addition_____//////////////
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;
Slider2D stripesTarget;
Slider2D nameTarget;
Slider S1, S2, S3, S4, S5;

//////_____STRIPE DETAILS____//////////////
PVector target;
Stripes stripes;
/////______COLORS______//////////
color c1, c2, c3, c4, c5, c6;

/////______COPY______//////////
String  title, name, association, details;
PVector titlePos, namePos, detailsPos;
int titleSize, nameSize, associationSize, detailsSize;
int rectWidth, rectHeight;

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 400;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
  //FONTS AND ARTWORK
  font1 = loadFont("Tungsten-Medium-48.vlw");
  font2 = loadFont("Atrament-Medium-48.vlw");
  font3 = loadFont("Atrament-MediumItalic-48.vlw");

  imgLogo1 = loadShape("logo-blue.svg");
  imgLogo2 = loadShape("logo.svg");

  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 255, 1);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.smooth();

  //SETUP MANUSCRIPT GRID
  gridCols=1;
  gridRows=1;
  gridGutter=100;
  gridPMWidth=80;
  gridPMHeight=200;

  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight, .5, 200);  

  //NESTED GRID OF "CHAIRS"
  gridN1Cols=16;
  gridN1Rows=25;
  gridN1Gutter=15;
  gridN1PMWidth=0;
  gridN1PMHeight=0;
  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]);

  //SETUP STRIPES
  c1 = color(346.55, 10.65, 13.75); // Black for print
  c2 = color(0, 0, 100); // White for print
  //  c2 = color(211.62, .42, 94.94); // White for print
  c3 = color(267.72, 60.66, 59.07); // Purple
  c4 = color(199.24, 58.84, 92.96); // Blue 
  c5 = color(50, 5, 100); //Off White
  //  c6 = color(253, 60, 66);//Deeper Purple
  c6 = color(279, 100, 62);//Deeper Purple
  target = new PVector(random(0, 15), random(0, 15));

  //SETUP COPY
  title = "XOXO";
  titlePos= new PVector(canvas.width/2, 200);
  titleSize=150;
  
  //  nameSize=int(textWidth(association));
//  name = "Jesse"+"\n"+"Thomas";
    name = "Ann Larie "+"\n"+"Valentine";

  namePos=new PVector(random(300, canvas.width-textWidth(name)), random(125, canvas.height));
  nameSize=260;
  
  association = "Jess3" + "\n" + "@jess3" ;
  association = "The Valentine Method" + "\n" + "@sanfranannie" ;
  associationSize=65;

  details = "YALE UNION CONTEMPORARY | PORTLAND, OR | SEPTEMBER 13-16 2013";
  detailsPos=new PVector(gridN1.modules[0][0].x, gridN1.modules[0][gridN1Rows-1].y+gridN1.modules[0][gridN1Rows-1].h*3);
  detailsSize=58;
  //  rectWidth=2121;
  //  rectHeight=1550;  

  //SETUP CONTROL P5 CONTROLS
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window", 500, 225);
  controlWindow.hideCoordinates();
  controlWindow.setTitle("Controls");
  initControls();
}

void draw() {
  canvas.background(50, 5, 100);
  canvas.noStroke();

  //SHOW THE GRID OF CHAIRS
  canvas.noFill();
  canvas.strokeWeight(3);
  canvas.stroke(254.73, 2.62, 25.86);
  gridN1.display();

  stripes= new Stripes(gridN1.modules[(int)target.x][(int)target.y]);  
  //DRAWING STRIPES
  stripes.display();
  //Updating Stripes with Control P5
  target.x = stripesTarget.arrayValue()[0];
  target.y = stripesTarget.arrayValue()[1];

  //DRAWING HEADER
  canvas.fill(c3);
  canvas.rect(0, 0, canvas.width, 250);
  canvas.fill(c2);
  canvas.textFont(font1, titleSize);
  canvas.textAlign(CENTER);
  canvas.text(title, titlePos.x-textWidth(title)/2-40, 200);
  canvas.shape(imgLogo2, 650, 90, 120, 120);

  //DRAWING COPY
  canvas.noStroke();
  canvas.fill(c5);
  canvas.textAlign(LEFT);
  //MASKING RECTANGLES: HARDCODED -10 & 1.5 ARE TO ENSURE STROKE COVERAGE
  
  canvas.rect(
  namePos.x-10, 
  namePos.y+gridN1.modules[0][0].h*2+gridN1Gutter*1.5, 
  gridN1.modules[0][0].w*11+gridN1Gutter*11, 
  -gridN1.modules[0][0].h*6-gridN1Gutter*6
    ); 
  
  canvas.rect(
  namePos.x-10, 
  namePos.y+gridN1.modules[0][0].h*2+gridN1Gutter*1.5, 
  gridN1.modules[0][0].w*11+gridN1Gutter*11, 
  gridN1.modules[0][0].h*5+gridN1Gutter*5
    );   
    
  canvas.textFont(font3, nameSize); 
  canvas.fill(c1);
  canvas.text(name, namePos.x, namePos.y); 
  namePos.x = gridN1.modules[(int)nameTarget.arrayValue()[0]][(int)nameTarget.arrayValue()[1]].x;
  namePos.y = gridN1.modules[(int)nameTarget.arrayValue()[0]][(int)nameTarget.arrayValue()[1]].y;
  
  canvas.fill(c5);
  canvas.rect(
  namePos.x-10, 
  namePos.y+gridN1.modules[0][0].h*8+gridN1Gutter*1.5, 
  gridN1.modules[0][0].w*6+gridN1Gutter*6, 
  gridN1.modules[0][0].h*3+gridN1Gutter*2
    );  
  canvas.fill(c1);  
  canvas.textFont(font1, associationSize);
  canvas.text(association, namePos.x, namePos.y+nameSize+associationSize*2);

  canvas.textFont(font1, detailsSize);
  canvas.text(details, detailsPos.x, detailsPos.y);

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

