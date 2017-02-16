
CA ca;

int delay = 0;

void setup()
{
  size(800, 600);
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  ca = new CA(ruleset);
  background(255);
  frameRate(30);
}


void draw()
{
  ca.display();
  ca.populate();
  
  if(ca.finished())
  {
   delay++;
    if (delay > 30) 
    {
      background(255);
      ca.randomize();
      ca.restart();
      delay = 0;
    }
  }
}
   
  
    
  



void mousePressed() 
{
  background(255);
  ca.randomize();
  ca.restart();
}