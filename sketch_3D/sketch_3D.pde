PImage DiamondOre;
PImage Dirt;
PImage GrassSide;
PImage GrassTop;

float rotx, roty;

void setup(){
  
  size(800,800,P3D);
  DiamondOre = loadImage("DiamondOre.png");
  Dirt = loadImage("Dirt.png");
  GrassSide = loadImage("GrassSide.png");
  GrassTop = loadImage("GrassTop.png");
  textureMode(NORMAL);
}

void draw(){
  background(0);

  textureCube(width/2,height/2,0,DiamondOre,DiamondOre,DiamondOre,100);
  textureCube(100,height/2,0,GrassTop,GrassSide,Dirt,100);
  
}

void cube(float x, float y,float z,color c,float size){
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  stroke(0);
  strokeWeight(3);
  fill(c);
  box(size);
  popMatrix();
}

void Sphere(float x, float y,float z,color c,float size){
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  stroke(0);
  strokeWeight(3);
  fill(c);
  sphere(size);
  popMatrix();
}

void textureCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size){
  pushMatrix();
  translate(x, y,z);
  noStroke();
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
   beginShape(QUADS);
   texture(top);
   
   //top  x y z tx ty
   vertex(0,0,0,0,0);
   vertex(1,0,0,1,0);
   vertex(1,0,1,1,1);
   vertex(0,0,1,0,1);
   
   endShape();
   
  beginShape(QUADS);
  texture(bottom);
   //bottom
   vertex(0,1,0,0,0);
   vertex(1,1,0,1,0);
   vertex(1,1,1,1,1);
   vertex(0,1,1,0,1);
     endShape();
     
  beginShape(QUADS);
  texture(side);
   //front
   vertex(0,0,1,0,0);
   vertex(1,0,1,1,0);
   vertex(1,1,1,1,1);
   vertex(0,1,1,0,1);
   
   //back
   vertex(0,0,0,0,0);
   vertex(1,0,0,1,0);
   vertex(1,1,0,1,1);
   vertex(0,1,0,0,1);
   
   //left
   vertex(0,0,0,0,0);
   vertex(0,0,1,1,0);
   vertex(0,1,1,1,1);
   vertex(0,1,0,0,1);
   
   //right
   vertex(1,0,0,0,0);
   vertex(1,0,1,1,0);
   vertex(1,1,1,1,1);
   vertex(1,1,0,0,1);

   endShape();
  
  popMatrix();
}

void mouseDragged(){
    rotx = rotx + (pmouseY - mouseY) * 0.01;
    roty = roty + (mouseX - pmouseX) * 0.01;
  
}
