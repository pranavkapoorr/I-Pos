import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


Connection connection = new Connection();

class Connection {
  static final Connection _connection = new Connection._internal();
  factory Connection() => _connection;
  Connection._internal();
  Socket socket;
  SharedPreferences sp;
  String ip = "";
  int port = 0;
  bool loaded = false;
  

  _loadPlaytime()async{
    loaded = false;
    sp = await SharedPreferences.getInstance().whenComplete(()=>loaded = true);
    ip = sp.getString("ip");
    port = sp.getInt("port");
    print("lodaded ip nd port : $ip and $port");
  }

  initialize() {
    _loadPlaytime();
    if(loaded && ip!=null && port!=null){
      Socket.connect(ip, port).then((Socket sock) {
        socket = sock;
        socket.listen(dataHandler,
            onError: errorHandler,
            onDone: doneHandler,
            cancelOnError: false);
      }).catchError((AsyncError e) {
        print("Unable to connect: $e");
      });
      //Connect standard in to the socket
      stdin.listen((data) =>
          socket.write(new String.fromCharCodes(data).trim() + '\n'));
    }else{
      print("set port and ip first");
    }
  }

  void dataHandler(data) {
    print(new String.fromCharCodes(data).trim());
  }

  void errorHandler(error, StackTrace trace) {
    print(error);
  }

  void doneHandler() {
    socket.destroy();
  }
}