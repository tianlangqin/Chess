int SQUARE_SIZE = 80;
boolean selected = false;
PVector currPiece = null;
boolean[][] isLegal = new boolean[8][8];
Board b = new Board();


void setup() {
  size(640, 640);
  b.drawBoard();
  b.resetBoard();
  resetIsLegal();
}


void draw() {
  if (!selected) {
    b.drawBoard();
  }
  for (int i = 0; i< 8; i++) {
    for (int j = 0; j< 8; j++) {    
      Piece temp = b.data[i][j];
      if(temp != null) {
        image(temp.image, (float)j * SQUARE_SIZE + 2.5, (float) i * SQUARE_SIZE + 2.5 );
      }
    }
  }
}

void showLegalMoves(int x, int y) {
  if (b.data[x][y] != null) {
    PVector[] moves = b.data[x][y].move(b,x,y);
    for (PVector move : moves) {
      if (move == null) 
        continue;
      int targetX = x + (int)move.x;
      int targetY = y + (int)move.y;
      if (targetX > 7 || targetY > 7 || targetX < 0 || targetY < 0) 
        continue;
      
      if ((b.data[targetX][targetY] == null || 
          b.data[x][y].side != b.data[targetX][targetY].side)) {
          isLegal[targetX][targetY] = true;
          fill (151,255,151);
          rect((int)targetY * SQUARE_SIZE, (int) targetX * SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
      }
      else {
      }
    }
  }
}


void mouseClicked() {
  int currY = mouseX/SQUARE_SIZE;
  int currX = mouseY/SQUARE_SIZE;
  System.out.println(currX + " " + currY);
  if (!selected) {
    selected = true;
    if (b.data[currX][currY] != null) {
      currPiece = new PVector(currX, currY);
      fill (255,0,0);
      rect(currY*SQUARE_SIZE,currX*SQUARE_SIZE,SQUARE_SIZE,SQUARE_SIZE);
    }
    showLegalMoves(currX, currY);
  }
  else if ((b.data[currX][currY] == null || 
          b.data[(int)currPiece.x][(int)currPiece.y].side != b.data[currX][currY].side) && isLegal[currX][currY] == true) {
        
        try {
          if (b.data[(int)currPiece.x][(int)currPiece.y].name.equals("king")) {
            if (currY == 2 && b.data[(int)currPiece.x][(int)currPiece.y].side.equals("white") && !b.data[(int)currPiece.x][(int)currPiece.y].moved) {
              b.data[7][3] = b.data[7][0];
              b.data[7][0] = null;
            }
            if (currY == 6 && b.data[(int)currPiece.x][(int)currPiece.y].side.equals("white") && !b.data[(int)currPiece.x][(int)currPiece.y].moved) {
              b.data[7][5] = b.data[7][7];
              b.data[7][7] = null;
            }
            if (currY == 2 && b.data[(int)currPiece.x][(int)currPiece.y].side.equals("black") && !b.data[(int)currPiece.x][(int)currPiece.y].moved) {
              b.data[0][3] = b.data[0][0];
              b.data[0][0] = null;
            }
            if (currY == 6 && b.data[(int)currPiece.x][(int)currPiece.y].side.equals("black") && !b.data[(int)currPiece.x][(int)currPiece.y].moved) {
              b.data[0][5] = b.data[0][7];
              b.data[0][7] = null;
            }
          }
        } catch (Exception e){}
        try {
          if (b.data[(int)currPiece.x][(int)currPiece.y].name.equals("pawn")) {
            if (b.data[(int)currPiece.x][(int)currPiece.y].side.equals("white") && currX == 0)
               b.data[(int)currPiece.x][(int)currPiece.y] = new Queen("white");
          }
          if (b.data[(int)currPiece.x][(int)currPiece.y].name.equals("pawn")) {
            if (b.data[(int)currPiece.x][(int)currPiece.y].side.equals("black") && currX == 7)
               b.data[(int)currPiece.x][(int)currPiece.y] = new Queen("black");
          }
        } catch (Exception e) {}
        try {
          if (b.data[(int)currPiece.x][(int)currPiece.y].name.equals("pawn")) {
            if (b.data[(int)currPiece.x][(int)currPiece.y].side.equals("white") 
            && currY != (int)currPiece.y && b.data[currX][currY] == null) {
               b.data[currX+1][currY] = null;
               //System.out.println(1);
            }             
          }
          if (b.data[(int)currPiece.x][(int)currPiece.y].name.equals("pawn")) {
            if (b.data[(int)currPiece.x][(int)currPiece.y].side.equals("black") 
            && currY != (int)currPiece.y && b.data[currX][currY] == null) {
              b.data[currX -1][currY] = null;
            }                 
          }
        } catch (Exception e) {}
        b.data[currX][currY] = b.data[(int)currPiece.x][(int)currPiece.y];
        b.data[(int)currPiece.x][(int)currPiece.y] = null;
        b.data[currX][currY].moved = true;
        b.data[currX][currY].numMove ++;
        selected = false;
        resetIsLegal();
        
  }
  else {
    selected = false;
    resetIsLegal();
  }
}

void resetIsLegal() {
  for (int i = 0; i< 8; i++) {
    for (int j = 0; j< 8; j++) {
      isLegal[i][j] = false;
    }
  } 
}
