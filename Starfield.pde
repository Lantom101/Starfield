PImage img;
Particle [] bob;
void setup()
{
  size(400,400);
  img = loadImage("cupcake.png");
  noStroke();
  bob = new Particle[500];
  bob[0] = new OddballParticle();
  for (int i = 1; i < bob.length; i++){
    bob[i] = new Particle();
  }
}
void draw()
{
  background(255);
  for (int i = 1; i < bob.length; i++){
    bob[i].move();
    bob[i].show();
  }
  bob[0].move();
  bob[0].show();
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor, mySize;
  
  Particle(){
    myX = 200;
    myY = 200;
    myAngle = (Math.random()*360);
    mySpeed = (Math.random()*3);
    mySize = 10;
    myColor = color((int)(Math.random()*256),
                    (int)(Math.random()*256),
                    (int)(Math.random()*256));
  }
  void move(){
    myX += (Math.cos(myAngle) * mySpeed);
    myY += (Math.sin(myAngle) * mySpeed);
    if ((myX > 400 || myX < 0) && (myY > 400 || myY < 0)){
      myX = 200;
      myY = 200;
    }
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize); 
  }
  
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle() {
    myX = 200;
    myY = 200;
    myColor = 0;
    mySize = 50;
  }
  void move(){
    myX += 1;
    if (myX > 400){
      myX = 0;
    }
  }
  void show() {
  image(img, (float)myX-25, (float)myY-25, (float)50, (float)50); 
  }
} 
