class Particles extends VerletParticle2D
{
    
  float r;
  color col = color(random(255));
  boolean dragging = false;
  
  Particles(float x, float y)
  {
    
    super(x,y);
    r = 3;
    dragging = false;
    col = color(random(255));
    physics.addBehavior(new AttractionBehavior2D(this, 4,-2));
    
  }
  
   void display()
  {
    if (!dragging)
    {
    r = 5;
    stroke(0);
    strokeWeight(1);
    fill(col);
    ellipse(x,y, r*2, r*2);
    }else
    {
      stroke(0);
      strokeWeight(1);
      fill(150,0,0);
      ellipse(x,y, r*3, r*3);
    }
      
  }
}