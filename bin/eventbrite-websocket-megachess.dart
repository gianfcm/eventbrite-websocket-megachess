import 'dart:io';

import '../src/classes/websocket/chess_socket.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('please provide your auth_token');
    exit(0); 
  }
  final authToken = arguments[0];
  ChessSocket(authToken: authToken);
}
