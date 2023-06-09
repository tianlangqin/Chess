
public class King extends Piece {

  public King (String side) {
    super(side);
    name = "king";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_king.png");
    } else {
      image = loadImage("pieces_image/white_king.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move(Board b, int x, int y) {
    PVector[] result = new PVector[]{
      new PVector(0, 1),
      new PVector(0, -1),
      new PVector(1, 0),
      new PVector(-1, 0),
      new PVector(1, 1),
      new PVector(1, -1),
      new PVector(-1, 1),
      new PVector(-1, -1),
      null,
      null
    };
    if (this.side.equals("white")) {
        if (!this.moved && !b.data[7][0].moved && b.data[7][1] == null && b.data[7][2] == null && b.data[7][3] == null) {
            result[8] = new PVector(0,-2);
        }
        
        if (!this.moved && !b.data[7][7].moved && b.data[7][5] == null && b.data[7][6] == null){
            result[9] = new PVector(0, 2);
        }
    }
    else {
      if (!this.moved && !b.data[0][0].moved && b.data[0][1] == null && b.data[0][2] == null && b.data[0][3] == null) {
            result[8] = new PVector(0,-2);
        }
        
        if (!this.moved && !b.data[0][7].moved && b.data[0][5] == null && b.data[0][6] == null){
            result[9] = new PVector(0, 2);
        }
    }
    
    return result;//
  }
}
