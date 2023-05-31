
public class Bishop extends Piece {

  public Bishop (String side) {
    super(side);
    
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_bishop.png");
    } else {
      image = loadImage("pieces_image/white_bishop.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move() {
    PVector[] result = new PVector[28];
    for (int i = 1; i < 8; i++) {
      result[(i - 1) * 4] = new PVector(i,i);
      result[(i - 1) * 4 + 1] = new PVector(i,-i);
      result[(i - 1) * 4 + 2] = new PVector(-i,i);
      result[(i - 1) * 4 + 3] = new PVector(-i,-i);
    }
    
    return result;
  }
}
