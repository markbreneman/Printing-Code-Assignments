import toxi.geom.*;
import geomerative.*;

PGraphics canvas;
//PFont font;
RFont GothamBold;
RFont Tungsten;
RFont TungstenBold;

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

color c1;  
color c2;  
color c3;  
color c4;
color c5;
color c6;
color c7;
color c8;
color c9;
color c10;
color c11;

//Array Colors;
color[] Colors;

Monitor monitor;
Keyboard keyboard;
ArrayList keysArray;
Key Key;

//This drives how many; letters are displayed, keys are selected, and lines are drawn
int numbersOfLetters=5;
////////////////////////////////////////////

ArrayList lettersArray;
Letter Letter;

ArrayList<Key> usableKeys;
ArrayList<Key> selectedKeys;

ArrayList<Vec2D> selectedKeyPoints;
ArrayList<Vec2D> letterPoints;
ArrayList<Vec2D> random1Points;
ArrayList<Vec2D> random2Points;

ArrayList<Vec2D> points;
ArrayList pointsList;


Connector connector;
ArrayList<Connector> connectorList;


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

  //DEFINE FONTS
  RG.init(this);
  GothamBold = new RFont( "Gotham-Bold.ttf", 55, RFont.CENTER);
  TungstenBold = new RFont( "Tungsten-Bold.ttf", 300, RFont.CENTER);

  //DEFINE COLORS **AFTER SWITCHING TO HSB MODE**
  c1 = color(352.09, 86, 92.52);  
  c2 = color(62.85, 19.95, 95.41);  
  c3 = color(97.62, 18.55, 73.42);  
  c4 = color(152.57, 11.25, 75.99);
  c5 = color(96.04, 17.83, 47.92);
  c6 = color(0, 0, 3); // PrintingBlack
  //COLORs WITH TRANSPARENCY
  c7 = color(352.09, 86, 92.52, .75);  
  c8 = color(62.85, 19.95, 95.41, .75);  
  c9 = color(97.62, 18.55, 73.42, .75);  
  c10 = color(152.57, 11.25, 75.99, .75);
  c11 = color(96.04, 17.83, 47.92, .75);
  
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5);
  //  canvas.smooth();

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

  //Create the Monitor and Keyboard Objects
  monitor=new Monitor();
  keyboard=new Keyboard();

  //Create the Letter Objects on the Display
  letterPoints=new ArrayList();
  Letter=new Letter();
  Letter.create();

  //Perform Weighted Average Selection of Keys
  selectedKeys= new ArrayList();  
  selectedKeyPoints= new ArrayList();   
  
  float totalPercentage=0;
  for (int i=0; i<keysArray.size(); i++) {       
    Key k= (Key) keysArray.get(i);
    totalPercentage+=k.percentage;
  }
  final float constTotal=totalPercentage;
  int chosenIndex = 0;
  for (int j=0; j<numbersOfLetters; j++) {
    totalPercentage = 0;
    float result = random(constTotal);
    for (int i = 0; i < keysArray.size(); i++)
    {
      Key k= (Key) keysArray.get(i);
      if (k.selected==true && k.used==false) {
        totalPercentage += k.percentage;

        if (totalPercentage > result)
        {
          chosenIndex = i;
          Key S= (Key) keysArray.get(chosenIndex);
          S.used=true;
          S.selected=true;
          selectedKeys.add(S);
          selectedKeyPoints.add(S.Center);
          //println(S.c);
          break;
        }//END IF STATEMENT LOGIC & CALC
      }//END IF STATEMENT CHECK FOR SELECTED-Should be considered & USED-Not already picked
    }//END FOR LOOP OVER KEYS ARRAY
  }//END SELECT FIVE FOR LOOP

 //Create a arrays of "random points" based off of selected Points and letters
  random1Points = new ArrayList();
  random2Points = new ArrayList();
 
  for (int i=0; i<numbersOfLetters; i++) {
    Vec2D chosenKey = selectedKeyPoints.get(i);
    float randKeyX =random(chosenKey.x+(gridN1.modules[10][0].w), chosenKey.x+gridN1.modules[10][0].w*5);
    float randKeyY =random(chosenKey.y-(gridN1.modules[10][0].h)*10, chosenKey.y-gridN1.modules[10][0].h*30);
    Vec2D randKey = new Vec2D(randKeyX, randKeyY);
    println(randKey);
    random1Points.add(randKey);

    Vec2D chosenLetter = letterPoints.get(i);
    float randletterX =random(chosenLetter.x-(gridN1.modules[10][0].w), chosenLetter.x-gridN1.modules[10][0].w*8);
    float randletterY =random(chosenLetter.y+(gridN1.modules[10][0].h)*4, chosenLetter.y+gridN1.modules[10][0].h*12);
    Vec2D randLetter = new Vec2D(randletterX, randletterY);
    random2Points.add(randLetter);
  }
  
  pointsList = new ArrayList();
  
  connectorList = new ArrayList();
  
  //Create a Connectors
  for (int i=0; i<numbersOfLetters; i++) {
  connectorList.add(new Connector(i));  
  }
}

void draw() {
  canvas.background(0, 0, 100);
  canvas.fill(240, 0, 94);
  canvas.strokeWeight(5);
  canvas.stroke(0, 0, 0);
  grid.display();  
  //Draw Monitor and Keyboard
  monitor.display();
  keyboard.display();

  //Draw Letters on Monitor 
  for (int i=0; i<lettersArray.size(); i++) {
    Letter L= (Letter) lettersArray.get(i);
    String character = selectedKeys.get(i).c;
    L.c=character;
    L.display();
  }

  for (int i=0; i<connectorList.size(); i++) {
     ArrayList pointListSelect=(ArrayList) pointsList.get(i);
     Connector C= (Connector) connectorList.get(i);
     C.display(pointListSelect);
  }
 

  if (gridShow==true)
  {
    canvas.strokeWeight(10);
    canvas.stroke(221, 81, 93.81, .25);
    canvas.noFill();
    gridN1.display();
    gridN2.display();
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

