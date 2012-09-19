class facet {
  float triangleX;
  float triangleY;
  float triangleWidth;
  float triangleHeight;

  facet(float triX, float triY, float triWidth, float triHeight) {
    triangleX=triX;
    triangleY=triY;
    triangleWidth=triWidth;
    triangleHeight=triHeight;
  }

  void display() {
    beginShape(TRIANGLES);
    for (int i=0; i<=2; i+=1) {
      if(i%2==0){fill(0); stroke(255);}
      else{fill(255);stroke(0);}

      vertex(triangleX+triangleWidth*i, triangleY);//point 1
      vertex(triangleX+triangleWidth, triangleY);//point 2 triangle is 50 wide
      vertex(triangleX+triangleWidth, triangleY-triangleHeight);//point 3 triangle is 50 high
    }
    endShape();
  }
}
