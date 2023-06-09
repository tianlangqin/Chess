
public class Queen extends Piece {
  public Queen(String side) {
    super(side);
    name = "queen";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_queen.png");
    } else {
      image = loadImage("pieces_image/white_queen.png");
    }
    image.resize(75,75);
  }
  
  @Override
  public PVector[] move(Board b, int x, int y) {
    PVector[] result = new PVector[56];
    boolean first = true;
    for (int i = 1; i< 8; i++) {
      if (x + i > 7) 
        continue;
      if (b.data[x+i][y] == null && first) {
        result[(i - 1) * 8] = new PVector(i,0);
        //System.out.println(i);
      }
      else if (b.data[x+i][y] == null) 
        continue;
      else if (b.data[x+i][y].side != this.side && first) {
        //System.out.print(2);
        result[(i - 1) * 8] = new PVector(i,0);
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
        result[(i - 1) * 8 + 1] = new PVector(0,-i);
      }
      else if (b.data[x][y-i] == null) 
        continue;
      else if (b.data[x][y - i].side != this.side && first) {
        result[(i - 1) * 8 + 1] = new PVector(0, -i);
        first = false;
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 ) 
        continue;
      if (b.data[x-i][y] == null  && first) {
        result[(i - 1) * 8 + 2] = new PVector(-i,0);
      }
      else if (b.data[x-i][y] == null) 
        continue;
      else if (b.data[x-i][y].side != this.side && first) {
        result[(i - 1) * 8 + 2] = new PVector(-i,0);
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
        result[(i - 1) * 8 + 3] = new PVector(0,i);
      }
      else if (b.data[x][y+i] == null) 
        continue;
      else if (b.data[x][y+i].side != this.side && first) {
        result[(i - 1) * 8 + 3] = new PVector(0,i);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y + i > 7) 
        continue;
      if (b.data[x+i][y+i] == null && first) {
        result[(i - 1) * 8 +4 ] = new PVector(i,i);
      }
      else if (b.data[x+i][y+i] == null) 
        continue;
      else if (b.data[x+i][y+i].side != this.side && first) {
        result[(i - 1) * 8 + 4] = new PVector(i,i);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y - i < 0) 
        continue;
      if (b.data[x+i][y-i] == null && first ) {
        result[(i - 1) * 8 + 5] = new PVector(i,-i);
      }
      else if (b.data[x+i][y-i] == null) 
        continue;
      else if (b.data[x+i][y -i].side != this.side && first) {
        result[(i - 1) * 8 + 5] = new PVector(i,-i);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y + i > 7) 
        continue;
      if (b.data[x-i][y+i] == null  && first) {
        result[(i - 1) * 8 + 6] = new PVector(-i,i);
      }
      else if (b.data[x-i][y+i] == null) 
        continue;
      else if (b.data[x-i][y+i].side != this.side && first) {
        result[(i - 1) * 8 + 6] = new PVector(-i,i);
        first = false;
      }
      else {
        break;
      }
    }
    first = true;
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y - i < 0) 
        continue;
      if (b.data[x-i][y-i] == null  && first) {
        result[(i - 1) * 8 + 7] = new PVector(-i,-i);
      }
      else if (b.data[x-i][y-i] == null) 
        continue;
      else if (b.data[x-i][y-i].side != this.side && first) {
        result[(i - 1) * 8 + 7] = new PVector(-i,-i);
        first = false;
      }
      else {
        break;
      }
    } /*
    for (PVector i : result ){
      try {
        System.out.println (i.x + " " + i.y);
      }
      catch(Exception e) {}
    }
    */
    return result;  
  }
}
