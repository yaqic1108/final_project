boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
static int rows = 0;
static int columns = 0;
static int rowSize;
static int columnSize;

//private Board[][] board = new Board[rows][columns];
int num = 0;
String str_num = "";

private Board[][] board;
private Player playerOne;// = new Player(#F51111);
private Player playerTwo;// = new Player(#F0F511);

void setup(){
  size(1080,720); 
  
  playerOne = new Player(color(350));
  playerTwo = new Player(color(500));
}

void draw(){
  if (!gridSizeChosen){
    chooseGridSize(); 
  }
  if (rows != 0 && columns != 0){
      rowSize = height/rows; 
  columnSize = width/columns; 
    drawGrid();  
  }
}


void chooseGridSize(){
  //allowing user to choose grid size
  if(gridSizeChosen == false){
      background(0,0,0);
      fill(255); 
    if(rowsChosen == false){
         text("choose number of rows press enter to confirm", width/2, height/2);
         text("rows : " + rows, width / 2 , height/2+100);
     }
     else{
        if(columnsChosen == false){
          text( "choose number of columns press enter to confirm", width/2, height/2);
          text("rows : " + rows + "  columns :" + columns, width / 2 , height/2+100);
            
        }
     }
  }
}
  
void keyPressed(){
   if(gridSizeChosen == false){
    if(rowsChosen == false){
      if( key >= '0' && key <= '9' ){
        str_num += key; 
      }
      if( key == ENTER || key == RETURN ){
        num = int( str_num );
        rows = num; 
        str_num = "";
        println( num );
        rowsChosen = true;
      }

    }
    else{
      if(columnsChosen == false){
         if( key >= '0' && key <= '9' ){
          str_num += key; 
          
      }
         if( key == ENTER || key==RETURN){
           num = int(str_num);
           columns = num;
           str_num = "";
           println(num);
           columnsChosen = true;
           initializeBoard();
         }
      }
    }
   }
}

void initializeBoard(){
  board = new Board[rows][columns];
  
  for (int r = 0; r < rows; r++){
    for(int c = 0; c < columns; c++){
      board[r][c] = new Board ((float)((c + 0.5)*(width/columns)), (float)((r + 0.5)*(height/rows)));
    }
  }
}

void drawGrid(){
  //draws grid based on chooseGridSize()
  background(62, 144, 255);
  for(int r = 0; r < rows; r++) {
      for(int c = 0; c < columns; c++) {
          fill(board[r][c].getColor());
          if (rows > columns || rows == columns){
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (height/rows)-20);
          }else if (rows < columns) {
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (width/columns)-20);
          }
      }
  }
}

boolean pOneTurn(){
  if (playerOne.turn == 0 && playerTwo.turn == 0){
    return true; 
  }else{
    return playerOne.turn == playerTwo.turn;
  }
}

void mouseReleased(){
  if (gridSizeChosen == true){
    if (pOneTurn() == true){
      playerOne.placeGamePiece(board);
      //drawGrid();
      playerOne.turn ++; 
    }else{
      playerTwo.placeGamePiece(board);
      //drawGrid();
      playerTwo.turn ++; 
    }
  }
}


void reset(){
  clear();
  resolutionChosen = false;
  gridSizeChosen = false;
  rowsChosen = false;
  columnsChosen = false;
  rows = 0;
  columns = 0;
}