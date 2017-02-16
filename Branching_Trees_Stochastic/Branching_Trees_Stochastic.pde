Branch b;

float size = random(100,400);


void setup()
{  
  background(0);
  size(1000,1000);
  newTree();

}
void draw()
{
 if (mousePressed)
 {
  pushMatrix();
  newTree();
  println("bla");
  popMatrix();
 }
}

void newTree()
{
  background(0);
  
  stroke(255);
  
  size = random(60,150);
  
  b = new Branch(new PVector(width/2, height-150));
  
  translate(width/2,height);
  
  b.generate((int)size);
  
}