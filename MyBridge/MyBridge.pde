import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Bridge br;

ArrayList<Mover> mover;

void setup()
{
  size(800,600,P2D);
  smooth();
  
  mover = new ArrayList<Mover>();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  //box2d.setGravity(0,-3);
  br = new Bridge();

}



void draw()
{
 background(255);
 br.run();
 box2d.step();
 float prob = random(1);
 if (mousePressed && prob < 0.5) mover.add(new MoverRect(new Vec2(mouseX,mouseY), random(2,8)));
 else if(mousePressed && prob > 0.5) mover.add(new WeirdShape(new Vec2(mouseX,mouseY)));
 for(Mover m : mover) m.display();
 
 
}