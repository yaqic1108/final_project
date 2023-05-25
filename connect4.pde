boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
public static int rows = 0;
public static int columns = 0;

public static int[][] board = new int[rows][columns];
int num =0;
String str_num = "";

void setup(){
  size(1080,720);
}

void draw(){
  chooseGridSize(); 
  drawGrid(); 
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
         }
      }
    }
   }
}

void drawGrid(){
  //draws grid based on chooseGridSize()
  if (rows != 0 && columns != 0){
    background(62, 144, 255);
    for (int j = (height/(2*rows)); j <= height; j += (height/rows)){
      for (int i = (width/(2*columns)); i <= width; i += (width/columns)){
        fill(#98A8BF); 
        circle (i, j, (height/rows)-20); 
      }
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

Player playerOne = new Player(#FFFFFF);
playerOne.placeGamePiece(); 
//Player playerOne = new Player(); 
//playerOne.Player(color(#F70707)); 
