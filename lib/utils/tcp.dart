import 'dart:io';


Connection connection = new Connection();

class Connection {
  static final Connection _connection = new Connection._internal();
  factory Connection() => _connection;
  Connection._internal();
  Socket socket;
  String ip = "";
  int port = 0;



  initialize() {
      connect(ip, port);
  }
  void connect(String ip, int port) async{
    socket = await Socket.connect(ip,port).catchError((e) {
      print("Unable to connect: $e");
    });

    if(socket!=null){
      socket.listen(dataHandler,
          onError: errorHandler,
          onDone: doneHandler,
          cancelOnError: false);
    }
  }

  void writeToConnection(String msg){
    socket.write(msg);
  }
  void dataHandler(data) {
    print(" data -> " +new String.fromCharCodes(data).trim());
  }

  void errorHandler(error, StackTrace trace) {
    print("error ->   $error");
  }

  void doneHandler() {
    socket.destroy();
  }
}