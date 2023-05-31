String white = "white";
String black = "black";

public class Board{
  Piece[][] data = new Piece[8][8];
  
  public void drawBoard() {
    for (int i = 0; i < width/SQUARE_SIZE; i++) {
      for (int j = 0; j < height/SQUARE_SIZE; j++) {
        if ((i + j) % 2 == 0) {
          fill(255);
        } 
        else {
          fill(150,75,0);
        }
        rect(i*SQUARE_SIZE,j*SQUARE_SIZE,SQUARE_SIZE,SQUARE_SIZE);
      }
    }
  }
  
  public void resetBoard() {
    data[0][0] = new Rook(black); //a8 square , h1 square will be [7][7]
    data[0][1] = new Knight(black);
    data[0][2] = new Bishop(black);
    data[0][3] = new Queen(black);
    data[0][4] = new King(black);
    data[0][5] = new Bishop(black);
    data[0][6] = new Knight(black);
    data[0][7] = new Rook(black);
    data[1][0] = new Pawn(black);
    data[1][1] = new Pawn(black);
    data[1][2] = new Pawn(black);
    data[1][3] = new Pawn(black);
    data[1][4] = new Pawn(black);
    data[1][5] = new Pawn(black);
    data[1][6] = new Pawn(black);
    data[1][7] = new Pawn(black);
    
    for (int i = 2; i < 6; i++) {
      for (int j = 0; j < 8; j++) {
        data[i][j] = null;
      }
    }
    
    data[6][0] = new Pawn(white);
    data[6][1] = new Pawn(white);
    data[6][2] = new Pawn(white);
    data[6][3] = new Pawn(white);
    data[6][4] = new Pawn(white);
    data[6][5] = new Pawn(white);
    data[6][6] = new Pawn(white);
    data[6][7] = new Pawn(white);
    data[7][0] = new Rook(white); 
    data[7][1] = new Knight(white);
    data[7][2] = new Bishop(white);
    data[7][3] = new Queen(white);
    data[7][4] = new King(white);
    data[7][5] = new Bishop(white);
    data[7][6] = new Knight(white);
    data[7][7] = new Rook(white); //h1
  }
  
} 
