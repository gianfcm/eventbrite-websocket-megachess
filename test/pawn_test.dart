
import '../src/classes/pieces/pawn.dart';
import '../src/classes/board.dart';
import '../src/classes/coordinate.dart';
import 'package:test/test.dart';
import '../src/shared/types/piece_color.dart';

testPawn(){
  print('testing pawn');
  testMoves();
  testCanMove();
  testMovePawn();
  testGetPossibleMoves();
  testStringRep();
}

testStringRep(){
    test('testStringRep Pawn', () {

    Pawn pawn = Pawn(side: PIECE_COLOR.WHITE);
    Pawn pawn2 = Pawn(side: PIECE_COLOR.BLACK);

    expect(pawn.stringRep == '♙',true);
    expect(pawn2.stringRep == '♟︎', true);
});
}

testGetPossibleMoves(){
    test('testGetPossibleMoves Pawn', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'p'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
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

    Pawn pawn = board.board[2][0];
    Pawn pawn2 = board.board[5][0];

    var possibleMoves = pawn.getPossibleMoves();
    var possibleMoves2 = pawn2.getPossibleMoves();

    expect(possibleMoves.length == 0,true);
    expect(possibleMoves2.length == 1, true);
});
}



testMoves(){
  test('testMoves Pawn', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' ''p'' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''p'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' ''Q'' '' '' '' '
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

    Pawn pawn = board.board[5][6];
    Pawn pawn2 = board.board[3][0];
    Pawn pawn3 = board.board[6][10];

    var movesUp = pawn.moveUpMoves();
    var movesTwoUpMoves = pawn.moveTwoUpMoves();
    var moveDiagonallyRight = pawn.diagonallyRightMoves();
    var moveDiagonallyLeft = pawn.diagonallyLeftMoves();

    var movesUp2 = pawn2.moveUpMoves();
    var movesTwoUpMoves2 = pawn2.moveTwoUpMoves();
    var moveDiagonallyRight2 = pawn2.diagonallyRightMoves();
    var moveDiagonallyLeft2 = pawn2.diagonallyLeftMoves();

    var movesUp3 = pawn3.moveUpMoves();
    var movesTwoUpMoves3 = pawn3.moveTwoUpMoves();
    var moveDiagonallyRight3 = pawn3.diagonallyRightMoves();
    var moveDiagonallyLeft3 = pawn3.diagonallyLeftMoves();

    expect(movesUp.length == 1, true);
    expect(movesTwoUpMoves.length == 0, true);
    expect(movesTwoUpMoves.length == 1, false);
    expect(moveDiagonallyRight.length == 0,true );
    expect(moveDiagonallyLeft.length == 0, true);

    expect(movesUp2.length == 1, true);
    expect(movesTwoUpMoves2.length == 1, true);
    expect(movesTwoUpMoves2.length == 0, false);
    expect(moveDiagonallyRight2.length == 0, true );
    expect(moveDiagonallyLeft2.length == 0, true);

    expect(movesUp3.length == 1, true);
    expect(movesTwoUpMoves3.length == 1, false);
    expect(movesTwoUpMoves3.length == 0, true);
    expect(moveDiagonallyRight3.length == 1, true );
    expect(moveDiagonallyLeft3.length == 2, false);

});

}

testCanMove(){
  test('testCanMove Pawn', () {
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
  test('testMovePawn Pawn', () {
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

    for (var move in moves) {
      expect(
          correctPositions.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
    }
  });
}
