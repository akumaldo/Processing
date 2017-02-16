import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;


VerletPhysics2D physics;

float GRAVITY_ = 1;

Curtains curtain;

Particles p;

void setup()
{
  
  size(1000,800,P2D);
  physics = new VerletPhysics2D();
  
  p = new Particles(100,50);
  physics.addParticle(p);
  
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,GRAVITY_)));
  
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  
  curtain = new Curtains();
  
}
void draw()
{
  background(255);
  physics.update();

  curtain.run();  
  
  p.unlock();
  
  p.display(50);
 

}

void mousePressed()
{ 
    float dist = dist(p.x,p.y,mouseX,mouseY);
    if (dist < 100)
      { 
        
        p.set(mouseX,mouseY);
        p.lock();
      }
}

void mouseDragged()
{
    float dist = dist(p.x,p.y,mouseX,mouseY);
    if (dist < 100)
      { 
        
        p.set(mouseX,mouseY);
        p.lock();
      }
}

void mouseReleased()
{
  p.unlock();
}