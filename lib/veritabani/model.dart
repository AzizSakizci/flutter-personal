class  Kullanici{
  int no;
  String _isim;
  String _departman;
  String _gorev;

  Kullanici(this._isim,this._departman,this._gorev);

  Kullanici.map(dynamic nesne){
    this._isim=nesne["isim"];
    this._departman=nesne["departman"];
    this._gorev=nesne["gorev"];
  }

  String get isim =>_isim;
  String get departman =>_departman;
  String get gorev =>_gorev;
  

  Map <String ,dynamic> haritaYap(){
    var map=new Map<String,dynamic>();
    map["isim"]=_isim;
    map["departman"]=_departman;
    map["gorev"]=_gorev;
    return map;
    }

  void  numaraVer(int no){
    this.no=no;
  }

}