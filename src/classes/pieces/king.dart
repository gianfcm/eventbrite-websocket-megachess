import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'bishop.dart';
import 'piece.dart';
import 'rook.dart';

class King extends Piece {
  int value = 100;
  int movesMade;

  King({Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♔';
    }
    return '♚';
  }

  @override
  bool canMove() {
    Rook rook = Rook(board: this.board, position: position, side: this.side);
    Bishop bishop =
        Bishop(board: this.board, position: position, side: this.side);
    if (bishop.canMove() || rook.canMove()) {
      return true;
    }
    return false;
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(movesUp(piece: this));
    moves.addAll(movesDown(piece: this));
    moves.addAll(movesRight(piece: this));
    moves.addAll(movesLeft(piece: this));
    return moves;
  }

  movesUp({Piece piece}) {
    List<Move> movesUpMoves = [];
    var movesUpMovement = position.sum(coordinate: Coordinate(col: 0, row: -1));
    if (board.isValidPosition(position: movesUpMovement)) {
      if (board.pieceAtPosition(position: movesUpMovement) != null &&
          board.pieceAtPosition(position: movesUpMovement)?.side != this.side) {
        movesUpMoves.add(Move(
            newPosition: movesUpMovement,
            piece: piece,
            pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
            previousPosition: position));
      }
    }
    return movesUpMoves;
  }

  movesDown({Piece piece}) {
    List<Move> movesDownMoves = [];
    var movesDownMovement =
        position.sum(coordinate: Coordinate(col: 0, row: 1));
    if (board.isValidPosition(position: movesDownMovement)) {
      if (board.pieceAtPosition(position: movesDownMovement) != null &&
          board.pieceAtPosition(position: movesDownMovement)?.side !=
              this.side) {
        movesDownMoves.add(Move(
            newPosition: movesDownMovement,
            piece: piece,
            pieceToCapture: board.pieceAtPosition(position: movesDownMovement),
            previousPosition: position));
      }
    }
    return movesDownMoves;
  }

  movesRight({Piece piece}) {
    List<Move> movesRightMoves = [];
    var movesRightMovement =
        position.sum(coordinate: Coordinate(col: 1, row: 0));
    if (board.isValidPosition(position: movesRightMovement)) {
      if (board.pieceAtPosition(position: movesRightMovement) != null &&
          board.pieceAtPosition(position: movesRightMovement)?.side !=
              this.side) {
        movesRightMoves.add(Move(
            newPosition: movesRightMovement,
            piece: piece,
            pieceToCapture: board.pieceAtPosition(position: movesRightMovement),
            previousPosition: position));
      }
    }
    return movesRightMoves;
  }

  movesLeft({Piece piece}) {
    List<Move> movesLeftMoves = [];
    var movesLeftMovement =
        position.sum(coordinate: Coordinate(col: -1, row: 0));
    if (board.isValidPosition(position: movesLeftMovement)) {
      if (board.pieceAtPosition(position: movesLeftMovement) != null &&
          board.pieceAtPosition(position: movesLeftMovement)?.side !=
              this.side) {
        movesLeftMoves.add(Move(
            newPosition: movesLeftMovement,
            piece: piece,
            pieceToCapture: board.pieceAtPosition(position: movesLeftMovement),
            previousPosition: position));
      }
    }
    return movesLeftMoves;
  }
}
