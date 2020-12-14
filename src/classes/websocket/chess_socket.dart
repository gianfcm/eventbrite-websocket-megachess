import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import '../../shared/constants/websocket_uri.dart';
import '../game.dart';

class ChessSocket {
  String authToken;
  var channel;
  List<Game> gamesPlaying = [];

  ChessSocket({this.authToken}) {
    start();
  }

  start() {
    channel = IOWebSocketChannel.connect(WS_BASE_URI + authToken);
    channel.stream.listen((message) {
      print(message);
      read_message_from_server(message: message);
    });
    challenge_player(player: '');
  }

  read_message_from_server({dynamic message}) {
    var message_json = json.decode(message) as Map;
    select_method(message: message_json);
  }

  select_method({Map message}) {
    switch (message['event']) {
      case 'ask_challenge':
          accept_challenge(board_id: message['data']['board_id']);
        break;
      case 'your_turn':
        set_game(
          stringBoard: message['data']['board'],
          side: message['data']['actual_turn'],
          board_id: message['data']['board_id'],
          turn_token: message['data']['turn_token'],
        );
        break;
      case 'gameover':
        gameover(
          black_username: message['data']['black_username'],
          white_username: message['data']['white_username'],
          black_score: message['data']['black_score'],
          white_score: message['data']['white_score'],
          board_id: message['data']['board_id'],
        );
        break;
    }
  }

  send({String action, dynamic data}) {
    final message = json.encode({'action': action, 'data': data});
    channel.sink.add(message);
  }

  get_connected_users() {
    send(action: 'get_connected_users', data: '');
  }

  abort({String board_id}) {
    Map<String, String> data = {
      'board_id': board_id,
    };
    send(action: 'abort', data: data);
  }

  challenge_player({String player}) {
    Map<String, String> data = {
      'username': player,
      'message': 'Hola! jugamos una partida?'
    };
    send(action: 'challenge', data: data);
  }

  accept_challenge({String board_id}) {
    Map<String, String> data = {'board_id': '$board_id'};
    send(action: 'accept_challenge', data: data);
  }

  gameover(
      {String board_id,
      String black_username,
      String white_username,
      String black_score,
      String white_score}) {
    write_results(
        black_username: black_username,
        black_score: black_score,
        white_username: white_username,
        white_score: white_score);
    gamesPlaying.removeWhere((element) => element.boardId == board_id);
  }

  write_results(
      {String black_username,
      String white_username,
      String black_score,
      String white_score}) async {
    var file = File('results.txt');
    file.writeAsStringSync(
        'black_username: ${black_username}: [${black_score}]   -   white_username: ${white_username}: [${white_score}]  \n',
        mode: FileMode.append);
  }

  set_game(
      {String stringBoard, String side, String board_id, String turn_token}) {
    print('Active Games: ${gamesPlaying.length}');

    if (gamesPlaying.isEmpty ||
        gamesPlaying.any((element) => element.boardId == board_id) == false) {
      gamesPlaying.add(Game(
          stringBoard: stringBoard,
          side: side,
          boardId: board_id,
          turnToken: turn_token,
          chessSocket: this));
      return;
    }

    for (var game in gamesPlaying) {
      if (game.boardId == board_id) {
        game.setGame(
            stringBoard: stringBoard,
            side: side,
            board_id: board_id,
            turn_token: turn_token,
            chessSocket: this);
        break;
      }
    }
  }

  send_move(
      {String board_id,
      String turn_token,
      int from_row,
      int from_col,
      int to_row,
      int to_col}) {
    Map<String, dynamic> data = {
      'board_id': '$board_id',
      'turn_token': '$turn_token',
      'from_row': from_row,
      'from_col': from_col,
      'to_row': to_row,
      'to_col': to_col,
    };
    send(action: 'move', data: data);
  }
}
