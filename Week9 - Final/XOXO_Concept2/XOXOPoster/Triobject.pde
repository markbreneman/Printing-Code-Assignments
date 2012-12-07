class Triobject
{
  PVector Point1, Point2, Point3;
  color tri;
  float dir; 
  float triangleSize; 

  Triobject(PVector _start, float _size, color _c, float _dir) 
  {
    tri = _c; 
    dir = _dir;
    triangleSize=_size;
    Point1=_start;

    //Zero indicates triangles pointing right
    if (dir==0) {
      Point2 = new PVector(Point1.x, Point1.y+triangleSize);
      Point3 = new PVector(
               Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
               Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
               );
    }

    //Zero indicates triangles pointing left
    if (dir==1) {
      Point2 = new PVector(Point1.x, Point1.y-triangleSize);
      Point3 = new PVector(
               Point1.x + (cos(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y)), 
               Point1.y + (sin(atan2(Point2.y-Point1.y, Point2.x-Point1.x)-PI/3) * dist(Point1.x, Point1.y, Point2.x, Point2.y))
               );
    }

    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
  }
  void display() {
    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(Point1.x, Point1.y, Point2.x, Point2.y, Point3.x, Point3.y);
  }
  void update(float _size) {
    triangleSize=_size;
  }
}

//boolean SameSide(PVector p1, PVector p2, PVector a, PVector b) {
//  b = PVector.sub(b,a);
//  p1 = PVector.sub(p1,a);
//  p2 = PVector.sub(p2,a);
// 
//  cp1 = b.cross(p1);
//  cp2 = b.cross(p2);
//
//  if ((cp1.dot(cp2)) >= 0) {
//    return true;
//  }
//  else
//    return false;
//}
//
//boolean PointInTriangle(PVector p,PVector a,PVector b,PVector c) {
//  if (SameSide(p,a, b,c) && SameSide(p,b, a,c) && SameSide(p,c, a,b)) {
//    fill(255,0,0);
//    return true;
//  }
//  else
//    fill(255,255,255);
//  return false;
//}

