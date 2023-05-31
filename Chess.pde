int SQUARE_SIZE = 80;
boolean selected = false;
PVector currPiece = null;

Board b = new Board();

void setup() {
  size(640, 640);
  b.drawBoard();
  b.resetBoard();
}


void draw() {
  if (!selected) {
    b.drawBoard();
  }
  for (int i = 0; i< 8; i++) {
    for (int j = 0; j< 8; j++) {    
      Piece temp = b.data[i][j];
      if(temp != null) {
        image(temp.image, (float )j * SQUARE_SIZE + 2.5, (float) i * SQUARE_SIZE + 2.5 );
      }
    }
  }
}

void showLegalMoves(int x, int y) {
  if (b.data[x][y] != null) {
    PVector[] moves = b.data[x][y].move();
    for (PVector move : moves) {
      
      int targetX = x + (int)move.x;
      int targetY = y + (int)move.y;
      if (targetX > 7 || targetY > 7 || targetX < 0 || targetY < 0) 
        continue;
      
      if ((b.data[targetX][targetY] == null || 
          b.data[x][y].side != b.data[targetX][targetY].side) && !b.data[x][y].blocked) {
          fill (255,0,0);
          ellipse((int)targetY * SQUARE_SIZE + SQUARE_SIZE/2, (int) targetX * SQUARE_SIZE + SQUARE_SIZE/2, SQUARE_SIZE/4, SQUARE_SIZE/4);
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
    }
    showLegalMoves(currX, currY);
  }
  else if (b.data[currX][currY] == null || 
          b.data[(int)currPiece.x][(int)currPiece.y].side != b.data[currX][currY].side) {
        b.data[currX][currY] = b.data[(int)currPiece.x][(int)currPiece.y];
        b.data[(int)currPiece.x][(int)currPiece.y] = null;
        b.data[currX][currY].moved = true;
        selected = false;
  }
  else {
    selected = false;
  }
}
