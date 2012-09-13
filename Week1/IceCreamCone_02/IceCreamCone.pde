class IceCreamCone {
  int diameter;
  int radius;
  int cX;
  int cY;

  IceCreamCone(int scoopDia, int scoopX, int scoopY) {
    diameter=scoopDia;
    radius=diameter/2; 
    cX=scoopX;
    cY=scoopY;
  }

  void display() { 
    canvas.strokeWeight(diameter/35);
    canvas.fill(255);

    //Ice Cream
    canvas.ellipseMode(CENTER);
    canvas.ellipse(cX, cY, diameter, diameter);

    //Cone
    canvas.triangle(
    cX-diameter*.525, cY+radius*.25, 
    cX+diameter*.525, cY+radius*.25, 
    cX, cY+1.55*diameter);
    
    //Cookie
    canvas.pushMatrix();
    canvas.translate(cX, cY);
    canvas.rotate(-PI/4);
    canvas.rectMode(CENTER);
    canvas.rect(diameter/2,0, diameter*.5, diameter*.15);
    canvas.popMatrix();
  }
}

