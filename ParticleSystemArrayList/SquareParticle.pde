class SquareParticle extends Particles
{
  float angle = PI/4;
  
  
   SquareParticle(PVector loc_, float size)
    {
    super(loc_, size);
    }
  
  
  
  void display()
  {
   pushMatrix();
   translate(loc.x, loc.y);
   rectMode(CENTER);
   stroke(0, fade);
   fill(150, fade);
   rotate(angle);
   rect(0, 0, r*2, r*2);
   popMatrix();
   angle += 0.2;
  }
  
}