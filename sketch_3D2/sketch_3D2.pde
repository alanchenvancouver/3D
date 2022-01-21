import java.awt.Robot;

color black = #000000;
color white = #FFFFFF;
color red = #FF0000;
color blue = #0000FF;

int gridSize;
PImage map;
PImage DiamondOre;
PImage Dirt;
PImage Glass;
PImage GrassSide;
PImage GrassTop;
PImage MossyStone;
PImage NetherPortal;


Robot rbt;

boolean wkey, akey,skey,dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;


void setup(){
  size(displayWidth,displayHeight, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 8*height/10;
  eyeZ  = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  
  map = loadImage("map.png");
 DiamondOre = loadImage("DiamondOre.png");
 Dirt = loadImage("Dirt.png");
 Glass = loadImage("Glass.png");
 GrassSide = loadImage("GrassSide.png");
 GrassTop = loadImage("GrassTop.png");
 MossyStone = loadImage("MossyStone.png");
 NetherPortal = loadImage("NetherPortal.png");
  gridSize = 100;
  
  
  leftRightHeadAngle = radians(270);
  
  try{
    rbt = new Robot();
  }
  catch(Exception e){
   e.printStackTrace(); 
  }
  
}

void draw(){
  background (0);
  pointLight(255,255,255,eyeX,eyeY,eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor();
  drawFocalPoint();
  controlCamera(); 
  drawMap();
}

void drawFloor(){
  background(0);
  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100){
    line(x,height,-2000,x,height,2000);
    line(-2000,height,x,2000,height,x);
  }
}

void drawFocalPoint(){
  pushMatrix();
  translate(focusX,focusY,focusZ);
  sphere(5);
  popMatrix();
}


void drawMap(){
  for(int x = 0; x < map.width; x++){
    for (int y = 0; y < map.height; y++){
      color c = map.get(x,y);
      if (c == white){
    textureCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,GrassTop,GrassSide,Dirt,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*6,y*gridSize-2000,Glass,Glass,Glass,gridSize);
      }
      
      if(c == black){
    textureCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,GrassTop,GrassSide,Dirt,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*2,y*gridSize-2000,DiamondOre,DiamondOre,DiamondOre,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*3,y*gridSize-2000,DiamondOre,DiamondOre,DiamondOre,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,DiamondOre,DiamondOre,DiamondOre,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*5,y*gridSize-2000,DiamondOre,DiamondOre,DiamondOre,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*6,y*gridSize-2000,Glass,Glass,Glass,gridSize);
      }
      
    if(c == red){
    textureCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,GrassTop,GrassSide,Dirt,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*2,y*gridSize-2000,NetherPortal,NetherPortal,NetherPortal,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*3,y*gridSize-2000,NetherPortal,NetherPortal,NetherPortal,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,NetherPortal,NetherPortal,NetherPortal,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*5,y*gridSize-2000,NetherPortal,NetherPortal,NetherPortal,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*6,y*gridSize-2000,Glass,Glass,Glass,gridSize);
      }
      
    if(c == blue){
    textureCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,GrassTop,GrassSide,Dirt,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*2,y*gridSize-2000,MossyStone,MossyStone,MossyStone,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*3,y*gridSize-2000,MossyStone,MossyStone,MossyStone,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,MossyStone,MossyStone,MossyStone,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*5,y*gridSize-2000,MossyStone,MossyStone,MossyStone,gridSize);
    textureCube(x*gridSize-2000,height-gridSize*6,y*gridSize-2000,Glass,Glass,Glass,gridSize);
      }
      
      
      
    }
  }    
}






void controlCamera(){
  
  if(wkey) {
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
  }
  if(skey){
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
  }
  if(akey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
  }
  if(dkey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
  }
  
  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
  upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  if(upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if(upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;
  
  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  
  if(mouseX > width-2)rbt.mouseMove(3,mouseY);
  else if (mouseX < 2)rbt.mouseMove(width-3,mouseY);
  
}



void keyPressed(){
  if(key == 'W' || key == 'w') wkey = true;
  if(key == 'A' || key == 'a') akey = true;
  if(key == 'D' || key == 'd') dkey = true;
  if(key == 'S' || key == 's') skey = true;
}

void keyReleased(){
  if(key == 'W' || key == 'w') wkey = false;
  if(key == 'A' || key == 'a') akey = false;
  if(key == 'D' || key == 'd') dkey = false;
  if(key == 'S' || key == 's') skey = false;
}
