
public class Bishop extends Piece {

  public Bishop (String side) {
    super(side);
    name = "bishop";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_bishop.png");
    } else {
      image = loadImage("pieces_image/white_bishop.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move(Board b, int x, int y) {
    PVector[] result = new PVector[28];
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y + i > 7) 
        continue;
      if (b.data[x+i][y+i] == null) {
        result[(i - 1) * 4] = new PVector(i,i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
      if (x + i > 7 || y - i < 0) 
        continue;
      if (b.data[x+i][y-i] == null) {
        result[(i - 1) * 4 + 1] = new PVector(i,-i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y + i > 7) 
        continue;
      if (b.data[x-i][y+i] == null) {
        result[(i - 1) * 4 + 2] = new PVector(-i,i);
      }
      else {
        break;
      }
    }
    for (int i = 1; i< 8; i++) {
       if (x - i < 0 || y - i < 0) 
        continue;
      if (b.data[x-i][y-i] == null) {
        result[(i - 1) * 4 + 3] = new PVector(-i,-i);
      }
      else {
        break;
      }
    }
    return result;
  }
}
