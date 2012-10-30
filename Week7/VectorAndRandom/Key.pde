class Key {

  float x;
  float y;
  float w;
  float h;
  float r;
  float cx;
  float cy;
  String  c;
  
  Key() {}
  
  Key(float _x, float _y, float _w, float _h, String _c) {
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r=20;
    cx=x+w/2;
    cy=y+h/2;
    c=_c;  
    
    canvas.rect(x,y,w,h,r,r,r,r);
    
    //Get the Center of the Passed In Character
    RGroup grp;
    grp = font.toGroup(c);
    grp = grp.toPolygonGroup();
    PVector Center = new PVector(grp.getCenter().x,grp.getCenter().y);
    
    canvas.pushMatrix();
    canvas.translate(cx-Center.x,cy+abs(Center.y));
    canvas.strokeWeight(5);
    canvas.fill(0,0,100);
          
    font.draw(c,canvas);
    canvas.popMatrix();
        
  }
  
}
