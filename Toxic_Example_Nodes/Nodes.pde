class Nodes extends VerletParticle2D
{
    
  color col = color(random(255));
  
  boolean dragging = false;
  
  float r;
  
  Nodes(Vec2D pos)
  {  
    super(pos);
    col = color(random(255));
    physics.addBehavior(new AttractionBehavior2D(this, 40,-100));
    
  }
  
  
    Nodes(int x, int y)
  {  
    super(x,y);
    col = color(random(255));
    //physics.addBehavior(new AttractionBehavior2D(this, 40,-50));
    
  }
  
   void display(float r_)
  {
    r = r_;
    if (!dragging)
    {
      fill(col);
      ellipse(x,y, r*2, r*2);
    }else
    {
      fill(150,0,0);
      ellipse(x,y, r*3, r*3);
    }
      
  }
}