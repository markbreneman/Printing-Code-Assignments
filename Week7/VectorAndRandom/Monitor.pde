class Monitor {


  Monitor() {
  }

  void display() {
    canvas.stroke(0, 0, 0);
    canvas.strokeWeight(canvas.width/200);
    //Monitor
    int monRadius=70;
    int screenRadius=100;
    //Outer
    canvas.fill(208, 2, 51);
    canvas.rect(
    gridN1.modules[10][0].x, 
    gridN1.modules[10][0].h/2+gridPMHeight, 
    gridN1.modules[10][0].w*9.5, 
    gridN1.modules[10][0].h*6.5, 
    monRadius, monRadius, monRadius, monRadius);

    //Screen
    canvas.fill(47, 7, 96);
    canvas.rect(
    gridN1.modules[10][0].x+gridN1.modules[10][0].w/2, 
    gridN1.modules[10][1].h+gridPMHeight, 
    gridN1.modules[10][0].w*8.5, 
    gridN1.modules[10][0].h*5, 
    screenRadius, screenRadius, screenRadius, screenRadius);

    //STAND
    canvas.fill(216, 2, 75);
    canvas.quad(
    gridN1.modules[13][0].x+gridN1.modules[13][0].w/2, 
    gridN1.modules[13][7].y, 
    gridN1.modules[16][0].x-gridN1.modules[13][0].w/2, 
    gridN1.modules[16][7].y, 

    gridN1.modules[16][0].x+gridN1.modules[13][0].w/8, 
    gridN1.modules[16][8].y+gridN1.modules[13][0].h/4, 
    gridN1.modules[13][0].x-gridN1.modules[13][0].w/8, 
    gridN1.modules[13][8].y+gridN1.modules[13][0].h/4
      );

    canvas.rect(
    gridN1.modules[13][0].x-gridN1.modules[13][0].w/8, 
    gridN1.modules[13][8].y+gridN1.modules[13][0].h/4, 
    gridN1.modules[13][0].w*3.25, 
    gridN1.modules[13][0].h/4
      );
  }
}

