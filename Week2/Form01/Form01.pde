PGraphics canvas;

//Dimensions of Plotter Paper in Inches
float paper_width = 22;
float paper_height = 17;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels at 300dpi
int canvas_width = int(paper_width*300);
int canvas_height = int(paper_height*300);

//Centering Artwork on the Canvas
float ratioWidth = 1;
float ratioHeight = 1;
float ratio =1;

int forLoop1Wave;
int forLoop2Wave;
int forLoop3Wave;
int numWaves;
float waveWidth;
float waveHeight;

void setup() {
  //I like to work with a display that is the same aspect ratio as the paper 
  //I set a width and the height corresponds
  int width = 600;//Change this number to get a display window with papers aspect ratio
  int height = int(width*paper_ratio);

  size(width, height);
  background(255);

  canvas = createGraphics(canvas_width, canvas_height);
  //  println("The Canvas width is"+canvas.width);
  //  println("The Canvas height is"+canvas.height);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(255);


  //Starting with the top shape -the outline of the waves and icebergs
  //Setting up loop stuff: each is a percentage of the full width total = .35+.35+..3
  forLoop1Wave=int(canvas.width*.25);//First part of the for loop wave pattern
  forLoop2Wave=int(canvas.width*.25);//Second part of the for loop wave pattern = iceberg
  forLoop3Wave=int(canvas.width*.5);//Last part of the for loop wave pattern
  numWaves=5;
  waveWidth=forLoop1Wave/numWaves;
  waveHeight=waveWidth/10;
  println("the wave width is " +waveWidth);
  println("the 1 wave width is " +forLoop1Wave);
  println("the 2 wave width is " +forLoop2Wave);
  println("the 3 wave width is " +forLoop3Wave);
  canvas.pushMatrix();
  canvas.translate(0, canvas_height/2);
  drawWave(waveWidth, waveHeight);
  drawIceberg();

  canvas.popMatrix();  
  canvas.endDraw();


  //Adjust the artwork to canvas and show the canvas on the screen
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width / 2) - (resizedWidth / 2), 
  (height / 2) - (resizedHeight / 2), 
  resizedWidth, 
  resizedHeight
    );

//  canvas.save("Form01_"+year()+day()+hour()+minute()+".png");
}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}


void drawWave(float waveWidth, float waveHeight) {
  canvas.beginShape();
  canvas.fill(0);
  //Leftside of the IceBerg
  for (int i = 0; i < forLoop1Wave; i += waveWidth) {
    canvas.vertex(i, 0); // 1st anchor
    canvas.bezierVertex(i + waveWidth/4, 0, // cx1, cy1
    i + waveWidth/4, waveHeight, // cx2, cy2
    i + waveWidth/2, waveHeight); // 2nd anchor
    canvas.bezierVertex(i + (3 * waveWidth/4), waveHeight, // cx1, cy1
    i + (3 * waveWidth/4), 0, // cx2, cy2
    i + waveWidth, 0); // 3rd anchor
  }
  //Tip of the IceBerg
  
  for (int i =forLoop1Wave; i < forLoop1Wave+forLoop2Wave; i+=300) {
    canvas.vertex(i, random(-1200,0));  
//    canvas.vertex(forLoop1Wave+700, -2000);
//    canvas.vertex(forLoop1Wave+1000, -1500);  
//    canvas.vertex(forLoop1Wave+1200, -2300);  
  
  }

  //RightSide of the Iceberg
  for (int i =forLoop1Wave+forLoop2Wave ; i < canvas.width; i += waveWidth) {
    canvas.vertex(i, 0); // 1st anchor
    canvas.bezierVertex(i + waveWidth/4, 0, // cx1, cy1
    i + waveWidth/4, waveHeight, // cx2, cy2
    i + waveWidth/2, waveHeight); // 2nd anchor
    canvas.bezierVertex(i + (3 * waveWidth/4), waveHeight, // cx1, cy1
    i + (3 * waveWidth/4), 0, // cx2, cy2
    i + waveWidth, 0); // 3rd anchor
  }
  
  canvas.vertex(canvas.width, -canvas.height/2);
  canvas.vertex(-canvas.width, -canvas.height/2);
  canvas.endShape();
}

void drawIceberg(){
 //Bottom of the IceBerg
  canvas.beginShape();
  for (int i =forLoop1Wave; i < forLoop1Wave+forLoop2Wave; i+=waveWidth){
    canvas.vertex(i, 0); // 1st anchor
    canvas.bezierVertex(i + waveWidth/4, 0, // cx1, cy1
    i + waveWidth/4, waveHeight, // cx2, cy2
    i + waveWidth/2, waveHeight); // 2nd anchor
    canvas.bezierVertex(i + (3 * waveWidth/4), waveHeight, // cx1, cy1
    i + (3 * waveWidth/4), 0, // cx2, cy2
    i + waveWidth, 0); // 3rd anchor
  }  
    canvas.vertex(forLoop1Wave+3000, 2300);  
    canvas.vertex(forLoop1Wave+2000, 3000);
    canvas.vertex(forLoop1Wave-900, 1100);
    canvas.vertex(forLoop1Wave-random(50,100), 1100);
 
  canvas.endShape();
}
