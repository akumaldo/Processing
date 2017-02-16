class TriangularParticle extends SquareParticle
{
  
  TriangularParticle(PVector loc, float size)
  {
    super(loc,size);
  }
  
  void display()
  {
   pushMatrix();
   translate(loc.x, loc.y);
   stroke(0, fade);
   fill(150, fade);
   rotate(angle);
   triangle(0, 0 + r, 0 + r, 0 + r, 0 + r, 0);
   endShape();
   popMatrix();
   angle += 0.2;
    
  }
  
  
}