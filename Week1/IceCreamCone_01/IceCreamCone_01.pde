PGraphics canvas;
int radius;
//Dimensions of A4 Paper in Inches
float paper_width = 8.3;
float paper_height = 11.7;
float paper_ratio = paper_height/paper_width;

//Dimensions of an A4 Paper in Pixels
int canvas_width = 2480;
int canvas_height = 3508;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{  
int width = 600;
int height = int(width*paper_ratio);

size(width,height,P2D);
background(0);  
smooth(8);

canvas = createGraphics(canvas_width, canvas_height, P2D);
calculateResizeRatio();

radius=250;
strokeWeight(radius/35);

//Ice Cream
ellipseMode(CENTER);
int centerX = width/2;
int centerY = height/2-radius/2;
ellipse(centerX, centerY, radius, radius);
 
//Cone
triangle(centerX-radius*.525, centerY*1.05, 
         centerX+radius*.525, centerY*1.05,
         width/2, height/2+radius);
//Cookie        
translate(centerX, centerY);
rotate(PI/4);
rectMode(CENTER);
rect(radius/8, -radius/2, radius*.15, radius*.4);

}

/*  Calculate resizing*/

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

/*Saving out a png*/
void keyPressed()
{
  if(key == 's')
  {  
    println("Saving Image");
    canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".png");
    println("Saved Image"); 
  }
}
