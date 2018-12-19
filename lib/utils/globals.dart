

Globals globals = new Globals();

class Globals {
  static final Globals _globals = new Globals._internal();
  factory Globals() => _globals;
  Globals._internal();

  String sIp, sPort, pIp, pPort;

  set sIP(String sIp){
    this.sIp = sIp;
  }
  set sPORT(String sPort){
    this.sPort = sPort;
  }

  set pIP(String pIp){
    this.pIp = pIp;
  }
  set pPORT(String pPort){
    this.pPort = pPort;
  }

  get sIP => this.sIp;
  get sPORT => this.sPort;
  get pIP => this.pIp;
  get pPORT => this.pPort;

}