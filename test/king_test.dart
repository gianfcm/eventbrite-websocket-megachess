import '../src/classes/pieces/king.dart';
import '../src/classes/board.dart';
import 'package:test/test.dart';
import '../src/shared/types/piece_color.dart';

testKing(){
  print('testing king');
  testMoves();
  testCanMove();
  testGetPossibleMoves();
  testStringRep();
}

testStringRep(){
    test('testStringRep King', () {

    King king = King(side: PIECE_COLOR.WHITE);
    King king2 = King(side: PIECE_COLOR.BLACK);

    expect(king.stringRep == '♔',true);
    expect(king2.stringRep == '♚', true);
});
}

testGetPossibleMoves(){
    test('testGetPossibleMoves King', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'k'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
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

    King king = board.board[0][9];
    King king2 = board.board[5][0];

    var possibleMoves = king.getPossibleMoves();
    var possibleMoves2 = king2.getPossibleMoves();

    expect(possibleMoves.length == 0,true);
    expect(possibleMoves2.length == 5, true);
});
}

testCanMove(){
  test('testCanMove King ', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'k'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
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

    King king = board.board[0][8];
    King king2 = board.board[5][0];

    var canMove = king.canMove();
    var canMove2 = king2.canMove();
    expect(canMove == false, true );
    expect(canMove2 == true,true);
});
}

testMoves(){
  test('testMoves King', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' ''k'' '' '' '' '' '' '' '
        ' ''P''p''P'' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''p''k''p'' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''P''P''P'' '' '' '' '' '' '' '' '' '' '' '' '
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
    
    King king = board.board[0][8];
    King king2 = board.board[6][8];
    King king3 = board.board[8][2];

    var movesUp = king.movesUp();
    var movesLeft = king.movesLeft();
    var movesDown = king.movesDown();
    var movesRight = king.movesRight();

    var movesUp2 = king2.movesUp();
    var movesLeft2 = king2.movesLeft();
    var movesDown2 = king2.movesDown();
    var movesRight2 = king2.movesRight();

    var movesUp3 = king3.movesUp();
    var movesLeft3 = king3.movesLeft();
    var movesDown3 = king3.movesDown();
    var movesRight3 = king3.movesRight();
    var movesNorthWest3 = king3.movesNorthWest();
    var movesNorthEast3 = king3.movesNorthEast();
    var movesSouthEast3 = king3.movesSouthEast();
    var movesSouthWest3 = king3.movesSouthWest(); 

    expect(movesUp.isEmpty, true);
    expect(movesLeft.isEmpty, true);
    expect(movesDown.isEmpty,true);
    expect(movesRight.isEmpty,true);

    expect(movesUp2.length == 1, true);
    expect(movesLeft2.length == 1, true);
    expect(movesDown2.length == 1,true);
    expect(movesRight2.length == 1,true);

    expect(movesUp3.length == 0, true);
    expect(movesLeft3.length == 0, true);
    expect(movesDown3.length == 1,true);
    expect(movesRight3.length == 0,true);
    expect(movesNorthWest3.length == 1, true);
    expect(movesNorthEast3.length == 1, true);
    expect(movesSouthEast3.length == 1,true);
    expect(movesSouthWest3.length == 1,true);
});

}

