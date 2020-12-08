import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';
import 'queen.dart';

class Rook extends Piece implements Queen {
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
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(burstMovesUp(piece: this));
    moves.addAll(burstMovesDown(piece: this));
    moves.addAll(burstMovesLeft(piece: this));
    moves.addAll(burstMovesRight(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(movesUp(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(movesDown(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(movesRight(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(movesLeft(piece: this));
    return moves;
  }

  burstMovesUp({Piece piece}) {
    List<Move> burstMovesUpMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesUpMovement =
          position.sum(coordinate: Coordinate(col: 0, row: -i));
      if (board.isValidPosition(position: movesUpMovement)) {
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side !=
                this.side) {
          burstMovesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: piece,
              pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstMovesUpMoves;
  }

  burstMovesDown({Piece piece}) {
    List<Move> burstMovesDownMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesDownMovement =
          position.sum(coordinate: Coordinate(col: 0, row: i));
      if (board.isValidPosition(position: movesDownMovement)) {
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side !=
                this.side) {
          burstMovesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesDownMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstMovesDownMoves;
  }

  burstMovesRight({Piece piece}) {
    List<Move> burstMovesRightMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesRightMovement =
          position.sum(coordinate: Coordinate(col: i, row: 0));
      if (board.isValidPosition(position: movesRightMovement)) {
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side !=
                this.side) {
          burstMovesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesRightMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstMovesRightMoves;
  }

  burstMovesLeft({Piece piece}) {
    List<Move> burstMovesLeftMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesLeftMovement =
          position.sum(coordinate: Coordinate(col: -i, row: 0));
      if (board.isValidPosition(position: movesLeftMovement)) {
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side !=
                this.side) {
          burstMovesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesLeftMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstMovesLeftMoves;
  }

  movesUp({Piece piece}) {
    List<Move> movesUpMoves = [];

    for (int i = 1; i < 15; i++) {
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
              piece: piece,
              pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesUpMovement) == null) {
          movesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesUpMoves;
  }

  movesDown({Piece piece}) {
    List<Move> movesDownMoves = [];
    for (int i = 1; i < 15; i++) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesDownMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesDownMovement) == null) {
          movesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesDownMoves;
  }

  movesRight({Piece piece}) {
    List<Move> movesRightMoves = [];
    for (int i = 1; i < 15; i++) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesRightMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesRightMovement) == null) {
          movesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesRightMoves;
  }

  movesLeft({Piece piece}) {
    List<Move> movesLeftMoves = [];
    for (int i = 1; i < 15; i++) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesLeftMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesLeftMovement) == null) {
          movesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesLeftMoves;
  }
}
