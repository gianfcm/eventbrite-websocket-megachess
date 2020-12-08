import 'dart:core';
import '../shared/types/piece_color.dart';
import 'board.dart';
import 'move.dart';
import 'pieces/pawn.dart';
import 'pieces/queen.dart';

class AI {
  Board board;
  Move bestMove;
  PIECE_COLOR side;
  int SEARCH_DEPTH = 4;

  AI({this.board, this.side});

  Move makeBestMove() {
    print('color side : $side');
    print('AI processing ...');
    bestMove = decideMove();
    print('termino bestMove');
    print(
        'Move: row : ${bestMove?.newPosition?.row} col: ${bestMove?.newPosition?.col} ${bestMove.piece.stringRep}');
    print(
        'From row : ${bestMove.previousPosition.row} col: ${bestMove.previousPosition.col}');
    print('AI done.');
    return bestMove;
  }

  Move decideMove() {
    int value = maximizer(
        currentBoard: board,
        depth: SEARCH_DEPTH,
        alpha: -4294967296,
        beta: 4294967296,
        side: side);
    print('VALUE ES $value');
    return bestMove;
  }

  int maximizer(
      {Board currentBoard, int depth, int alpha, int beta, PIECE_COLOR side}) {
    if (depth == 0) {
      return currentBoard.evaluateBoard(side: side, board: currentBoard.board);
    }

    var moves = currentBoard.getBestMoves(side: side);
    moves = filterCaptureMoves(moves: moves);

    for (var move in moves) {
      var copy = new Board.copy(board: currentBoard.board);
      copy.makeMove(move: move);
      int rating = minimizer(
          currentBoard: copy,
          depth: depth - 1,
          alpha: alpha,
          beta: beta,
          side: side == PIECE_COLOR.WHITE
              ? PIECE_COLOR.BLACK
              : PIECE_COLOR.WHITE);
      copy.unMakeMove(move: move);
      if (rating > alpha) {
        alpha = rating;
        if (depth == SEARCH_DEPTH) {
          bestMove = move;
        }
      }
      if (alpha >= beta) {
        return alpha;
      }
    }
    if (depth == SEARCH_DEPTH) {
      bestMove = moves[0];
    }
    return alpha;
  }

  int minimizer(
      {Board currentBoard, int depth, int alpha, int beta, PIECE_COLOR side}) {
    if (depth == 0) {
      return currentBoard.evaluateBoard(side: side, board: currentBoard.board);
    }

    var moves = currentBoard.getBestMoves(side: side);
    moves = filterCaptureMoves(moves: moves);

    for (var move in moves) {
      var copy = new Board.copy(board: currentBoard.board);
      copy.makeMove(move: move);
      int rating = maximizer(
          currentBoard: copy,
          depth: depth - 1,
          alpha: alpha,
          beta: beta,
          side: side == PIECE_COLOR.WHITE
              ? PIECE_COLOR.BLACK
              : PIECE_COLOR.WHITE);
      copy.unMakeMove(move: move);
      if (rating <= beta) {
        beta = rating;
      }
      if (alpha >= beta) {
        return beta;
      }
    }
    return beta;
  }

  filterCaptureMoves({List<Move> moves}) {
    List<Move> filterCaptureMoves = [];
    for (var move in moves) {
      if (move?.pieceToCapture?.position?.row != null) {
        if (side == PIECE_COLOR.BLACK) {
          if (move?.pieceToCapture?.position?.row <= 5) {
            filterCaptureMoves.add(move);
            break;
          }
        } else if (side == PIECE_COLOR.WHITE) {
          if (move?.pieceToCapture?.position?.row >= 9) {
            filterCaptureMoves.add(move);
            break;
          }
        }
      }
    }
    return filterCaptureMoves.isNotEmpty
        ? filterCaptureMoves
        : filterPawnCaptureMoves(moves: moves);
  }

  filterPawnCaptureMoves({List<Move> moves}) {
    List<Move> filterPawnCaptureMoves = [];
    for (var move in moves) {
      if (move.piece is Pawn) {
        if (move?.pieceToCapture?.position?.row != null) {
          filterPawnCaptureMoves.add(move);
          break;
        }
      }
    }
    return filterPawnCaptureMoves.isNotEmpty
        ? filterPawnCaptureMoves
        : filterPromoteOnlyMovesFirst(moves: moves);
  }

  List<Move> filterPromoteOnlyMovesFirst({List<Move> moves}) {
    List<Move> filterPromoteOnlyMovesFirst = [];
    for (var move in moves) {
      if (move.piece is Pawn &&
          (move.piece.position.row == 6 || move.piece.position.row == 9)) {
        filterPromoteOnlyMovesFirst.add(move);
      }
    }
    return filterPromoteOnlyMovesFirst.isNotEmpty
        ? filterPromoteOnlyMovesFirst
        : filterPawnUpMovesSecond(moves: moves);
  }

  List<Move> filterPawnUpMovesSecond({List<Move> moves}) {
    List<Move> filterPromoteOnlyMovesSecond = [];
    for (var move in moves) {
      if (move.piece is Pawn &&
          (move.piece.position.row == 5 || move.piece.position.row == 10)) {
        filterPromoteOnlyMovesSecond.add(move);
      }
    }
    return filterPromoteOnlyMovesSecond.isNotEmpty
        ? filterPromoteOnlyMovesSecond
        : filterPawnUpMovesThird(moves: moves);
  }

  List<Move> filterPawnUpMovesThird({List<Move> moves}) {
    List<Move> filterPromoteOnlyMovesThird = [];
    for (var move in moves) {
      if (move.piece is Pawn &&
          (move.piece.position.row == 4 || move.piece.position.row == 11)) {
        filterPromoteOnlyMovesThird.add(move);
      }
    }
    return filterPromoteOnlyMovesThird.isNotEmpty
        ? filterPromoteOnlyMovesThird
        : filterMoves(moves: moves);
  }

  List<Move> filterMoves({List<Move> moves}) {
    List<Move> filterMoves = [];
    for (var move in moves) {
      if (move.pieceToCapture is Queen && move.pieceToCapture.side != side) {
        filterMoves.add(move);
        break;
      }
      if (move.piece.position.row == 3 || move.piece.position.row == 12) {
        filterMoves.add(move);
        break;
      }
      if (move.piece.position.row == 2 || move.piece.position.row == 13) {
        filterMoves.add(move);
        break;
      }
    }
    return filterMoves.isNotEmpty
        ? filterMoves
        : filterQueenMoves(moves: moves);
  }

  List<Move> filterQueenMoves({List<Move> moves}) {
    List<Move> filterQueenMoves = [];
    for (var move in moves) {
      if (move.piece is Queen) {
        if (move?.pieceToCapture?.position?.row != null) {
          filterQueenMoves.add(move);
        }
      }
    }
    return filterQueenMoves.isNotEmpty ? filterQueenMoves : moves;
  }
}
