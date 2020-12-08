class SendMove {
  SendMove(
      {this.turn_token,
      this.board_id,
      this.from_col,
      this.from_row,
      this.to_col,
      this.to_row});
  String board_id;
  String turn_token;
  int from_row;
  int from_col;
  int to_row;
  int to_col;
}
