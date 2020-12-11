
import '../src/classes/pieces/pawn.dart';
import '../src/classes/board.dart';
import '../src/classes/coordinate.dart';
import 'package:test/test.dart';

testPawnMoves(){
  //testCanMove();
  //testMovePawn();
  testPawnCantMove();
}


testCanMove(){
  test('pawn can move test', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    var pawnsRowThree = [];
    var pawnsRowTwo = [];
    for(int x = 0; x <= 15; x++){
      pawnsRowTwo.add(board.board[2][x]);
      pawnsRowThree.add(board.board[3][x]);
    }

    for(Pawn pawn in pawnsRowThree){
      expect(pawn.canMove()==true, true);
    }

    for(Pawn pawn in pawnsRowTwo){
      expect(pawn.canMove()==true, false);
    }
    
  });

}


testMovePawn() {
  test('pawn moves during a position', () {
    List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    var correctPositions = [
      Coordinate(row: 4,col: 6),
      Coordinate(row: 5,col: 6),
    ];
    

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));
    Pawn pawn = board.board[3][6];
    var moves = pawn.getPossibleMoves();
    expect(moves.length==correctPositions.length, true);
    print('Verifying moves positions');

    for (var move in moves) {
      expect(
          correctPositions.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
    }
  });
}


testPawnCantMove() {
  test('best move for a pawn', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' ''Q'' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' ''p'' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' ''p'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    var correctPosition = [];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    Pawn pawn = board.board[2][7];

    var possibleMoves = pawn.getPossibleMoves();

    expect(correctPosition.length == possibleMoves.length,true);

    }

);
}



