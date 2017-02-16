class Particles
{
PVector loc, vel, acc;
float r;
float fade;

    Particles()
    {
      loc = new PVector(width/2, 50);
      vel = new PVector(random(-1, 1), random(-1,0));
      acc = new PVector();
      r = random(2,9);
      fade = 255;
    }
  
    Particles(PVector loc_, float size)
    
    {
      loc = loc_.get();
      vel = new PVector(random(-1, 1), random(-1,0));
      acc = new PVector(0, 0.07);
      r = size;
      fade = 250;
      
    }
    
  void applyForce(PVector force)
  {
    acc.add(PVector.div(force,r));
  }
  
  void update()
  {
    vel.add(acc);
    loc.add(vel);
    
    
    fade -= 2;
    
    acc.mult(0);
  }
  
  boolean isDead()
  {
    if (fade <= 0) return true; 
    else return false;
  }
  
  
  void display()
  {
   stroke(0, fade);
   fill(150, fade);
   
   ellipse(loc.x, loc.y, r*2, r*2);
    
  }
}