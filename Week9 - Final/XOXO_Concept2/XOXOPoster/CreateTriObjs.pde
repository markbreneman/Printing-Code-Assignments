void createTriObjs() {
  //SETUP TRIANGLE OBJECTS
  triSize=300;
  triHeight=sqrt(3)/2*(triSize);
  color c7 = colors.get(int(random(2, 6)));
  //Calculate Max Objects per Width/Height  
  //  println("w increments" + canvas.width/triSize);
  //  println("h increments" + canvas.height/triSize);

  //RIGHTPOINT TRIANGLES  
  for (int j = 0;j<grid.modules[0][0].w/triSize+11; j++) {
    for (int i = 0; i<grid.modules[0][0].h/triSize+11; i++) {  
      PVector startPoint=new PVector(0, 0);//Initialized Locally

      //////COLOR SELECTIONS
      //EVEN COL AND ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(3);
      }
      //EVEN COL AND ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(4);
      }
      //ODD COL AND EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(4);
      }
      //ODD COL AND ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(4);
      }
      ///////STAGGER COL POSITIONS
      if (j%2==0) {
        startPoint = new PVector(grid.modules[0][0].x+j*triHeight, grid.modules[0][0].y+i*triSize);
      }
      else if (j%2!=0) {
        startPoint = new PVector(grid.modules[0][0].x+j*triHeight, grid.modules[0][0].y-triSize/2+i*triSize);
      }
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 0);
      triangleObjects.add(tmpTri);
    }
  }
  //LEFTPOINT TRIANGLES
  for (int j = 0;j<grid.modules[0][0].w/triSize+11; j++) {
    for (int i = 0; i<grid.modules[0][0].h/triSize+11; i++) {

      PVector startPoint=new PVector(0, 0);//Initialized Locally

      //////COLOR SELECTIONS
      //EVEN COL AND ROW
      if (j%2==0 && i%2==0) {
        c7 = colors.get(2);
      }
      //EVEN COL AND ODD ROW
      else if (j%2==0 && i%2!=0) {
        c7 = colors.get(5);
      }
      //ODD COL AND EVEN ROW
      else if (j%2!=0 && i%2==0) {
        c7 = colors.get(3);
      }
      //ODD COL AND ROW
      else if (j%2!=0 && i%2!=0) {
        c7 = colors.get(5);
      }
      ///////STAGGER COL POSITIONS
      if (j%2==0) {
        startPoint = new PVector(grid.modules[0][0].x+triHeight+j*triHeight, grid.modules[0][0].y-triSize/2+i*triSize);
      }
      else if (j%2!=0) {
        startPoint = new PVector(grid.modules[0][0].x+triHeight+j*triHeight, grid.modules[0][0].y+i*triSize);
      }
      //CREATE OBJECTS
      tmpTri = new Triobject(startPoint, triSize, c7, 1);
      triangleObjects.add(tmpTri);
    }
  }
}

