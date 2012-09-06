int radius;

void setup(){  
size(300,300);
background(0, 0, 0);  
smooth();
radius=75;
}

void draw(){
smooth();
fill(255, 255, 255);
ellipseMode(CENTER);
ellipse(width/2,height/2-15,radius+5,radius+5);
strokeWeight(2);
fill(255, 255, 255); 
triangle(width/2-radius/2-3,height/2,width/2+radius/2+3,height/2,width/2,height/2+radius*1.5);
rectMode(CENTER);
rect(width/2,height/2,radius+15,22);

}
