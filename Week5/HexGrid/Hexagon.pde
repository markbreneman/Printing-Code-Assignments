class Hexagon
{
  float x;
  float y;
  float d;
  

  Hexagon() {
  }

  Hexagon(float _cX, float _cY, float _d)
  {
    x = _cX;
    y = _cY; 
    d = _d;
    
  float numVertices = 6;
  float vertexDegree = 360 / numVertices;
  
//  canvas.ellipse(x,y,30,30);
  
  canvas.beginShape();
  for(int i = 0; i < numVertices; i++)
  {
    float vX = x+cos(radians(i * vertexDegree)) * d/2;
    float vY = y+sin(radians(i * vertexDegree)) * d/2;
    canvas.vertex(vX, vY);
  }
  
  canvas.endShape(CLOSE);
  
  }
}

