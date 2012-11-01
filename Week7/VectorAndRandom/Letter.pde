class Letter {

  float x;
  float y;
  float w;
  float h;
  //  float r;
  float cx;
  float cy;
  String  c;
  Vec2D Center;
  Vec2D bottomCenter;

  Letter() {
  }

  Letter(float _x, float _y, float _w, float _h, String _c) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    cx=x+w/2;
    cy=y+h/2;
    c=_c;
    Center= new Vec2D(cx, cy);
    bottomCenter=new Vec2D(cx, (y+h));
  }

  void display() {
    canvas.strokeWeight(20);
    canvas.stroke(0, 0, 0);
    canvas.noFill();
    canvas.rect(x, y, w, h);

    //Get the Center of the Passed In Character
    RGroup grp;
    grp = TungstenBold.toGroup(c);
    grp = grp.toPolygonGroup();
    Vec2D Center = new Vec2D(grp.getCenter().x, grp.getCenter().y);

    canvas.pushMatrix();
    canvas.translate(cx-Center.x, cy+abs(Center.y));
    canvas.noStroke();
    canvas.fill(0, 0, 0);

    TungstenBold.draw(c, canvas);
    canvas.popMatrix();
  }

  void create() {
    float LetterSpacing=gridN2.modules[2][6].w; 
    lettersArray=new ArrayList();
    for (int i=0; i<numbersOfLetters;i++) {
      lettersArray.add(
      new Letter(
      gridN2.modules[2][6].x-gridN2.modules[2][6].w/4+i*LetterSpacing+i*(gridN2.modules[2][6].w*2.5), 
      gridN2.modules[2][6].y, 
      gridN2.modules[2][6].w*2.5, 
      gridN2.modules[2][6].h*6, 
      "W")); 
    }
    
    for (int i=0; i<lettersArray.size(); i++) {
     Letter l= (Letter) lettersArray.get(i);
     letterPoints.add(l.bottomCenter); 
    }
    
  }
}
