class CA
{
 int[] cells;
 int generation;
 
 int[] ruleset;
 
 int w = 2; //the size of each cell

  
  CA(int[] r)
  {
    ruleset = r;
    
    generation = 0;
    
    cells = new int[width/w];
    
    restart();
    
  }
  
  void randomize()
  {
    for(int i = 0; i < 8 ; i++)
    {
      ruleset[i] = int(random(2));
    }
  }
  
  void restart()
  {
   for(int i = 0; i < cells.length ; i++)
   {
     cells[i] = 0;
   }
   cells[cells.length/2] = 1;    // We arbitrarily start with just the middle cell having a state of "1"
   generation = 0;
    
  }
  
  void populate()
  {
    int[] nextGen = new int[cells.length];
    int before;
    int middle;
    int after;
    for(int i = 1; i < cells.length -1; i++)
    {
      before = cells[i-1];
      middle = cells[i];
      after = cells[i+1];
      nextGen[i] = rules(before,middle,after);
    }
    cells = nextGen;
    generation++;
    
  }
  
  void display()
  {
    for(int i = 0; i < cells.length; i++)
    {
      if(cells[i] == 1) fill(0);
      else fill(255);
      stroke(0);
      rect(i * w, generation * w,w,w);
    }
  }
  
  int rules (int a, int b, int c) 
  {
   String s = "" + a + b + c;
   int index = Integer.parseInt(s, 2);
   return ruleset[index];
  }
  
  boolean finished()
  {
    if (generation > height/w) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
}