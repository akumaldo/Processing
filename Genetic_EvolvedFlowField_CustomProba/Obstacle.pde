class Obstacle
{
 
  Rectangle r;
  

 Obstacle(int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
 }
 
  Obstacle(Rectangle r_) 
  {
    r = r_;
  }
 
 void display()
 {
   stroke(0);
   fill(175);
   rectMode(CORNER);
   rect(r.x,r.y,r.width,r.height);
 }
 
 boolean contains(PVector spot) {
    if (r.contains((int)spot.x,(int)spot.y)) {
      return true;
    } else {
      return false;
    }
  }
 
 
}