public class Rook extends Piece {
  public Rook (String side) {
    super(side);
    name = "rook";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_rook.png");
    } else {
      image = loadImage("pieces_image/white_rook.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move(Board b, int x, int y) {
    PVector[] result = new PVector[28];
    boolean first = true;
    
    for (int i = 1; i< 8; i++) {
      if (x + i > 7) 
        continue;
      if (b.data[x+i][y] == null && first) {
        result[(i - 1) * 4] = new PVector(i,0);
        //System.out.println(i);
      }
      else if (b.data[x+i][y] == null) 
        continue;
      else if (b.data[x+i][y].side != this.side && first) {
        //System.out.print(2);
        result[(i - 1) * 4] = new PVector(i,0);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
      if (y - i < 0) 
        continue;
      if (b.data[x][y-i] == null  && first) {
        result[(i - 1) * 4 + 1] = new PVector(0,-i);
      }
      else if (b.data[x][y-i] == null) 
        continue;
      else if (b.data[x][y - i].side != this.side && first) {
        result[(i - 1) * 4 + 1] = new PVector(0, -i);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
      if (x - i < 0 ) 
        continue;
      if (b.data[x-i][y] == null  && first) {
        result[(i - 1) * 4 + 2] = new PVector(-i,0);
      }
      else if (b.data[x-i][y] == null) 
        continue;
      else if (b.data[x-i][y].side != this.side && first) {
        result[(i - 1) * 4 + 2] = new PVector(-i,0);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
       if (y + i > 7) 
        continue;
      if (b.data[x][y+i] == null  && first) {
        result[(i - 1) * 4 + 3] = new PVector(0,i);
      }
      else if (b.data[x][y+i] == null) 
        continue;
      else if (b.data[x][y+i].side != this.side && first) {
        result[(i - 1) * 4 + 3] = new PVector(0,i);
        first = false;
      }
      else {
        break;
      }
    }
    
    return result;
  }
}
