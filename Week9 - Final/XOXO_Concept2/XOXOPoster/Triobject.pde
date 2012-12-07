class Triobject
{
  float x1;
  float y1; 
  float x2;
  float y2;
  float x3;
  float y3;
  color tri;
  float dir; 

    Triobject(PVector _start, float _size, color _c, float _dir) 
  {
    tri = _c; 
    dir = _dir;
    //Zero indicates triangles pointing right
    if (dir==0) {
      x1 = _start.x;
      y1 = _start.y;
      x2 = _start.x;
      y2 = _start.y+triSize;
      x3 = x1 + (cos(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
      y3 = y1 + (sin(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
    }

    //Zero indicates triangles pointing left
    if (dir==1) {
      x1 = _start.x;
      y1 = _start.y;
      x2 = _start.x;
      y2 = _start.y-triSize;
      x3 = x1 + (cos(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
      y3 = y1 + (sin(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
    }
    canvas.noStroke();
    canvas.fill(tri);
    canvas.triangle(x1, y1, x2, y2, x3, y3);
  }
  void display() {
//    canvas.strokeWeight(1);
//    canvas.stroke(tri);
//    canvas.fill(tri);
//    canvas.triangle(x1, y1, x2, y2, x3, y3);
  }
}

