Lsystem lys;

Render r;


void setup()
{
 size(1000,800);
 background(255);
 smooth();
 
   Rule[] ruleset = new Rule[1];
   ruleset[0] = new Rule('F',"F[F]-F+F[--F]+F-F");
   //ruleset[0] = new Rule('F',"FF+[+F-F-F]-[-F+F+F]");
   lys = new Lsystem("F-F-F-F-F",ruleset);
   r = new Render(lys.getSentence(),width-1,PI/2);
  
 
 //Rule[] ruleset = new Rule[1];
 
 //ruleset[0] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]");
 
 //lys = new Lsystem("F", ruleset);
  
 //r = new Render(lys.getSentence(), height/4, radians((int)random(10,40)));

}


void draw()
{
 
  background(255);
  fill(0);
  translate(width/2, height);
  rotate(-PI);
  r.render();
  noLoop();
    
}


int counter = 0;

void mousePressed() {
  if (counter < 11) {
    pushMatrix();
    lys.generate();
    //println(lsys.getSentence());
    r.setToDo(lys.getSentence());
    r.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}

  