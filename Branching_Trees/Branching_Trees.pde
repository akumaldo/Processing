Branch b;

void setup()
{  
  b = new Branch(new PVector(width/2, height-150));
  size(1000,600);

}
void draw()
{
  float theta = map(mouseX,0,width,0, PI/2); 
  background(0);
  translate(width/2,height);
  b.generate(180,theta);
}