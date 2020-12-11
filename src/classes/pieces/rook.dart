import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';

class Rook extends Piece {
  int value = 60;
  int movesMade;

  Rook({Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♖';
    }
    return '♜';
  }

  @override
  bool canMove() {
    var positions = [
      Coordinate(col: position.col, row: position.row + 1),
      Coordinate(col: position.col, row: position.row - 1),
      Coordinate(col: position.col + 1, row: position.row),
      Coordinate(col: position.col - 1, row: position.row),
    ];

    var emptySpace = 0;
    for (var sumPosition in positions) {
      if (board.isValidPosition(position: sumPosition) &&
          (board.pieceAtPosition(position: sumPosition) == null ||
              board.pieceAtPosition(position: sumPosition)?.side != side)) {
        emptySpace = emptySpace + 1;
      }
    }

    if (emptySpace > 0) {
      return true;
    }

    return false;
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(movesUp());
    moves.addAll(movesDown());
    moves.addAll(movesRight());
    moves.addAll(movesLeft());
    return moves;
  }

  movesUp() {
    List<Move> movesUpMoves = [];

    for (int i = 1; i <= 15; i++) {
      var movesUpMovement =
          position.sum(coordinate: Coordinate(col: 0, row: -i));
      if (board.isValidPosition(position: movesUpMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side !=
                this.side) {
          movesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: this,
              pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesUpMovement) == null) {
          movesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return movesUpMoves;
  }

  movesDown() {
    List<Move> movesDownMoves = [];
    for (int i = 1; i <= 15; i++) {
      var movesDownMovement =
          position.sum(coordinate: Coordinate(col: 0, row: i));
      if (board.isValidPosition(position: movesDownMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side !=
                this.side) {
          movesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: movesDownMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesDownMovement) == null) {
          movesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece:this,
              previousPosition: position));
        }
      }
    }
    return movesDownMoves;
  }

  movesRight() {
    List<Move> movesRightMoves = [];
    for (int i = 1; i <= 15; i++) {
      var movesRightMovement =
          position.sum(coordinate: Coordinate(col: i, row: 0));
      if (board.isValidPosition(position: movesRightMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side !=
                this.side) {
          movesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: movesRightMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesRightMovement) == null) {
          movesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return movesRightMoves;
  }

  movesLeft() {
    List<Move> movesLeftMoves = [];
    for (int i = 1; i <= 15; i++) {
      var movesLeftMovement =
          position.sum(coordinate: Coordinate(col: -i, row: 0));
      if (board.isValidPosition(position: movesLeftMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side !=
                this.side) {
          movesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: movesLeftMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesLeftMovement) == null) {
          movesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return movesLeftMoves;
  }
}
