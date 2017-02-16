
Grid gol;

void setup()
{
 size(1000,800);
 background(255);
 smooth();
 frameRate(30);
 
 gol = new Grid();
 
 
}


void draw()
{
  gol.generate();
  gol.display();
}

void mousePressed()
{
  gol = new Grid();
}