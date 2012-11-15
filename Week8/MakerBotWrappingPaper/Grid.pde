class ModularGrid
{
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  float pageMarginW;
  float pageMarginH;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;
  float startX;
  float startY;
  float modW;
  float modH;
  
  ///CREATE A MODULE GRID
 ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;
    
    modules = new Module[cols][rows];
    
    // cache the width of entire grid. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)canvas.width - (2*pageMargin));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;
    
    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)canvas.height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      } 
    }
  }
  ///CREATE A NESTED MODULE GRID
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
  
  
  ///CREATE A MODULAR GRID WITH STARTX & Y and HEIGHT & WIDTH 
  ModularGrid(
      int _cols, 
      int _rows, 
      float _gutterSize, 
      float _pageMarginW, 
      float _pageMarginH, 
      float _startX, 
      float _startY, 
      float _width, 
      float _height )
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMarginW = _pageMarginW;
    pageMarginH = _pageMarginH;
    startX = _startX;
    startY = _startY;
    modW = _width;
    modH = _height;
    
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
 
  
  void display()
  {
    canvas.noFill();
    
    // draw the big bounding box
     canvas.rect(pageMargin, pageMargin, canvas.width - (2*pageMargin), canvas.height - (2*pageMargin));
    
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
