void setupParams() {
  //FONTS AND ARTWORK
  font1 = loadFont("Tungsten-Medium-48.vlw");
  font2 = loadFont("Atrament-Medium-48.vlw");
  font3 = loadFont("Atrament-MediumItalic-48.vlw");

  //SETUP COLORS
  colors = new ArrayList();
  c1 = color(346.55, 10.65, 13.75); // Black for print
  colors.add(c1);
  c2 = color(0, 0, 100); // White for print
  colors.add(c2);
  c3 = color(196, 100, 93); //Deeper Blue
  colors.add(c3);
  c4 = color(199, 59, 100); // Blue
  colors.add(c4); 
  c5 = color(267.72, 60.66, 59.07);// Purple
  colors.add(c5);
  c6 = color(279, 100, 62);//Deeper Purple
  colors.add(c6);

  //SETUP MANUSCRIPT GRID
  gridCols=1;
  gridRows=1;
  gridGutter=100;
  gridPMWidth=100;
  gridPMHeight=60;

  // COLUMNS,ROWS GUTTTERSIZE, PAGEMARGIN WIDTH, PAGEMARGIN HEIGHT
  grid = new ModularGrid(gridCols, gridRows, gridGutter, gridPMWidth, gridPMHeight, .5);


  //SETUP COPY
  title = "XOXO";
  titlePos=new PVector(random(300, canvas.width-textWidth(title)), random(125, canvas.height));
  titleSize=1510;

  tagline = "An arts and technology festival"+"\n"+"celebrating disruptive creativity.";
  taglinePos=new PVector(random(300, canvas.width-textWidth(title)), random(125, canvas.height));
  taglineSize=200;

  details = "YALE UNION CONTEMPORARY"+"\n"+"PORTLAND, OR" +"\n" + "SEPTEMBER 13-16 2013";
  detailsPos=new PVector(random(grid.modules[0][0].x, grid.modules[0][0].x+grid.modules[0][0].w), random(grid.modules[0][0].x, grid.modules[0][0].y+grid.modules[0][0].h));
  detailsSize=235;
}

