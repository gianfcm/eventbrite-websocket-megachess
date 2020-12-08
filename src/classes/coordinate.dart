class Coordinate {
  Coordinate({this.row, this.col});
  int row;
  int col;

  Coordinate sum({Coordinate coordinate}) {
    var row = this.row + coordinate.row;
    var col = this.col + coordinate.col;
    return Coordinate(row: row, col: col);
  }
}
