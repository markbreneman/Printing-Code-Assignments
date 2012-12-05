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

    //VERTICAL STRIPE PARAMETERS
    stripeVX=modX;
    stripeVY=0;
    stripeVW=modW;
    stripeVH=modY+modH*2+gridN1Gutter;

    //HORIZONTAL STRIPE PARAMETERS
    stripeHX=0;
    stripeHY=modY;
    stripeHW=modX+modW*2+gridN1Gutter;
    stripeHH=modH;
  } 

  void display() {
    canvas.fill(255, 0, 0);
    setGradient(stripeVX, stripeVY, stripeVW, stripeVH, c1, c2, 0);
    setGradient(stripeHX, stripeHY, stripeHW, stripeHH, c1, c2, 1);

    //    canvas.rect(stripeVX, stripeVY, stripeVW, stripeVH);
    //    canvas.rect(stripeHX, stripeHY, stripeHW, stripeHH);
  }


  void setGradient(float x, float y, float w, float h, color c1, color c2, int axis ) {

    canvas.noFill();

    if (axis == 0) {  // Top to bottom gradient
      for (int i = int(y); i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        canvas.stroke(c);
        canvas.line(x, i, x+w, i);
      }
    }  
    else if (axis == 1) {  // Left to right gradient
      for (int i = int(x); i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        canvas.stroke(c);
        canvas.line(i, y, i, y+h);
      }
    }
  }
}
