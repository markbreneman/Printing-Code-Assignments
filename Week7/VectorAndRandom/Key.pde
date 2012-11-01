class Key {

  float x;
  float y;
  float w;
  float h;
  float r;
  float cx;
  float cy;
  Vec2D Center;
  String  c;
  color keyColor;
  float percentage;
  boolean selected;
  boolean used;
  
  
  Key(float _x, float _y, float _w, float _h, String _c) {
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r=20;
    cx=x+w/2;
    cy=y+h/2;
    Center=new Vec2D(cx,cy+20);
    c=_c;
//    keyColor=c1;
    selected=false;
    used=false;
    
    
  }
  
  void display() {
  canvas.strokeWeight(7);
  canvas.fill(keyColor);
  canvas.rect(x,y,w,h,r,r,r,r);
    
    //Get the Center of the Passed In Character
    RGroup grp;
    grp = GothamBold.toGroup(c);
    grp = grp.toPolygonGroup();
    Vec2D Center = new Vec2D(grp.getCenter().x,grp.getCenter().y);
    
    canvas.pushMatrix();
    canvas.translate(cx-Center.x,cy+abs(Center.y));
    canvas.strokeWeight(5);
    canvas.fill(0,0,100);
          
    GothamBold.draw(c,canvas);
    canvas.popMatrix();
  }
}
