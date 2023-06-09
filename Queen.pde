
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
    for (int i = 1; i< 8; i++) {
      if (x + i > 7) 
        continue;
      if (b.data[x+i][y] == null) {
        result[(i - 1) * 8] = new PVector(i,0);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
      if (y - i < 0) 
        continue;
      if (b.data[x][y-i] == null) {
        result[(i - 1) * 8 + 1] = new PVector(0,-i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 ) 
        continue;
      if (b.data[x-i][y] == null) {
        result[(i - 1) * 8 + 2] = new PVector(-i,0);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (y + i > 7) 
        continue;
      if (b.data[x][y+i] == null) {
        result[(i - 1) * 4 + 3] = new PVector(0,i);
      }
      else {
        break;
      }
    }
    
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y + i > 7) 
        continue;
      if (b.data[x+i][y+i] == null) {
        result[(i - 1) * 8 +4 ] = new PVector(i,i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y - i < 0) 
        continue;
      if (b.data[x+i][y-i] == null) {
        result[(i - 1) * 8 + 5] = new PVector(i,-i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y + i > 7) 
        continue;
      if (b.data[x-i][y+i] == null) {
        result[(i - 1) * 8 + 6] = new PVector(-i,i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y - i < 0) 
        continue;
      if (b.data[x-i][y-i] == null) {
        result[(i - 1) * 8 + 7] = new PVector(-i,-i);
      }
      else {
        break;
      }
    }
    return result;
  }
}
