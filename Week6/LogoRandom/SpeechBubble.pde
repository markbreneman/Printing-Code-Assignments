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
  float triPos;

  

  SpeechBubble(float _x, float _y, float _w, float _h, float _r, Module _module, int _tri)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r;
    mW = _module.w;
    mH = _module.h;
    float offsetW = w*.125;
    float offsetH = h*.35;
    triPos= _tri;

    CX=x+w/2;
    CY=y+h/2;
    Top=y;
    Bottom=y+h;

    canvas.rect(x, y, w, h, r);    
    
      
    if (triPos==1) {
    canvas.triangle(
    x+offsetW, Top, 
    x+offsetW*3, Top, 
    x+offsetW+(random(-100,-0)), Top-offsetH*2
    );
    }

    else if(triPos==2){
    canvas.triangle(
    CX-offsetW, Top, 
    CX+offsetW, Top, 
    CX, Top-offsetH*2
    );
    }

    else if(triPos==3){
    canvas.triangle(
    x+w-offsetW*3, Top, 
    x+w-offsetW, Top, 
    x+w-offsetW-(random(-100,-0)), Top-offsetH*2
    );
    }

    else if(triPos==4){
    canvas.triangle(
    x+offsetW, Bottom, 
    x+offsetW*3, Bottom, 
    x+offsetW+(random(-100,-0)), Bottom+offsetH*2
    );
    }

    else if(triPos==5){
    canvas.triangle(
    CX-offsetW, Bottom, 
    CX+offsetW, Bottom, 
    CX, Bottom+offsetH*2
    );
    }

    else if(triPos==6){
    canvas.triangle(
    x+w-offsetW*3, Bottom, 
    x+w-offsetW, Bottom, 
    x+w-offsetW-(random(-100,-0)), Bottom+offsetH*2
    );
    }
  }
}

