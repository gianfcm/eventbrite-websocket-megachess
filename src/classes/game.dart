import '../shared/types/piece_color.dart';
import 'ai.dart';
import 'board.dart';
import 'websocket/chess_socket.dart';

class Game {
  ChessSocket chessSocket;
  String stringBoard;
  String side;
  String boardId;
  String turnToken;
  Board board;
  AI ai;

  Game(
      {this.chessSocket,
      this.stringBoard,
      this.side,
      this.boardId,
      this.turnToken}) {
    startTurn();
  }

  startTurn() {
    setBoard();
    setAI();
    play();
  }

  setGame(
      {String stringBoard,
      String side,
      String board_id,
      String turn_token,
      ChessSocket chessSocket}) {
    this.stringBoard = stringBoard;
    this.side = side;
    this.boardId = board_id;
    this.turnToken = turn_token;
    this.chessSocket = chessSocket;
    startTurn();
  }

  setBoard() {
    board = Board(side: side, stringBoard: stringBoard);
  }

  setAI() {
    ai = AI(
        board: board,
        side: side == 'white' ? PIECE_COLOR.WHITE : PIECE_COLOR.BLACK);
  }

  play() {
    var bestMove = ai.makeBestMove();
    board.makeMove(move: bestMove);

    chessSocket.send_move(
      board_id: boardId,
      turn_token: turnToken,
      from_col: bestMove.previousPosition.col,
      from_row: bestMove.previousPosition.row,
      to_col: bestMove.newPosition.col,
      to_row: bestMove.newPosition.row,
    );
  }
}
