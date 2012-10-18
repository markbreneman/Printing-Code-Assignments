import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class LogoAllControlP5 extends PApplet {

PGraphics canvas;
PFont font;

//Dimensions of Plotter Paper in Inches
float paper_width = 20;
float paper_height = 10;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = PApplet.parseInt(paper_width*300);
int canvas_height = PApplet.parseInt(paper_height*300);

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int gridCols=3;
int gridRows=1;
int gridGutter=100;
int gridPMWidth=120;
int gridPMHeight=600;

int gridN1Cols=20;
int gridN1Rows=20;
int gridN1Gutter=10;
int gridN1PMWidth=0;
int gridN1PMHeight=0;

Boolean gridShow=false;
String showing="Not Showing";

//CONTROL P5 Addition


ControlP5 controlP5;
ControlWindow controlWindow;
//DropDown list for Canvas Selection
DropdownList canvasSelector;
String selectedCanvas;

//Positional 2D Slider
Slider2D speechBubble1;
Slider2D speechBubble2;
Slider2D speechBubble3;
//Height and Width Sliders
Slider S1;
Slider S2;
Slider S3;
Slider S4;
Slider S5;
Slider S6;
Slider S7;
Slider S8;
Slider S9;

int triOptions=7;// Option 7 is no Triangle

int Speech_Bubble_1_Height;
int Speech_Bubble_1_Width;
int Speech_Bubble_1_Triangle_Position;

int Speech_Bubble_2_Height;
int Speech_Bubble_2_Width;
int Speech_Bubble_2_Triangle_Position;

int Speech_Bubble_3_Height;
int Speech_Bubble_3_Width;
int Speech_Bubble_3_Triangle_Position;

ModularGrid grid;
ModularGrid gridN1;
ModularGrid gridN2;
ModularGrid gridN3;

SpeechBubble[] speechbubbles = new SpeechBubble[9]; //An array of 9 speech bubbles. 3 per grid.

boolean selected1;
boolean selected2; 
boolean selected3; 
boolean textOn;
String logoTexts="Showing Text";

public void setup() {


  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 800;//Change this number to get a display window with papers aspect ratio
  int height = PApplet.parseInt(width*paper_ratio);
  font = loadFont("ChaletBook-48.vlw");

  size(width, height);
  colorMode(HSB, 360, 100, 100, 1);
  //  frameRate(5);
  background(0, 0, 69, 1);
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
  selected3 = false;
  textOn= true;

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5f);
  canvas.smooth();

  //Grid 1 - Divide up the Print into 3's
  // create a grid object as a container for Logos 
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT 

  //Nested Grids:Note to have different sized grids in 2 or 3 change it to a gridN2 or gridN3 variable.
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN2 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[1][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN3 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[2][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE

  canvas.fill(196.45f, 100, 93.81f, 1);
  for (int i = 0; i <= 2; i ++ ) { // Initialize each SpeechBubbles in first nested grid
    speechbubbles[i] = new SpeechBubble(gridN1.modules[PApplet.parseInt(random(0, gridN1Cols))][0].x, gridN1.modules[0][PApplet.parseInt(random(0, gridN1Rows))].y, gridN1.modules[0][0].w*(PApplet.parseInt(random(3, 4))), gridN1.modules[0][0].h*(PApplet.parseInt(random(3, 4))), 80.0f, grid.modules[0][0], PApplet.parseInt(random(0,6)));
  }

  for (int i = 3; i <= 5; i ++ ) { // Initialize each SpeechBubbles in Second nested grid
    speechbubbles[i] = new SpeechBubble(gridN2.modules[PApplet.parseInt(random(0, gridN1Cols))][0].x, gridN2.modules[0][PApplet.parseInt(random(0, gridN1Rows))].y, gridN2.modules[0][0].w*(PApplet.parseInt(random(3, 4))), gridN2.modules[0][0].h*(PApplet.parseInt(random(3, 4))), 80.0f, grid.modules[1][0],PApplet.parseInt(random(0,6)));
  }

  for (int i = 6; i <= 8; i ++ ) { // Initialize each SpeechBubbles in Third nested grid
    speechbubbles[i] = new SpeechBubble(gridN3.modules[PApplet.parseInt(random(0, gridN1Cols))][0].x, gridN3.modules[0][PApplet.parseInt(random(0, gridN1Rows))].y, gridN3.modules[0][0].w*(PApplet.parseInt(random(3, 4))), gridN3.modules[0][0].h*(PApplet.parseInt(random(3, 4))), 80.0f, grid.modules[2][0],PApplet.parseInt(random(0,6)));
  }
}

public void draw() {
  canvas.background(0, 0, 100, .5f);

  canvas.noStroke();

  if (selectedCanvas.equals("Canvas 1") == true) {
    selected1 = true;
    selected2 = false;
    selected3 = false;
  }

  if (selected1 == true) {   
    speechbubbles[0].x=PApplet.parseInt(gridN1.modules[PApplet.parseInt(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[0].y=PApplet.parseInt(gridN1.modules[0][PApplet.parseInt(speechBubble1.arrayValue()[1])].y);
    speechbubbles[0].w=PApplet.parseInt(gridN1.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[0].h=PApplet.parseInt(gridN1.modules[0][0].h*Speech_Bubble_1_Height);
    speechbubbles[0].triPos=Speech_Bubble_1_Triangle_Position;

    speechbubbles[1].x=PApplet.parseInt(gridN1.modules[PApplet.parseInt(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[1].y=PApplet.parseInt(gridN1.modules[0][PApplet.parseInt(speechBubble2.arrayValue()[1])].y);
    speechbubbles[1].w=PApplet.parseInt(gridN1.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[1].h=PApplet.parseInt(gridN1.modules[0][0].h*Speech_Bubble_2_Height);
    speechbubbles[1].triPos=Speech_Bubble_2_Triangle_Position;

    speechbubbles[2].x=PApplet.parseInt(gridN1.modules[PApplet.parseInt(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[2].y=PApplet.parseInt(gridN1.modules[0][PApplet.parseInt(speechBubble3.arrayValue()[1])].y);
    speechbubbles[2].w=PApplet.parseInt(gridN1.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[2].h=PApplet.parseInt(gridN1.modules[0][0].h*Speech_Bubble_3_Height);
    speechbubbles[2].triPos=Speech_Bubble_3_Triangle_Position;
  }

  if  (selectedCanvas.equals("Canvas 2") == true) {
    selected1 = false;
    selected2 = true;
    selected3 = false;
  }

  if (selected2 == true) {   
    speechbubbles[3].x=PApplet.parseInt(gridN2.modules[PApplet.parseInt(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[3].y=PApplet.parseInt(gridN2.modules[0][PApplet.parseInt(speechBubble1.arrayValue()[1])].y);
    speechbubbles[3].w=PApplet.parseInt(gridN2.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[3].h=PApplet.parseInt(gridN2.modules[0][0].h*Speech_Bubble_1_Height);
    speechbubbles[3].triPos=Speech_Bubble_1_Triangle_Position;

    speechbubbles[4].x=PApplet.parseInt(gridN2.modules[PApplet.parseInt(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[4].y=PApplet.parseInt(gridN2.modules[0][PApplet.parseInt(speechBubble2.arrayValue()[1])].y);
    speechbubbles[4].w=PApplet.parseInt(gridN2.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[4].h=PApplet.parseInt(gridN2.modules[0][0].h*Speech_Bubble_2_Height);
    speechbubbles[4].triPos=Speech_Bubble_2_Triangle_Position;

    speechbubbles[5].x=PApplet.parseInt(gridN2.modules[PApplet.parseInt(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[5].y=PApplet.parseInt(gridN2.modules[0][PApplet.parseInt(speechBubble3.arrayValue()[1])].y);
    speechbubbles[5].w=PApplet.parseInt(gridN2.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[5].h=PApplet.parseInt(gridN2.modules[0][0].h*Speech_Bubble_3_Height);
    speechbubbles[5].triPos=Speech_Bubble_3_Triangle_Position;
  }  


   if  (selectedCanvas.equals("Canvas 3") == true) {
    selected1 = false;
    selected2 = false;
    selected3 = true;
  }

  if (selected3 == true) {   
    speechbubbles[6].x=PApplet.parseInt(gridN3.modules[PApplet.parseInt(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[6].y=PApplet.parseInt(gridN3.modules[0][PApplet.parseInt(speechBubble1.arrayValue()[1])].y);
    speechbubbles[6].w=PApplet.parseInt(gridN3.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[6].h=PApplet.parseInt(gridN3.modules[0][0].h*Speech_Bubble_1_Height);
    speechbubbles[6].triPos=Speech_Bubble_1_Triangle_Position;

    speechbubbles[7].x=PApplet.parseInt(gridN3.modules[PApplet.parseInt(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[7].y=PApplet.parseInt(gridN3.modules[0][PApplet.parseInt(speechBubble2.arrayValue()[1])].y);
    speechbubbles[7].w=PApplet.parseInt(gridN3.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[7].h=PApplet.parseInt(gridN3.modules[0][0].h*Speech_Bubble_2_Height);
    speechbubbles[7].triPos=Speech_Bubble_2_Triangle_Position;

    speechbubbles[8].x=PApplet.parseInt(gridN3.modules[PApplet.parseInt(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[8].y=PApplet.parseInt(gridN3.modules[0][PApplet.parseInt(speechBubble3.arrayValue()[1])].y);
    speechbubbles[8].w=PApplet.parseInt(gridN3.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[8].h=PApplet.parseInt(gridN3.modules[0][0].h*Speech_Bubble_3_Height);
    speechbubbles[8].triPos=Speech_Bubble_3_Triangle_Position;
  }  
  
  for (int i=0; i<=8; i++) {
    if (i==0) {  
      canvas.fill(196.45f, 100, 93.81f, 1);
    }
    if (i==1) {  
      canvas.fill(196.45f, 100, 93.81f, .5f);
    }
    if (i==2) {  
      canvas.fill(196.45f, 100, 93.81f, .25f);
    }
    if (i==3) {  
      canvas.fill(87.99f, 65, 73.01f, 1);
    }
    if (i==4) {  
      canvas.fill(87.99f, 65, 73.01f, .5f);
    }
    if (i==5) {  
      canvas.fill(87.99f, 65, 73.01f, .25f);
    }if (i==6) {  
      canvas.fill(215.23f, 3.32f, 52.03f, 1); 
    }
    if (i==7) {  
      canvas.fill(215.23f, 3.32f, 52.03f, .5f); 
    }
    if (i==8) {  
      canvas.fill(215.23f, 3.32f, 52.03f, .25f); 
    }
    speechbubbles[i].display(speechbubbles[i].x, speechbubbles[i].y, speechbubbles[i].w, speechbubbles[i].h,speechbubbles[i].triPos);
  }

  canvas.fill(0, 0, 100, 1);
  canvas.textAlign(CENTER);
  canvas.textFont(font, 650);
  if(textOn==true){
  canvas.text("skype", grid.modules[0][0].w/2+gridPMWidth, grid.modules[0][0].h/2+gridPMHeight);
  canvas.text("skype", 3*grid.modules[1][0].w/2+gridPMWidth+gridGutter, grid.modules[1][0].h/2+gridPMHeight);
  canvas.text("skype", 5*grid.modules[2][0].w/2+gridPMWidth+gridGutter*2, grid.modules[2][0].h/2+gridPMHeight);
  }
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
    canvas.stroke(0, 0, 0, .3f);
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

public void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}

public void keyPressed()
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
      println(showing);
    }
  }
  
  //SHOW HIDE TEXT
  if (key == 't')
  {  
    textOn=!textOn;
    if (logoTexts.equals("Showing Text")) {
      logoTexts="Not Showing Text";
      println(logoTexts);
    }
    else if (showing.equals("Not Showing Text")) {
      logoTexts="Showing Text";
      println(logoTexts);
    }
  }

  //CONTROL P5 HIDE-SHOW 
  if (key==',') controlP5.window("controlP5window").hide();
  if (key=='.') controlP5.window("controlP5window").show();
}

public void mousePressed() {
}

public void initControls() {

  canvasSelector = controlP5.addDropdownList("canvasSelect", 10, 500, 380, 120);
  canvasSelector.setBackgroundColor(color(190));
  canvasSelector.setItemHeight(15);
  canvasSelector.setBarHeight(15);
  //  textAlign(CENTER);///later...
  canvasSelector.captionLabel().set("Canvas");
  canvasSelector.addItem("Canvas 1", 1);
  canvasSelector.addItem("Canvas 2", 2);
  canvasSelector.addItem("Canvas 3", 3);
  canvasSelector.moveTo(controlWindow);
  //  println(canvasSelector);


  //CONTROL SET1
  speechBubble1 = controlP5.addSlider2D("Speech Bubble 1", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 10, 100, 100);
  speechBubble1.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );  
  speechBubble1.setWindow(controlWindow);


  S1 = controlP5.addSlider("Speech_Bubble_1_Height", 0, gridN1Cols, gridN1Cols/2, 120, 10, 100, 10);
  S1.setNumberOfTickMarks(gridN1Cols);
  S1.setSliderMode(Slider.FLEXIBLE);
  S1.setWindow(controlWindow);

  S2 = controlP5.addSlider("Speech_Bubble_1_Width", 0, gridN1Rows, gridN1Rows/2, 120, 50, 100, 10);
  S2.setNumberOfTickMarks(gridN1Rows);
  S2.setSliderMode(Slider.FLEXIBLE);
  S2.setWindow(controlWindow);
  
  S3 = controlP5.addSlider("Speech_Bubble_1_Triangle_Position", 0, triOptions, triOptions/2, 120, 90, 100, 10);
  S3.setNumberOfTickMarks(triOptions);
  S3.setSliderMode(Slider.FLEXIBLE);
  S3.setWindow(controlWindow);

  //CONTROL SET2
  speechBubble2 = controlP5.addSlider2D("Speech Bubble 2", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 140, 100, 100);
  speechBubble2.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );
  speechBubble2.setWindow(controlWindow);

  S4 = controlP5.addSlider("Speech_Bubble_2_Height", 0, gridN1Cols, gridN1Cols/2, 120, 140, 100, 10);
  S4.setNumberOfTickMarks(gridN1Cols);
  S4.setSliderMode(Slider.FLEXIBLE);
  S4.setWindow(controlWindow);

  S5 = controlP5.addSlider("Speech_Bubble_2_Width", 0, gridN1Rows, gridN1Rows/2, 120, 180, 100, 10);
  S5.setNumberOfTickMarks(gridN1Rows);
  S5.setSliderMode(Slider.FLEXIBLE);
  S5.setWindow(controlWindow);
  
  S6 = controlP5.addSlider("Speech_Bubble_2_Triangle_Position", 0, triOptions, triOptions/2, 120, 220, 100, 10);
  S6.setNumberOfTickMarks(triOptions);
  S6.setSliderMode(Slider.FLEXIBLE);
  S6.setWindow(controlWindow);

  //CONTROL SET3
  speechBubble3 = controlP5.addSlider2D("Speech Bubble 3", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 280, 100, 100);
  speechBubble3.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  ); 
  speechBubble3.setWindow(controlWindow);

  S7 = controlP5.addSlider("Speech_Bubble_3_Height", 0, gridN1Cols, gridN1Cols/2, 120, 280, 100, 10);
  S7.setNumberOfTickMarks(gridN1Cols);
  S7.setSliderMode(Slider.FLEXIBLE);
  S7.setWindow(controlWindow);

  S8 = controlP5.addSlider("Speech_Bubble_3_Width", 0, gridN1Rows, gridN1Rows/2, 120, 320, 100, 10);
  S8.setNumberOfTickMarks(gridN1Rows);
  S8.setSliderMode(Slider.FLEXIBLE);
  S8.setWindow(controlWindow);

  S9 = controlP5.addSlider("Speech_Bubble_3_Triangle_Position", 0, triOptions, triOptions/2, 120, 360, 100, 10);
  S9.setNumberOfTickMarks(triOptions);
  S9.setSliderMode(Slider.FLEXIBLE);
  S9.setWindow(controlWindow);
  
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    if (theEvent.group().name() == "canvasSelect") {
      selectedCanvas = "Canvas "+String.valueOf(PApplet.parseInt(theEvent.group().value()));
    }
  } 
  else if (theEvent.isController()) {
    selectedCanvas = "Canvas ";
  }
}

class ModularGrid
{
  int cols;
  int rows;
  float gutterSize;
  float pageMarginW;
  float pageMarginH;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;
  float startX;
  float startY;
  float modW;
  float modH;
  
  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMarginW, float _pageMarginH)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMarginW = _pageMarginW;
    pageMarginH = _pageMarginH;
    
    modules = new Module[cols][rows];
    
    // cache the width of each column. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)canvas.width - (2*pageMarginW));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;
    
    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)canvas.height - (2*pageMarginH));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMarginW + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMarginH + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      } 
    }
  }
  
    ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMarginW, float _pageMarginH, Module _module )
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMarginW = _pageMarginW;
    pageMarginH = _pageMarginH;
    startX = _module.x;
    startY = _module.y;
    modW = _module.w;
    modH = _module.h;
    
    modules = new Module[cols][rows];
    
    // cache the width of each column. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)modW - (2*pageMarginW));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;
    
    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)modH - (2*pageMarginH));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = startX+pageMarginW + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = startY+pageMarginH + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      } 
    }
  }
  
  
  public void display()
  {
    canvas.noFill();
    canvas.stroke(255, 0, 0, 100);
    
    // draw the big bounding box
//    canvas.rect(pageMarginW, pageMarginH, canvas.width - (2*pageMarginW), canvas.height - (2*pageMarginH));
    
    // draw all modules
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        canvas.rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
      } 
    }
  }
}
class Module
{
  float x;
  float y;
  float w;
  float h;
  boolean used = false;
  
  Module() {}
 
  Module(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  } 
}
class SpeechBubble
{
  float x;
  float y;
  float w;
  float h;
  float r;
  float CX;
  float CY;
  float Top;
  float Bottom;
  float mW;//Containing Module Width
  float mH;//Containing Module Height
  float offsetW; 
  float offsetH;
  int triPos;

  SpeechBubble(float _x, float _y, float _w, float _h, float _r, Module _module, int _tri)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r=_r;
    mW = _module.w;
    mH = _module.h;
    triPos= _tri;
  }

  public void display(float _x, float _y, float _w, float _h, int _tri ) {
  
    
    offsetW = w*.125f;
    offsetH = h*.35f;

    CX=x+w/2;
    CY=y+h/2;
    Top=y;
    Bottom=y+h;
    
    
    canvas.rect(x, y, w, h, r);   
   
     if (triPos==0) {
    canvas.triangle(
    x+offsetW, Top, 
    x+offsetW*3, Top, 
    x+offsetW+(random(-100,-0)), Top-offsetH*2
    );
    }

    else if(triPos==1){
    canvas.triangle(
    CX-offsetW, Top, 
    CX+offsetW, Top, 
    CX, Top-offsetH*2
    );
    }

    else if(triPos==2){
    canvas.triangle(
    x+w-offsetW*3, Top, 
    x+w-offsetW, Top, 
    x+w-offsetW-(random(-100,-0)), Top-offsetH*2
    );
    }

    else if(triPos==3){
    canvas.triangle(
    x+offsetW, Bottom, 
    x+offsetW*3, Bottom, 
    x+offsetW+(random(-100,-0)), Bottom+offsetH*2
    );
    }

    else if(triPos==4){
    canvas.triangle(
    CX-offsetW, Bottom, 
    CX+offsetW, Bottom, 
    CX, Bottom+offsetH*2
    );
    }

    else if(triPos==5){
    canvas.triangle(
    x+w-offsetW*3, Bottom, 
    x+w-offsetW, Bottom, 
    x+w-offsetW-(random(-100,-0)), Bottom+offsetH*2
    );
    } 

//    if (Top>mH/2+gridPMHeight/2) {
//
//      //TOP TRIANGLES
//      //LEFT
//      if (CX<mW*5/12+gridPMWidth/2) {
//        canvas.triangle(
//        x+offsetW, Top, 
//        x+offsetW*3, Top, 
//        x+offsetW+(random(-75, 0)), Top-offsetH*2
//          );
//      }
//
//      //CENTER
//      if (CX>mW*5/12+gridPMWidth/2 && CX<mW*9/12+gridPMWidth/2) {
//        canvas.triangle(
//        CX-offsetW, Top, 
//        CX+offsetW, Top, 
//        CX, Top-offsetH*2
//          );
//      }
//
//      //RIGHT
//      if (CX>mW*9/12+gridPMWidth/2) {
//        canvas.triangle(
//        x+w-offsetW*3, Top, 
//        x+w-offsetW, Top, 
//        x+w-offsetW-(random(-75, 0)), Top-offsetH*2
//          );
//      }
//    }
//
//    else if (Top<mH/2+gridPMHeight/2) {
//      //BOTTOM TRIANGLES
//      //LEFT
//      if (CX<mW*5/12+gridPMWidth/2) {
//        canvas.triangle(
//        x+offsetW, Bottom, 
//        x+offsetW*3, Bottom, 
//        x+offsetW+(random(-75, 0)), Bottom+offsetH*2
//          );
//      }
//
//      //CENTER
//      if (CX>mW*5/12+gridPMWidth/2 && CX<mW*9/12+gridPMWidth/2) {
//        canvas.triangle(
//        CX-offsetW, Bottom, 
//        CX+offsetW, Bottom, 
//        CX, Bottom+offsetH*2
//          );
//      }
//
//      //RIGHT
//      if (CX>mW*9/12+gridPMWidth/2) {
//        canvas.triangle(
//        x+w-offsetW*3, Bottom, 
//        x+w-offsetW, Bottom, 
//        x+w-offsetW-(random(-75, 0)), Bottom+offsetH*2
//          );
//      }
//    }
  }


}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "LogoAllControlP5" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
