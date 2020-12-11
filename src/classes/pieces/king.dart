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
    moves.addAll(movesUp());
    moves.addAll(movesDown());
    moves.addAll(movesRight());
    moves.addAll(movesLeft());
    moves.addAll(movesNorthEast());
    moves.addAll(movesNorthWest());
    moves.addAll(movesSouthWest());
    moves.addAll(movesSouthEast());
    return moves;
  }

  movesUp() {
    List<Move> movesUpMoves = [];
    var movesUpMovement = position.sum(coordinate: Coordinate(col: 0, row: -1));
    if (board.isValidPosition(position: movesUpMovement)) {
      if (board.pieceAtPosition(position: movesUpMovement) != null &&
          board.pieceAtPosition(position: movesUpMovement)?.side != this.side) {
        movesUpMoves.add(Move(
            newPosition: movesUpMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesUpMovement) == null){
            movesUpMoves.add(Move(
            newPosition: movesUpMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesUpMoves;
  }

  movesDown() {
    List<Move> movesDownMoves = [];
    var movesDownMovement =
        position.sum(coordinate: Coordinate(col: 0, row: 1));
    if (board.isValidPosition(position: movesDownMovement)) {
      if (board.pieceAtPosition(position: movesDownMovement) != null &&
          board.pieceAtPosition(position: movesDownMovement)?.side !=
              this.side) {
        movesDownMoves.add(Move(
            newPosition: movesDownMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesDownMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesDownMovement) == null){
            movesDownMoves.add(Move(
            newPosition: movesDownMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesDownMoves;
  }

  movesRight() {
    List<Move> movesRightMoves = [];
    var movesRightMovement =
        position.sum(coordinate: Coordinate(col: 1, row: 0));
    if (board.isValidPosition(position: movesRightMovement)) {
      if (board.pieceAtPosition(position: movesRightMovement) != null &&
          board.pieceAtPosition(position: movesRightMovement)?.side !=
              this.side) {
        movesRightMoves.add(Move(
            newPosition: movesRightMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesRightMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesRightMovement) == null){
            movesRightMoves.add(Move(
            newPosition: movesRightMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesRightMoves;
  }

  movesLeft() {
    List<Move> movesLeftMoves = [];
    var movesLeftMovement =
        position.sum(coordinate: Coordinate(col: -1, row: 0));
    if (board.isValidPosition(position: movesLeftMovement)) {
      if (board.pieceAtPosition(position: movesLeftMovement) != null &&
          board.pieceAtPosition(position: movesLeftMovement)?.side !=
              this.side) {
        movesLeftMoves.add(Move(
            newPosition: movesLeftMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesLeftMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesLeftMovement) == null){
            movesLeftMoves.add(Move(
            newPosition: movesLeftMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesLeftMoves;
  }

  movesNorthEast() {
    List<Move> movesNorthEastMoves = [];
    var movesNorthEastMovement =
        position.sum(coordinate: Coordinate(col: 1, row: -1));
    if (board.isValidPosition(position: movesNorthEastMovement)) {
      if (board.pieceAtPosition(position: movesNorthEastMovement) != null &&
          board.pieceAtPosition(position: movesNorthEastMovement)?.side !=
              this.side) {
        movesNorthEastMoves.add(Move(
            newPosition: movesNorthEastMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesNorthEastMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesNorthEastMovement) == null){
            movesNorthEastMoves.add(Move(
            newPosition: movesNorthEastMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesNorthEastMoves;
  }

    movesNorthWest() {
    List<Move> movesNorthWestMoves = [];
    var movesNorthWestMovement =
        position.sum(coordinate: Coordinate(col: -1, row: -1));
    if (board.isValidPosition(position: movesNorthWestMovement)) {
      if (board.pieceAtPosition(position: movesNorthWestMovement) != null &&
          board.pieceAtPosition(position: movesNorthWestMovement)?.side !=
              this.side) {
        movesNorthWestMoves.add(Move(
            newPosition: movesNorthWestMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesNorthWestMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesNorthWestMovement) == null){
            movesNorthWestMoves.add(Move(
            newPosition: movesNorthWestMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesNorthWestMoves;
  }

  movesSouthWest() {
    List<Move> movesSouthWestMoves = [];
    var movesSouthWestMovement =
        position.sum(coordinate: Coordinate(col: -1, row: 1));
    if (board.isValidPosition(position: movesSouthWestMovement)) {
      if (board.pieceAtPosition(position:movesSouthWestMovement) != null &&
          board.pieceAtPosition(position: movesSouthWestMovement)?.side !=
              this.side) {
        movesSouthWestMoves.add(Move(
            newPosition: movesSouthWestMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesSouthWestMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesSouthWestMovement) == null){
            movesSouthWestMoves.add(Move(
            newPosition: movesSouthWestMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesSouthWestMoves;
  }

    movesSouthEast() {
    List<Move> movesSouthEastMoves = [];
    var movesSouthEastMovement =
        position.sum(coordinate: Coordinate(col: 1, row: 1));
    if (board.isValidPosition(position: movesSouthEastMovement)) {
      if (board.pieceAtPosition(position:movesSouthEastMovement) != null &&
          board.pieceAtPosition(position: movesSouthEastMovement)?.side !=
              this.side) {
        movesSouthEastMoves.add(Move(
            newPosition: movesSouthEastMovement,
            piece: this,
            pieceToCapture: board.pieceAtPosition(position: movesSouthEastMovement),
            previousPosition: position));
      }else if(board.pieceAtPosition(position: movesSouthEastMovement) == null){
            movesSouthEastMoves.add(Move(
            newPosition: movesSouthEastMovement,
            piece: this,
            previousPosition: position));
      }
    }
    return movesSouthEastMoves;
  }

}
