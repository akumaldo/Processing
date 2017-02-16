class Particles extends VerletParticle2D
{
    
  color col = color(random(255));
  
  Particles(float x, float y)
  {  
    super(x,y);
    col = color(random(255));
    physics.addBehavior(new AttractionBehavior2D(this, 40,-50));
    
  }
  
   void display(float r_)
  {
      stroke(0);
      strokeWeight(1);
      fill(150,0,0);
      ellipse(x,y, r_*2, r_*2);
      if (r_>0) display(r_-4);
  }
}