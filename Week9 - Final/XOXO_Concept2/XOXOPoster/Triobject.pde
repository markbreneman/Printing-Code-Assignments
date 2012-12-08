class Triobject
{
  PVector Point1, Point2, Point3, CenterPoint, OuterPoint, crossProduct1,crossProduct2;
  color tri;
  float dir; 
  float triangleSize; 

  Triobject(PVector _start, float _size, color _c, float _dir) 
  {
    tri = _c; 
    dir = _dir;
    triangleSize=_size;
    Point1=_start;
    OuterPoint = new PVector(0,0);

    //Zero indicates triangles pointing right
    if (dir==0) {
      Point2 = new PVector(Point1.x, Point1.y+triangleSize);
      Point3 = new PVector(
      Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
      Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
        );
      CenterPoint = new PVector(Point1.x+triHeight/2, Point1.y-triSize/2);
    }

    //Zero indicates triangles pointing left
    if (dir==1) {
      Point2 = new PVector(Point1.x, Point1.y-triangleSize);
      Point3 = new PVector(
      Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
      Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
        );
      CenterPoint = new PVector(Point1.x-triHeight/2, Point1.y+triSize/2);
    }

    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
  }
  void display() {
    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
    PVector currentMouse = new PVector(mouseX,mouseY);
    PointInTriangle(currentMouse, Point1, Point2, Point3);
//    SameSide(CenterPoint,OuterPoint, Point1, Point2);
    
  }

  boolean SameSide(PVector p1, PVector p2, PVector a, PVector b) {
    b = PVector.sub(b, a);
    p1 = PVector.sub(p1, a);
    p2 = PVector.sub(p2, a);

    crossProduct1 = b.cross(p1);
    crossProduct2 = b.cross(p2);

    if ((crossProduct1.dot(crossProduct2)) >= 0) {
      return true;
    }
    else
      return false;
  }

  boolean PointInTriangle(PVector p, PVector a, PVector b, PVector c) {
    if (SameSide(p, a, b, c) && SameSide(p, b, a, c) && SameSide(p, c, a, b)) {
      canvas.fill(255, 0, 0);
      println("firing!");
      return true;
    }
    else
      canvas.fill(255, 255, 255);
    return false;
  }



  void update(float _size) {
    triangleSize=_size;
  }
}


