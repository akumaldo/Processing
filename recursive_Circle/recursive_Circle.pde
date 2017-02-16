Circle c;


void setup()
{
  
  size(1000,600);
  c = new Circle();
  
}
void draw()
{
  background(0); 
  c.run(width/2,height/2,300);
}