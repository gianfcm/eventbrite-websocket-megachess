import 'dart:core';
import '../shared/types/piece_color.dart';
import 'board.dart';
import 'move.dart';
import 'pieces/bishop.dart';
import 'pieces/king.dart';
import 'pieces/pawn.dart';
import 'pieces/queen.dart';
import 'pieces/rook.dart';

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
        'Move: row : ${bestMove?.newPosition?.row} col: ${bestMove?.newPosition?.col} ${bestMove?.piece?.stringRep}');
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

    var moves = currentBoard.getBestMoves(side: side);

    if (depth == 0) {
      return currentBoard.evaluateBoard(side: this.side);
    }

    moves = filterCaptureMoves(moves: moves, board: currentBoard, depth: depth);

    for (var move in moves) {
      bestMove = move;
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
    return alpha;
  }

  int minimizer(
      {Board currentBoard, int depth, int alpha, int beta, PIECE_COLOR side}) {
    var moves = currentBoard.getBestMoves(side: side);

    if (depth == 0) {
      return currentBoard.evaluateBoard(side: this.side);
    }


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

  List<Move> filterCaptureMoves({List<Move> moves, Board board, int depth}) {
    List<Move> filterCaptureMoves = [];

    if (depth == SEARCH_DEPTH) {
      filterCaptureMoves.addAll(captureKing(moves: moves));
    }

    filterCaptureMoves.addAll(defendBase(moves: moves));

    filterCaptureMoves.addAll(capturePawnsOnRow(moves: moves));

    filterCaptureMoves.addAll(captureQueen(moves: moves));

    return filterCaptureMoves.isNotEmpty
        ? filterCaptureMoves
        : filterPawnCaptureMoves(moves: moves);
  }

  List<Move> captureKing({List<Move> moves}) {
    List<Move> captureKingMoves = [];
    for (var move in moves) {
      if (move?.pieceToCapture is King) {
        captureKingMoves.add(move);
      }
    }
    return captureKingMoves;
  }

  List<Move> captureQueen({List<Move> moves}) {
    List<Move> captureQueenMoves = [];
    for (var move in moves) {
      if (move?.pieceToCapture is Queen) {
        captureQueenMoves.add(move);
      }
    }
    return captureQueenMoves;
  }

  List<Move> defendBase({List<Move> moves}) {
    List<Move> defendBaseMoves = [];
    for (var move in moves) {
      if(move?.pieceToCapture?.position?.row != null){
      if (this.side == PIECE_COLOR.BLACK) {
        if (move?.pieceToCapture?.position?.row <= 4) {
          defendBaseMoves.add(move);
        }
      } else if (this.side == PIECE_COLOR.WHITE) {
        if (move?.pieceToCapture?.position?.row >= 12) {
          defendBaseMoves.add(move);
        }
      }
    }
    }
    return defendBaseMoves;
  }

  List<Move> capturePawnsOnRow({List<Move> moves}) {
    List<Move> capturePawnsOnRowMoves = [];
    for (var move in moves) {
      if (move?.pieceToCapture is Pawn) {
        if (move?.pieceToCapture?.position?.row >= 9 &&
                move?.pieceToCapture?.position?.row <= 10 ||
            move?.pieceToCapture?.position?.row <= 6 &&
                move?.pieceToCapture?.position?.row >= 5) {
          capturePawnsOnRowMoves.add(move);
        }
      }
    }
    return capturePawnsOnRowMoves;
  }

  List<Move> filterPawnCaptureMoves({List<Move> moves}) {
    List<Move> filterPawnCaptureMoves = [];
    for (var move in moves) {
      if (move.piece is Pawn) {
        if (move?.pieceToCapture?.position?.row != null) {
          filterPawnCaptureMoves.add(move);
        }
      }
    }
    return filterPawnCaptureMoves.isNotEmpty
        ? filterPawnCaptureMoves
        : filterPawnMoves(moves: moves);
  }

  List<Move> filterPawnMoves({List<Move> moves}) {
    List<Move> filterPawnMoves = [];
    int center = side == PIECE_COLOR.BLACK ? 7 : 8;
    List<Move> filteredMoves = [];

    for(var move in moves){
      if(move.piece is Pawn == true){
        filteredMoves.add(move);
      }
    }

    // for (var move in filteredMoves) {
    //   if (move.piece.position.col == 0 ||
    //       move.piece.position.col == 3 ||
    //       move.piece.position.col == 6 ||
    //       move.piece.position.col == 14 ||
    //       move.piece.position.col == 13 ||
    //       move.piece.position.col == 15) {
    //     filterPawnMoves.add(move);
    //   }
    // }

    if (filteredMoves.isNotEmpty) {
      filterPawnMoves
          .add(nearPieceToValueMove(moves: filteredMoves, value: center));
    }
    return filterPawnMoves.isNotEmpty
        ? filterPawnMoves
        : filterBishopMoves(moves: moves);
  }

  Move nearPieceToValueMove({List<Move> moves, int value}) {
    int distance = (moves[0].piece.position.row - value).abs();
    int index = 0;
    for (int c = 1; c < moves.length; c++) {
      int cdistance = (moves[c].piece.position.row - value).abs();
      if (cdistance < distance) {
        distance = cdistance;
        index = c;
      }
    }
    return moves[index];
  }

  List<Move> filterBishopMoves({List<Move> moves}) {
    List<Move> filterBishopMoves = [];
    for (var move in moves) {
      if (move.piece is Bishop) {
        if (move?.pieceToCapture?.position?.row != null) {
          filterBishopMoves.add(move);
        }
      }
    }
    return filterBishopMoves.isNotEmpty
        ? filterBishopMoves
        : filterRookMoves(moves: moves);
  }

  List<Move> filterRookMoves({List<Move> moves}) {
    List<Move> filterRookMoves = [];
    for (var move in moves) {
      if (move.piece is Rook) {
        if (move?.pieceToCapture?.position?.row != null) {
          filterRookMoves.add(move);
        }
      }
    }
    return filterRookMoves.isNotEmpty ? filterRookMoves : moves;
  }
}
