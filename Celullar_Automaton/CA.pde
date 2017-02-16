class CA
{
  int[] ruleset;
  
  int generations;
  
  int w = 2;
  
  int cols;
  int rows;
  
  int[][] matrix;
  
  CA(int[] ruleset_)
  {
    
    cols = width/w;
    rows = height/w;
    
    ruleset=ruleset_;
    
    matrix = new int[cols][rows];
    
    restart();
  }
  
  void restart()
  {
   matrix = new int[cols][rows];
   
   for(int i = 0; i < cols ; i++){
      for(int j = 0; j < rows ; j++)
      { 
        matrix[i][j] = 0;
      }
   }
   matrix[cols/2][0] = 1; 
   generations = 0;
  }
  
   void display() {
    int offset = generations%rows;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int y = j - offset;
        if (y <= 0) y = rows + y;
        // Only draw if cell state is 1
        if (matrix[i][j] == 1) {
          fill(0);
          noStroke();
          //stroke(0);
          //point(i*w, (y-1)*w);
          rect(i*w, (y-1)*w,w,w);
        }
      }
    }
  }
  
  void randomize()
  {
    for(int i = 0; i < 8  ; i++)
    {
      ruleset[i] = int(random(2));
    }
   
  }
  
  void generate() {

    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 0; i < cols; i++) {
      int left  = matrix[(i+cols-1)%cols][generations%rows];   // Left neighbor state
      int me    = matrix[i][generations%rows];       // Current state
      int right = matrix[(i+1)%cols][generations%rows];  // Right neighbor state
      matrix[i][(generations+1)%rows] = rule(left, me, right); // Compute next generation state based on ruleset
    }
    generations++;
  }
  
  int rule(int a, int b, int c)
  {
    int index;
    String s = ""+a+b+c;
    index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  boolean isFinished()
  {
    if(generations >= height/w) return true;
    else return false;
  }
  
  
}