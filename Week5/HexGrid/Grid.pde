class ModularGrid
{
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  float pageMarginVertical;//In the case that the vertical doesn't break out easily
  
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;
  float moduleCenterX;
  float moduleCenterY;
  
  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;
    pageMarginVertical=pageMargin;
    
    modules = new Module[cols][rows];
   
 // cache the width of each column. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)canvas.width - (2*pageMargin));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols;
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;


    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)canvas.height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
//    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    float hexHeight = (moduleWidth/2 * sqrt(3)/2) * 2;
    moduleHeight=hexHeight;
    
//    if( (actualPageHeight-totalGutterWidth)-(hexHeight*rows)==0){
//      
//    }
//      else(      
//      pageMarginVertical=((actualPageHeight-totalGutterWidth)-(hexHeight*rows))/2
//      )
//    
    
//    println((actualPageHeight-totalGutterWidth)%(hexHeight*rows));
    
    
//    float f = 7.25;
//    println(f % 1); // Shows 0.0;

//    println(moduleWidth);
//    println(hexHeight);
    
     
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
        
        //Get the center of Each module as a function of it's position
        moduleCenterX= modules[i][j].x+modules[i][j].w/2;
        moduleCenterY= modules[i][j].y+modules[i][j].h/2;
        
        modules[i][j].cX = moduleCenterX;
        modules[i][j].cY = moduleCenterY;
      } 
    }
  }
  
  void display()
  {
    canvas.noFill();
//    canvas.fill(0,0,100,1);
    canvas.strokeWeight(10);
    canvas.stroke(0, 100, 100, 20);
    
    // draw the big bounding box
    canvas.rect(pageMargin, pageMargin, canvas.width - (2*pageMargin), canvas.height - (2*pageMargin));
    
    // draw all modules
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        new Hexagon(modules[i][j].cX, modules[i][j].cY, modules[i][j].w);
      } 
    }
    
     for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
//        canvas.rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
//        canvas.ellipse(modules[i][j].cX,modules[i][j].cY,30,30);
      } 
    }
    
  }
}
