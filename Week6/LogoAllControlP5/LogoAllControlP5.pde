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
Slider S7;
Slider S8;
Slider S9;

int triOptions=6;

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

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 1);
  canvas.background(0, 0, 100, .5);
  canvas.smooth();

  //Grid 1 - Divide up the Print into 3's
  // create a grid object as a container for Logos 
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT 

  //Nested Grids:Note to have different sized grids in 2 or 3 change it to a gridN2 or gridN3 variable.
  gridN1 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[0][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN2 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[1][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE
  gridN3 = new ModularGrid(gridN1Cols, gridN1Rows, gridN1Gutter, gridN1PMWidth, gridN1PMHeight, grid.modules[2][0]); // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT, CONTAINER MODULE

  canvas.fill(196.45, 100, 93.81, 1);
  for (int i = 0; i <= 2; i ++ ) { // Initialize each SpeechBubbles in first nested grid
    speechbubbles[i] = new SpeechBubble(gridN1.modules[int(random(0, gridN1Cols))][0].x, gridN1.modules[0][int(random(0, gridN1Rows))].y, gridN1.modules[0][0].w*(int(random(3, 4))), gridN1.modules[0][0].h*(int(random(3, 4))), 80.0, grid.modules[0][0]);
  }

  for (int i = 3; i <= 5; i ++ ) { // Initialize each SpeechBubbles in Second nested grid
    speechbubbles[i] = new SpeechBubble(gridN2.modules[int(random(0, gridN1Cols))][0].x, gridN2.modules[0][int(random(0, gridN1Rows))].y, gridN2.modules[0][0].w*(int(random(3, 4))), gridN2.modules[0][0].h*(int(random(3, 4))), 80.0, grid.modules[1][0]);
  }

  for (int i = 6; i <= 8; i ++ ) { // Initialize each SpeechBubbles in Third nested grid
    speechbubbles[i] = new SpeechBubble(gridN3.modules[int(random(0, gridN1Cols))][0].x, gridN3.modules[0][int(random(0, gridN1Rows))].y, gridN3.modules[0][0].w*(int(random(3, 4))), gridN3.modules[0][0].h*(int(random(3, 4))), 80.0, grid.modules[2][0]);
  }
}

void draw() {
  canvas.background(0, 0, 100, .5);

  canvas.noStroke();

  if (selectedCanvas.equals("Canvas 1") == true) {
    selected1 = true;
    selected2 = false;
    selected3 = false;
  }

  if (selected1 == true) {   
    speechbubbles[0].x=int(gridN1.modules[int(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[0].y=int(gridN1.modules[0][int(speechBubble1.arrayValue()[1])].y);
    speechbubbles[0].w=int(gridN1.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[0].h=int(gridN1.modules[0][0].h*Speech_Bubble_1_Height);

    speechbubbles[1].x=int(gridN1.modules[int(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[1].y=int(gridN1.modules[0][int(speechBubble2.arrayValue()[1])].y);
    speechbubbles[1].w=int(gridN1.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[1].h=int(gridN1.modules[0][0].h*Speech_Bubble_2_Height);

    speechbubbles[2].x=int(gridN1.modules[int(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[2].y=int(gridN1.modules[0][int(speechBubble3.arrayValue()[1])].y);
    speechbubbles[2].w=int(gridN1.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[2].h=int(gridN1.modules[0][0].h*Speech_Bubble_3_Height);
  }

  if  (selectedCanvas.equals("Canvas 2") == true) {
    selected1 = false;
    selected2 = true;
    selected3 = false;
  }

  if (selected2 == true) {   
    speechbubbles[3].x=int(gridN2.modules[int(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[3].y=int(gridN2.modules[0][int(speechBubble1.arrayValue()[1])].y);
    speechbubbles[3].w=int(gridN2.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[3].h=int(gridN2.modules[0][0].h*Speech_Bubble_1_Height);

    speechbubbles[4].x=int(gridN2.modules[int(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[4].y=int(gridN2.modules[0][int(speechBubble2.arrayValue()[1])].y);
    speechbubbles[4].w=int(gridN2.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[4].h=int(gridN2.modules[0][0].h*Speech_Bubble_2_Height);

    speechbubbles[5].x=int(gridN2.modules[int(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[5].y=int(gridN2.modules[0][int(speechBubble3.arrayValue()[1])].y);
    speechbubbles[5].w=int(gridN2.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[5].h=int(gridN2.modules[0][0].h*Speech_Bubble_3_Height);
  }  


   if  (selectedCanvas.equals("Canvas 3") == true) {
    selected1 = false;
    selected2 = false;
    selected3 = true;
  }

  if (selected3 == true) {   
    speechbubbles[6].x=int(gridN3.modules[int(speechBubble1.arrayValue()[0])][0].x);
    speechbubbles[6].y=int(gridN3.modules[0][int(speechBubble1.arrayValue()[1])].y);
    speechbubbles[6].w=int(gridN3.modules[0][0].w*Speech_Bubble_1_Width); 
    speechbubbles[6].h=int(gridN3.modules[0][0].h*Speech_Bubble_1_Height);

    speechbubbles[7].x=int(gridN3.modules[int(speechBubble2.arrayValue()[0])][0].x);
    speechbubbles[7].y=int(gridN3.modules[0][int(speechBubble2.arrayValue()[1])].y);
    speechbubbles[7].w=int(gridN3.modules[0][0].w*Speech_Bubble_2_Width); 
    speechbubbles[7].h=int(gridN3.modules[0][0].h*Speech_Bubble_2_Height);

    speechbubbles[8].x=int(gridN3.modules[int(speechBubble3.arrayValue()[0])][0].x);
    speechbubbles[8].y=int(gridN3.modules[0][int(speechBubble3.arrayValue()[1])].y);
    speechbubbles[8].w=int(gridN3.modules[0][0].w*Speech_Bubble_3_Width); 
    speechbubbles[8].h=int(gridN3.modules[0][0].h*Speech_Bubble_3_Height);
  }  
  
  for (int i=0; i<=8; i++) {
    if (i==0) {  
      canvas.fill(196.45, 100, 93.81, 1);
    }
    if (i==1) {  
      canvas.fill(196.45, 100, 93.81, .5);
    }
    if (i==2) {  
      canvas.fill(196.45, 100, 93.81, .25);
    }
    if (i==3) {  
      canvas.fill(87.99, 65, 73.01, 1);
    }
    if (i==4) {  
      canvas.fill(87.99, 65, 73.01, .5);
    }
    if (i==5) {  
      canvas.fill(87.99, 65, 73.01, .25);
    }if (i==6) {  
      canvas.fill(215.23, 3.32, 52.03, 1); 
    }
    if (i==7) {  
      canvas.fill(215.23, 3.32, 52.03, .5); 
    }
    if (i==8) {  
      canvas.fill(215.23, 3.32, 52.03, .25); 
    }
    speechbubbles[i].display(speechbubbles[i].x, speechbubbles[i].y, speechbubbles[i].w, speechbubbles[i].h);
  }

  canvas.fill(0, 0, 100, 1);
  canvas.textAlign(CENTER);
  canvas.textFont(font, 650);
  canvas.text("skype", grid.modules[0][0].w/2+gridPMWidth, grid.modules[0][0].h/2+gridPMHeight);
  canvas.text("skype", 3*grid.modules[1][0].w/2+gridPMWidth+gridGutter, grid.modules[1][0].h/2+gridPMHeight);
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

