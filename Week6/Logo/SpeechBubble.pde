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
    float offsetW = w*.125;
    float offsetH = h*.35;

    CX=x+w/2;
    CY=y+h/2;
    Top=y;
    Bottom=y+h;

    canvas.rect(x, y, w, h, r);    
    
//    println("CY= "+ CY);
//    println("bottom= "+ Bottom);
//    println("Top= "+ Top);
//    println("mH= "+ mH);
//    println("mW= "+ mW);
      println("CX= "+ CX);
      println("Break1= "+ mW*5/12+gridPMWidth/2);
      println("Break2= "+ mW*7/12+gridPMWidth/2);
      
      
     if (Top>mH/2+gridPMHeight/2) {

      //TOP TRIANGLES
      //LEFT
      if (CX<mW*5/12+gridPMWidth/2) {
        canvas.triangle(
        x+offsetW, Top, 
        x+offsetW*3, Top, 
        x+offsetW+(random(-75,0)), Top-offsetH*2
          );
      }

      //CENTER
      if (CX>mW*5/12+gridPMWidth/2 && CX<mW*9/12+gridPMWidth/2) {
        canvas.triangle(
        CX-offsetW, Top, 
        CX+offsetW, Top, 
        CX, Top-offsetH*2
          );
      }

      //RIGHT
      if (CX>mW*9/12+gridPMWidth/2) {
        canvas.triangle(
        x+w-offsetW*3, Top, 
        x+w-offsetW, Top, 
        x+w-offsetW-(random(-75,0)), Top-offsetH*2
          );
      }
    }

    else if (Top<mH/2+gridPMHeight/2) {
      //BOTTOM TRIANGLES
     //LEFT
      if (CX<mW*5/12+gridPMWidth/2) {
      canvas.triangle(
      x+offsetW, Bottom, 
      x+offsetW*3, Bottom, 
      x+offsetW+(random(-75,0)), Bottom+offsetH*2
        );
      }
      
      //CENTER
      if (CX>mW*5/12+gridPMWidth/2 && CX<mW*9/12+gridPMWidth/2) {
      canvas.triangle(
      CX-offsetW, Bottom, 
      CX+offsetW, Bottom, 
      CX, Bottom+offsetH*2
        );
      }
      
      //RIGHT
      if (CX>mW*9/12+gridPMWidth/2) {
      canvas.triangle(
      x+w-offsetW*3, Bottom, 
      x+w-offsetW, Bottom, 
      x+w-offsetW-(random(-75,0)), Bottom+offsetH*2
        );
      }
      
    }
  }
}

