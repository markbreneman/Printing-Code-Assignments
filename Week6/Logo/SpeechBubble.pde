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
//  boolean used = false;
  
//  Speech() {}
 
  SpeechBubble(float _x, float _y, float _w, float _h, float _r, Module _module)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r;
    mW = _module.w;
    mH = _module.h;
    float offset = w*.125;
    
    CX=x+w/2;
    CY=y+h/2;
    Top=y;
    Bottom=y+h;
    
    canvas.rect(x,y,w,h,r);    
    
    canvas.triangle(
    x+offset,Top, 
    x+offset*2, Top,
    x+offset,Top-offset*2
    );
    
    canvas.triangle(
    CX-offset,Top, 
    CX+offset, Top,
    CX,Top-offset*2
    );
    
    
    canvas.triangle(
    w-offset*2,Top, 
    w-offset, Top,
    w-offset,Top-offset*2
    );
    
    
  } 
}
