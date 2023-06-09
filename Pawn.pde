public class Pawn extends Piece {
  public Pawn (String side) {
    super(side);
    name = "pawn";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_pawn.png");
    } else {
      image = loadImage("pieces_image/white_pawn.png");
    }
    image.resize(75,75);
  }
  
  @Override
  public PVector[] move(Board b, int x, int y) {
    PVector[] result = new PVector[4];
    if (this.side.equals("white")) {
      result[0] = new PVector(-1, 0);
      if (!moved) {
        result[1] = new PVector(-2,0);
      }
      if (b.data[x-1][y -1] != null) {
        result[2] = new PVector (-1, -1);
      }
      if (b.data[x-1][y+1] != null) {
        result[3] = new PVector (-1, +1);
      }
    }
    else {
      result[0] = new PVector(1, 0);
      if (!moved) {
        result[1] = new PVector(2,0);
      }
      if (b.data[x+1][y -1] != null) {
        result[2] = new PVector (1, -1);
      }
      if (b.data[x+1][y+1] != null) {
        result[3] = new PVector (1, 1);
      }
    }
    return result;
  }
}
