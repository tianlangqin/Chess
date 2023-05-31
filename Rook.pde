public class Rook extends Piece {
  public Rook (String side) {
    super(side);
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_rook.png");
    } else {
      image = loadImage("pieces_image/white_rook.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move() {
    PVector[] result = new PVector[28];
    for (int i = 1; i < 8; i++) {
      result[(i - 1) * 4] = new PVector(0,i);
      result[(i - 1) * 4 + 1] = new PVector(0,-i);
      result[(i - 1) * 4 + 2] = new PVector(-i,0);
      result[(i - 1) * 4 + 3] = new PVector(i,0);
    }
    
    return result;
  }
}
