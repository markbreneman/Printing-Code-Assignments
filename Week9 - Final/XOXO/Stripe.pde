class Stripes
{
  Module module;///may not be used?
  float modX;
  float modY;
  float modW;
  float modH;
  float stripeVX;
  float stripeVY;
  float stripeVW;
  float stripeVH;
  float stripeHX;
  float stripeHY;
  float stripeHW;
  float stripeHH;

  Stripes() {
  }

  Stripes(Module _module)
  { 
    modX = _module.x;
    modY = _module.y;
    modW = _module.w;
    modH = _module.h;
    
    int strokeFix=3; //Just to Cover up Stroke.
    //VERTICAL STRIPE PARAMETERS
    stripeVX=modX-strokeFix;
    stripeVY=0;
    stripeVW=modW+strokeFix*2;
    stripeVH=modY+modH*2+gridN1Gutter+strokeFix*2;

    //HORIZONTAL STRIPE PARAMETERS
    stripeHX=0;
    stripeHY=modY-strokeFix;
    stripeHW=modX+modW*2+gridN1Gutter+strokeFix*2;
    stripeHH=modH+strokeFix*2;
  } 

  void display() {

    setGradient(stripeHX, stripeHY, stripeHW, stripeHH, c3, c4, 1);
    setGradient(stripeVX, stripeVY, stripeVW, stripeVH, c3, c4, 0);
    
    canvas.shape(imgLogo,modX,modY,modW,modH);
//    canvas.blend(int(modX), int(modY), int(modW), int(modH), int(modX-30), int(modY-30), int(modW), int(modH), BLEND);

  }


void setGradient(float _x, float _y, float _w, float _h, color c3, color c4, int axis ) {

    canvas.noFill();

    if (axis == 0) {  // Top to bottom gradient
      for (int i = int(_y); i <= _y+_h; i++) {
        float inter = map(i, _y, _y+_h, 0, 1);
        color c = lerpColor(c3, c4, inter);
        canvas.stroke(c);
        canvas.line(_x, i, _x+_w, i);
      }
    }  
    else if (axis == 1) {  // Left to right gradient
      for (int i = int(_x); i <= _x+_w; i++) {
        float inter = map(i, _x, _x+_w, 0, 1);
        color c = lerpColor(c3, c4, inter);
        canvas.stroke(c);
        canvas.line(i, _y, i, _y+_h);
      }
    }
  }
}
