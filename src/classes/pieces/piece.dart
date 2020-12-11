import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'bishop.dart';
import 'horse.dart';
import 'king.dart';
import 'empty_piece.dart';
import 'pawn.dart';
import 'queen.dart';
import 'rook.dart';

class Piece {
  Piece({this.board, this.side, this.position, this.value, this.movesMade});
  Board board;
  PIECE_COLOR side;
  Coordinate position;
  int value;
  int movesMade;

  get stringRep {}

  List<Move> getPossibleMoves() {
    return null;
  }

  bool canMove() {
    return true;
  }

  Piece returnPieceByString({String stringPiece, int y, int x, Board board}) {
    switch (stringPiece) {
      case 'p':
        return Pawn(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'P':
        return Pawn(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case 'b':
        return Bishop(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'B':
        return Bishop(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case 'h':
        return Horse(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'H':
        return Horse(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case 'r':
        return Rook(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'R':
        return Rook(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case 'q':
        return Queen(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'Q':
        return Queen(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case 'k':
        return King(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.BLACK);
        break;
      case 'K':
        return King(
            board: board,
            position: Coordinate(row: y, col: x),
            side: PIECE_COLOR.WHITE);
        break;
      case ' ':
        return EmptyPiece(
            board: board, position: Coordinate(row: y, col: x), side: null);
        break;
      default:
        return null;
    }
  }
}
