int radius;

void setup(){  
size(300,300);
background(0, 0, 0, .08);  
smooth();
radius=75;
}

void draw(){
smooth();
fill(255, 255, 255);
ellipseMode(CENTER);
ellipse(width/2,height/2-radius/5,radius,radius);
strokeWeight(2);
fill(255, 255, 255); 
triangle(width/2-radius/2-3,height/2,width/2+radius/2+3,height/2,width/2,height/2+100);
translate(width/2,height/2);
rotate(PI/5);
rectMode(CENTER);
rect(0,-55,15,45);
}
