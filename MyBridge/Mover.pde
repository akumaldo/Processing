class Mover
{
  float r;
  Vec2 vec;
  
  Body body;
  
  
  Mover(Vec2 vec_, float r_)
  {
    r = r_;
    vec = vec_;
    makeBody();
  }
  
  Mover()
  {
  }
  
  Mover(float r_, Vec2  vec_)
  {
  
    r = r_;
    vec = vec_;
    makeBodyStatic();
  }
  
  void makeBody()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    // Set its position
    bd.position = box2d.coordPixelsToWorld(vec.x,vec.y);
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 0;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-5,5),random(-5,-5)));
    body.setAngularVelocity(random(-1,1));

  }
  
   void makeBodyStatic()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;

    // Set its position
    bd.position = box2d.coordPixelsToWorld(vec.x,vec.y);
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    // Parameters that affect physics
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    
    //body.setLinearVelocity(new Vec2(random(-5,5),random(-5,-5)));
    //body.setAngularVelocity(random(-1,1));

  }
  
  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }


  void display()
  {
     // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    stroke(0);
    ellipseMode(CENTER);
    strokeWeight(2);
    fill(167);
    ellipse(0,0,r*2,r*2);
    line(0,0,0, r);
    popMatrix();
  }
  

}