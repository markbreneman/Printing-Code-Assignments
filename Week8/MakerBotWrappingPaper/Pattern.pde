class Pattern
{
  PVector loc;
  PVector area;

  float a;
  float b;
  float c;
  float d;

  Pattern(float _x, float _y, float _w, float _h, int _siz)
  {
    loc = new PVector(_x, _y);
    //    area = new PVector(_w, _h);
    area = new PVector(_w+_siz*2, _h+_siz*2);

    a = _siz;//200
    b = _siz * 2;//400
    c = _siz * 3;//600
    d = _siz * 4;//800
  }

  void display()
  {
//    canvas.pushMatrix();
    canvas.translate(loc.x, loc.y);
    int row = 0;
    for (float y = 0; y <= area.y; y += b*4) 
    {
      for (float x = 0; x <= area.x*2; x += d*4+b*2)
      {
        
        canvas.pushMatrix();
//        if((y/c) % 2 == 0) canvas.translate(x + d, y);
//        else  canvas.translate(x, y);

//        if((y/c) % 2 == 0) canvas.translate(x, y);
//        else  canvas.translate(x + d, y);

//       canvas.translate(x, y);
         
         canvas.translate(x-d*row, y);

        ///LETTER M/////
        canvas.fill(c1);        
        canvas.quad(0, 0, d, -b, d, 0, 0, b);
        canvas.quad(0, 0, d/2, a, d/2, b*3+a, 0, b*3);
        canvas.quad(d, -b, d+b, -a, d+b, a, d, 0);
        canvas.quad(d+b, -a, d+b*2, -b, d+b*2, 0, d+b, a);
        canvas.quad(d+b*2, -b, d*2+b*2, 0, d*2+b*2, b, d+b*2, 0);
        canvas.quad(d+b*2+d/2, a, d*2+b*2, 0, d*2+b*2, b*3, d+b*2+d/2, b*3+a);

        canvas.fill(c2);
        canvas.quad(d/2, a, d/2, a+b, d, b*2, d, b );
        canvas.quad(d, b, d+b, a, d+b, a+b, d, b*2);
        canvas.quad(d+b, a, d+b*2, b, d+b*2, b*2, d+b, a+b);
        canvas.quad(d+b*2, b, d+b*2+d/2, a, d+b*2+d/2, a+b, d+b*2, b*2);

        ///LETTER B/////
        canvas.fill(c5);
        canvas.quad(d*2+b*2, a+b, d*3+b*2, b, d*3+b*2, b*2, d*2+b*2, b*3);
        canvas.fill(c4);        
        canvas.quad(d*2+b*2, 0, d*3+b*2, -b, d*3+b*2, 0, d*2+b*2, b);
        canvas.quad(d*2+b*2, 0, d*2+b*3, a, d*2+b*3, b*3+a, d*2+b*2, b*3);
        canvas.quad(d*2+b*2, b*2, d*3+b*2, b*3, d*3+b*2, b*4, d*2+b*2, b*3);
        canvas.quad(d*3+b*2, -b, d*4+b*2, 0, d*4+b*2, b, d*3+b*2, 0);
        canvas.quad(d*3+b*2, -b, d*4+b*2, 0, d*4+b*2, b, d*3+b*2, 0);
        canvas.quad(d*4+b*2, b*2, d*4+b*2, b*3, d*3+b*2, b*4, d*3+b*2, b*3);
        canvas.quad(d*3+b*2, b, d*4+b*2, b*2, d*4+b*2, b*3, d*3+b*2, b*2);
        canvas.quad(d*3+b*2, b, d*4+b*2, 0, d*4+b*2, b, d*3+b*2, b*2);
        canvas.quad(d*2+b*2, 0, d*3+b*2, b, d*3+b*2, b*2, d*2+b*2, b);
        canvas.popMatrix();
        
      }
      row++;
    }
//    canvas.popMatrix();
  }
}
