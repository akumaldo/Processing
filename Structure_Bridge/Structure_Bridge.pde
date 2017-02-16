import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;


VerletPhysics2D physics;

float GRAVITY_ = 0.3;

Bridge bridge;

Circle[] circle;

void setup()
{
  size(1000,800,P2D);
  physics = new VerletPhysics2D();
  bridge = new Bridge();
  circle = new Circle[4];
  
  circle[0] = new Circle(new Vec2D(width/2, 100), (int)random(10,50));
  circle[1] = new Circle(new Vec2D(width/4, 100),(int)random(10,50));
  circle[2] = new Circle(new Vec2D(width/8, 100),(int)random(10,50));
  circle[3] = new Circle(new Vec2D(width/16, 100),(int)random(10,50));
  
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,GRAVITY_)));
  
  physics.setWorldBounds(new Rect(0,0,width,height));
}


void draw()
{
  background(255);
  
  physics.update();

    
  bridge.run();
  
  for (Circle c: circle) c.run();
  
  for(VerletSpring2D s : physics.springs) 
  {
    stroke(0);
    line(s.a.x,s.a.y, s.b.x, s.b.y); 
  }
}

void mousePressed()
{ 
  
  for (Circle c: circle) c.contains(mouseX,mouseY);
  
}

void mouseReleased()
{
  for (Circle c: circle) c.release();
}