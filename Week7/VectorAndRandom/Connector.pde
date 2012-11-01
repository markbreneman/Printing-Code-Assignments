class Connector {

  int index;
  ArrayList pointsArray;
  color colorChoice;

  Connector() {
  }

  Connector(int _index) {
    index=_index; 

    points = new ArrayList();

    for (int i = 0; i < 1; i++)
    {
      Vec2D p1 = selectedKeyPoints.get(index);
      Vec2D p2 = random1Points.get(index);
      Vec2D p3 = random2Points.get(index);
      Vec2D p4 = letterPoints.get(index);
      points.add(p1);
      points.add(p2);
      points.add(p3);
      points.add(p4);
      pointsList.add(points);
    }
   
  }

  void display(ArrayList _pointsArray) { 

     pointsArray = _pointsArray;

    Spline2D spline = new Spline2D(pointsArray);
    ArrayList<Vec2D> morePoints = (ArrayList) spline.computeVertices(30); // split each point into 30 (distance based on curve)
    
    canvas.strokeCap(SQUARE);
    canvas.noFill();

    int colorNum =int(random(6, 10));
    color[] Colors= {
      c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11
    };    
    //    println(colorNum);

    canvas.stroke(Colors[colorNum]);
    canvas.strokeWeight(50);

    // then draw them on the screen
    canvas.beginShape();

    for (int i = 0; i < morePoints.size(); i++)
    {
      Vec2D p = morePoints.get(i);
      canvas.vertex(p.x, p.y);
    }
    canvas.endShape();
  }
}

