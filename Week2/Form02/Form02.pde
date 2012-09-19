facet [] bottomfacets = new facet[3];
facet [] topfacets = new facet[2];
facet bottomdiamond;
facet bottomdiamond2;
facet bottomdiamond3;

int x0 = 100;
int y0 = 500;

void setup() {
  size(1000, 1000);
  background(0);
  int twidth=60;
  int theight=75;
  smooth();

  int xboffset = x0;
  for (int i=0; i<bottomfacets.length; i++) {  
    bottomfacets[i] = new facet(xboffset, y0, twidth, theight);
    xboffset += twidth*2;
//        if(i%2==0){fill(0); stroke(255);}
//        else{fill(255);stroke(0);}
    bottomfacets[i].display();
  }
  pushMatrix();
  translate(x0, y0);
  rotate(-PI);
  int xtoffset = -twidth*5;
  
  for (int i=0; i<topfacets.length; i++) {
    topfacets[i] = new facet(xtoffset, theight-1, twidth, theight);
      //    if(i%2==0){fill(0); stroke(255);}
      //    else{fill(255);stroke(0);}
    topfacets[i].display();
    xtoffset += twidth*2;
  }
  popMatrix();

  pushMatrix();
  translate(x0, y0);
  rotate(-PI);
  bottomdiamond = new facet(0,0,-twidth*bottomfacets.length,theight*3);
  bottomdiamond.display();
  popMatrix();

///hmmm what about once more set of facets?  
  pushMatrix();
  translate(x0+twidth, y0);
  rotate(-PI);
  bottomdiamond2 = new facet(0,0,-twidth*2,theight*3);
  bottomdiamond2.display();
  popMatrix();
  
///even one more set of facets?...nah to many...
//  pushMatrix();
//  translate(x0+twidth*2, y0);
//  rotate(-PI);
//  bottomdiamond3 = new facet(0,0,-twidth,theight*3);
//  bottomdiamond3.display();
//  popMatrix();
}



