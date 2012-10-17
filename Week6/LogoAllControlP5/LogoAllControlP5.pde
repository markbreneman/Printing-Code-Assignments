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

//CONTROL P5 Addition
import controlP5.*;

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

int speechHeight1;
int speechWidth1;
int speechHeight2;
int speechWidth2;
int speechHeight3;
int speechWidth3;

SpeechBubble res1;

ModularGrid grid;
ModularGrid gridN1;
ModularGrid gridN2;
ModularGrid gridN3;

SpeechBubble[] speechbubbles = new SpeechBubble[8]; //An array of 9 speech bubbles. 3 per grid.

int resx;
int resy;
int resw;
int resh;
boolean selected1;

void setup() {


  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 800;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);
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
  
  for (int i = 0; i < 2; i ++ ) { // Initialize each SpeechBubbles in first nested grid
//    speechbubbles[i] = new SpeechBubble(color(i*2),0,i*2,i/20.0); 
  }
  
  for (int i = 3; i < 5; i ++ ) { // Initialize each SpeechBubbles in Second nested grid
//    speechbubbles[i] = new SpeechBubble(color(i*2),0,i*2,i/20.0); 
  }
  
  for (int i = 6; i < 8; i ++ ) { // Initialize each SpeechBubbles in Third nested grid
//    speechbubbles[i] = new SpeechBubble(color(i*2),0,i*2,i/20.0); 
  }
}

void draw() {

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5);
  canvas.smooth();

  //Grid 1 - Divide up the Print into 3's
  // create a grid object as a container for Logos 
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT 

  //Nested Grids
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN2 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[1][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN3 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[2][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  
  canvas.noStroke();

  canvas.fill(196.45, 100, 93.81, 1);
  //  SpeechBubble res1 = new SpeechBubble(gridN1.modules[int(speechBubble1.arrayValue()[0])][0].x, gridN1.modules[0][int(speechBubble1.arrayValue()[1])].y, gridN1.modules[0][0].w*speechWidth1, gridN1.modules[0][0].h*speechHeight1, 80.0, grid.modules[0][0]);
 
  res1 = new SpeechBubble(resx, resy, resw, resh, 80.0, grid.modules[0][0]);
  if (selectedCanvas.equals("Canvas 1") == true) {
    selected1 = true;
  }

  if (selected1 == true) {   
    resx=int(gridN1.modules[int(speechBubble1.arrayValue()[0])][0].x);
    resy=int(gridN1.modules[0][int(speechBubble1.arrayValue()[1])].y);
    resw=int(gridN1.modules[0][0].w*speechWidth1); 
    resh=int(gridN1.modules[0][0].h*speechHeight1);
  }  

  if (selectedCanvas.equals("Canvas 2") == true) {
    selected1 = false;
  }
 
 
  canvas.fill(196.45, 100, 93.81, .5);
  new SpeechBubble(gridN1.modules[int(speechBubble2.arrayValue()[0])][0].x, gridN1.modules[0][int(speechBubble2.arrayValue()[1])].y, gridN1.modules[0][0].w*speechWidth2, gridN1.modules[0][0].h*speechHeight2, 80.0, grid.modules[0][0]);

  canvas.fill(196.45, 100, 93.81, .25);
  new SpeechBubble(gridN1.modules[int(speechBubble3.arrayValue()[0])][0].x, gridN1.modules[0][int(speechBubble3.arrayValue()[1])].y, gridN1.modules[0][0].w*speechWidth3, gridN1.modules[0][0].h*speechHeight3, 80.0, grid.modules[0][0]);




  canvas.fill(0, 0, 100, 1);
  canvas.textAlign(CENTER);
  canvas.textFont(font, 650);
  canvas.text("skype", grid.modules[0][0].w/2+gridPMWidth, grid.modules[0][0].h/2+gridPMHeight);


  //Show the Compartmentalized logo space
  grid.display();

  if (gridShow==true)
  {
    gridN1.display();
    //    gridN2.display();
    //    gridN3.display();
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

  //CONTROL P5 HIDE-SHOW 
  if (key==',') controlP5.window("controlP5window").hide();
  if (key=='.') controlP5.window("controlP5window").show();
}

void mousePressed() {
}

void initControls() {

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


  S1 = controlP5.addSlider("speechHeight1", 0, gridN1Cols, gridN1Cols/2, 200, 10, 100, 10);
  S1.setNumberOfTickMarks(gridN1Cols);
  S1.setSliderMode(Slider.FLEXIBLE);
  S1.setWindow(controlWindow);

  S2 = controlP5.addSlider("speechWidth1", 0, gridN1Rows, gridN1Rows/2, 200, 50, 100, 10);
  S2.setNumberOfTickMarks(gridN1Rows);
  S2.setSliderMode(Slider.FLEXIBLE);
  S2.setWindow(controlWindow);

  //CONTROL SET2
  speechBubble2 = controlP5.addSlider2D("Speech Bubble 2", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 140, 100, 100);
  speechBubble2.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );
  speechBubble2.setWindow(controlWindow);

  S3 = controlP5.addSlider("speechHeight2", 0, gridN1Cols, gridN1Cols/2, 200, 140, 100, 10);
  S3.setNumberOfTickMarks(gridN1Cols);
  S3.setSliderMode(Slider.FLEXIBLE);
  S3.setWindow(controlWindow);

  S4 = controlP5.addSlider("speechWidth2", 0, gridN1Rows, gridN1Rows/2, 200, 180, 100, 10);
  S4.setNumberOfTickMarks(gridN1Rows);
  S4.setSliderMode(Slider.FLEXIBLE);
  S4.setWindow(controlWindow);

  //CONTROL SET3
  speechBubble3 = controlP5.addSlider2D("Speech Bubble 3", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 280, 100, 100);
  speechBubble3.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  ); 
  speechBubble3.setWindow(controlWindow);

  S5 = controlP5.addSlider("speechHeight3", 0, gridN1Cols, gridN1Cols/2, 200, 280, 100, 10);
  S5.setNumberOfTickMarks(gridN1Cols);
  S5.setSliderMode(Slider.FLEXIBLE);
  S5.setWindow(controlWindow);

  S6 = controlP5.addSlider("speechWidth3", 0, gridN1Rows, gridN1Rows/2, 200, 320, 100, 10);
  S6.setNumberOfTickMarks(gridN1Rows);
  S6.setSliderMode(Slider.FLEXIBLE);
  S6.setWindow(controlWindow);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    if (theEvent.group().name() == "canvasSelect") {
      selectedCanvas = "Canvas "+String.valueOf(int(theEvent.group().value()));
    }
  } 
  else if (theEvent.isController()) {
    selectedCanvas = "Canvas ";
  }
}

