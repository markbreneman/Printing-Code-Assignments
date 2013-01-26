class Triobject
{
  PVector Point1, Point2, Point3, centerPoint, OuterPoint, crossProduct1, crossProduct2;
  color tri;
  float triangleSize, triRadius, dir; 
  int colorCount;

  Triobject(PVector _start, float _size, color _c, float _dir) 
  {
    tri = _c; 
    dir = _dir;
    triangleSize=_size;
    Point1=_start;
    //    OuterPoint = new PVector(0,0);

    //Zero indicates triangles pointing right
    if (dir==0) {
      Point2 = new PVector(Point1.x, Point1.y+triangleSize);
      Point3 = new PVector(
      Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
      Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
        );
      //      centerPoint = new PVector(0,0);
      centerPoint = new PVector(Point1.x+triHeight*1/3, Point1.y-triSize/2);
    }

    //Zero indicates triangles pointing left
    if (dir==1) {
      Point2 = new PVector(Point1.x, Point1.y-triangleSize);
      Point3 = new PVector(
      Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
      Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
        );
      //     centerPoint = new PVector(0,0); 
      centerPoint = new PVector(Point1.x-triHeight*1/3, Point1.y-triSize/2);
    }
    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
  }
  void display() {
    canvas.noStroke();

    // The color changes based on the state of the click
    if (colorCount==1) {
      canvas.fill(c2);
    } 
    else if (colorCount==2) {
      canvas.fill(c2);
    }
    else if (colorCount==3) {
      canvas.fill(c2);
    }
    else if (colorCount==4) {
      canvas.fill(c2);
    }
    else if (colorCount==5) {
      canvas.fill(c2);
    }
    else {
      canvas.fill(tri);
    }
    
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
    canvas.stroke(0);
    triRadius = sqrt(3)/6*triSize*3;//Should be just triSize not triSize*3 but this will make changing easier

    ///DEBUG MOUSE AREAS
    //    canvas.fill(0,87,96);
    //    canvas.ellipse(centerPoint.x, centerPoint.y, triRadius*2, triRadius*2);
  }

  void click(float mx, float my) {
    float distance = dist(mx, my, centerPoint.x, centerPoint.y);

    // Check to see if a point is inside the rectangle
    if (distance < triRadius) {
      colorCount+=1;
      if (colorCount==5) {
        colorCount=0;
      }
    }
  }
}

